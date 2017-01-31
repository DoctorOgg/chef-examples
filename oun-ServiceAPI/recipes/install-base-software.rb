%w( git-core  python-oauth
   php5-cli php5-adodb  php5-common php5-curl php5-gd
   php5-geoip php5-imagick php5-imap php5-intl php5-ldap
   php5-intl php5-mcrypt php5-ming php5-mysql php5-tidy
   php5-xmlrpc php-pear mcrypt).each do |pkg|
  package pkg
end

include_recipe 'composer::default'
include_recipe "#{cookbook_name}::get_mongo_driver"

script 'Update Composer' do
  interpreter 'bash'
  user 'root'
  cwd '/tmp'
  code <<-EOF
  /usr/local/bin/composer self-update
  EOF
end

user "oun" do
    uid 600
    home node["oun-ServiceAPI"]["home_dir"]
    system true
    shell "/bin/bash"
    supports :manage_home => true
end

directory "#{node["oun-ServiceAPI"]["home_dir"]}/bin" do
  owner 'oun'
  group 'root'
  mode '0750'
  action :create
end

directory "#{node["oun-ServiceAPI"]["home_dir"]}/logs" do
  owner 'oun'
  group 'www-data'
  mode '0750'
  action :create
end

directory node["oun-ServiceAPI"]["sapi_home_dir"] do
  owner 'oun'
  group 'www-data'
  mode '0750'
  action :create
end

template "#{node["oun-ServiceAPI"]["home_dir"]}/bin/sapi-version" do
  source 'sapi-version.erb'
  owner 'oun'
  group 'root'
  mode '0555'
end
