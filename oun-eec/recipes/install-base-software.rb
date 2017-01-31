%w( git-core php5-adodb php5-cli php5-common php5-curl php5-gd
   php5-imagick php5-ldap php5-intl php5-mcrypt php5-ming
   php5-mysql php-pear php5-tidy php5-xmlrpc authbind
   python-oauth mcrypt ).each do |pkg|
  package pkg
end


template "/etc/init/eec-server.conf" do
  source "eec-server.conf.erb"
  owner "root"
  group "root"
  mode 0444
end

node.override['nodejs']['version'] = node["oun-ServiceAPI"]["eec_config"]["nodejs_version"]
node.override['nodejs']['source']['checksum'] = node["oun-ServiceAPI"]["eec_config"]["nodejs_checksum"]
node.override['nodejs']['install_method'] = 'source'
include_recipe "nodejs"


#if we have authbind enabled, touch the file to enable port 80
file "/etc/authbind/byport/80" do
  only_if { node["oun-ServiceAPI"]["eec_config"]["enable_auth_bind"] == true }
    owner 'oun'
    group 'root'
    mode '0755'
    action :touch
  end

#if we have authbind enabled, touch the file to enable port 443
file "/etc/authbind/byport/443" do
  only_if { node["oun-ServiceAPI"]["eec_config"]["enable_auth_bind"] == true }
    owner 'oun'
    group 'root'
    mode '0755'
    action :touch
  end
