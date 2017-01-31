include_recipe "oun"
include_recipe "#{cookbook_name}::install-base-software"
include_recipe "#{cookbook_name}::configure"

%w( apache2 libapache2-mod-php5 ).each do |pkg|
  package pkg
end

service "apache2" do
  action :nothing
  supports :status => true, :start => true, :stop => true, :restart => true
end

#enable php5 mcrypt module
script "Enable MCrypt" do
  code "/usr/sbin/php5enmod -s ALL mcrypt"
	interpreter "bash"
	user "root"
	cwd "/tmp"
end

script "Enable apache module rewrite" do
  not_if do ::File.symlink?('/etc/apache2/mods-enabled/rewrite.load') end
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code "a2enmod rewrite"
end

if node["platform_version"].to_i  >= 13
  script "disable 000-default" do
    only_if do ::File.symlink?('/etc/apache2/sites-enabled/000-default.conf') end
    interpreter "bash"
    user "root"
    cwd "/tmp"
    code "a2dissite 000-default"
  end
  script "disable supid negotiation module" do
    only_if do ::File.symlink?('/etc/apache2/mods-enabled/negotiation.load') end
    interpreter "bash"
    user "root"
    cwd "/tmp"
    code "a2dismod negotiation"
  end
else
  script "disable 000-default PRE 14.04" do
    only_if do ::File.symlink?('/etc/apache2/sites-enabled/000-default.conf')  end
    interpreter "bash"
    user "root"
    cwd "/tmp"
    code "a2dissite default"
  end
end

template "/etc/apache2/sites-available/sapi-apache.conf" do
  source "api-apache.conf.erb"
  owner "root"
  group "root"
  mode 0444
  notifies :restart, "service[apache2]"
end

script "Enable apache config" do
  not_if do ::File.symlink?('/etc/apache2/sites-enabled/sapi-apache.conf') end
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code "a2ensite sapi-apache.conf"
  notifies :restart, "service[apache2]"
end
include_recipe "#{cookbook_name}::sensu-client"
include_recipe "#{cookbook_name}::logrotate"
