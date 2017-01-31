%w( git-core php5-cli php5-common php5-curl
    php5-gd php5-geoip php5-imagick
    php5-intl php5-mcrypt php5-ming
    php5-xmlrpc php-pear php5-fpm nginx-full).each do |pkg|
  package pkg
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
end

service "php5-fpm" do
  action :stop
  provider Chef::Provider::Service::Upstart if platform?("ubuntu") && node["platform_version"].to_f >= 13.10
end

include_recipe "#{cookbook_name}::get_mongo_driver"
include_recipe 'composer::default'
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
include_recipe "nodejs::nodejs_from_binary"
include_recipe "nodejs::npm"

rbenv_ruby node["oun-ServiceAPI"]["webapp"]["rbenv-version"] do
  ruby_version node["oun-ServiceAPI"]["webapp"]["rbenv-version"]
  global true
end

rbenv_gem "bundler" do
  ruby_version node["oun-ServiceAPI"]["webapp"]["rbenv-version"]
end

rbenv_gem "compass" do
  ruby_version node["oun-ServiceAPI"]["webapp"]["rbenv-version"]
end

script 'update npm' do
  interpreter 'bash'
  user 'root'
  cwd '/tmp'
  code <<-EOF
  npm update npm -g
  EOF
end

nodejs_npm "grunt"
# nodejs_npm "grunt-cli"

group "oun" do
  gid 500
  members 'www-data'
end


user "oun" do
    uid 600
    home node["oun-ServiceAPI"]["home_dir"]
    group 'oun'
    system true
    shell "/bin/bash"
    supports :manage_home => true
end

group "www-data" do
  members 'oun'
end

directory "#{node["oun-ServiceAPI"]["home_dir"]}/var" do
  owner 'oun'
  group 'www-data'
  mode '0755'
  recursive true
  action :create
end

template "/etc/php5/fpm/pool.d/webapp.conf" do
  source "php-fpm-webapp.conf.erb"
  owner "root"
  group "root"
  mode 0444
end

template "/etc/php5/fpm/php.ini" do
  source "nginx-php.ini.erb"
  owner "root"
  group "root"
  mode 0444
end

service "php5-fpm" do
  action :start
  provider Chef::Provider::Service::Upstart if platform?("ubuntu") && node["platform_version"].to_f >= 13.10
end

template "/etc/nginx/sites-available/webapp.conf" do
	source "webapp-nginx.conf.erb"
	owner "root"
	group "root"
	mode 0444
  notifies :restart, 'service[nginx]'
end

template "/etc/nginx/fastcgi.conf" do
	source "fastcgi.conf.erb"
	owner "root"
	group "root"
	mode 0444
  notifies :restart, 'service[nginx]'
end

script 'disable default nginx site' do
  only_if do ::File.symlink?('/etc/nginx/sites-enabled/default') end
  interpreter 'bash'
  user 'root'
  cwd '/tmp'
  code <<-EOF
  rm /etc/nginx/sites-enabled/default
  EOF
  notifies :restart, 'service[nginx]'
end

link '/etc/nginx/sites-enabled/webapp.conf' do
  to '/etc/nginx/sites-available/webapp.conf'
  notifies :restart, 'service[nginx]'
end
