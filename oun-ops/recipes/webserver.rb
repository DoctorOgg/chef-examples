%w( apache2 libapache2-mod-php5 libapache2-mod-authz-unixgroup libapache2-mod-authnz-external pwauth).each do |pkg|
  package pkg
end

include_recipe "#{cookbook_name}::get-ssl"

service "apache2" do
	action :nothing
	supports :status => true, :start => true, :stop => true, :restart => true
end

directory node["oun_ops"]["webserver"]["web_root"] do
  owner 'www-data'
  group 'www-data'
  mode '0750'
  recursive true
  action :create
end

script "Enable apache module ssl" do
  not_if do ::File.symlink?('/etc/apache2/mods-enabled/ssl.load') end
  interpreter "bash"
	user "root"
	cwd "/tmp"
	code "a2enmod ssl"
  notifies :restart, "service[apache2]"
end

script "Enable apache module http proxy" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code "a2enmod proxy_http"
  notifies :restart, "service[apache2]"
end

script "Enable apache module rewrite" do
  not_if do ::File.symlink?('/etc/apache2/mods-enabled/rewrite.load') end
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code "a2enmod rewrite"
  notifies :restart, "service[apache2]"
end

script "Disable Default apache site" do
  only_if do ::File.symlink?('/etc/apache2/sites-enabled/000-default.conf') end
  interpreter "bash"
	user "root"
	cwd "/tmp"
	code "rm /etc/apache2/sites-enabled/000-default.conf"
  notifies :restart, "service[apache2]"
end


template '/etc/apache2/sites-available/ops.conf' do
  source 'apache-site-ops.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, "service[apache2]"
end

include_recipe "#{cookbook_name}::genghis" do
  only_if node["oun_ops"]["genghis"]["enable"] == true
end

script "Enable apache site" do
  not_if do ::File.symlink?('/etc/apache2/sites-enabled/ops.conf') end
  interpreter "bash"
	user "root"
	cwd "/tmp"
	code "a2ensite ops"
  notifies :restart, "service[apache2]"
end
