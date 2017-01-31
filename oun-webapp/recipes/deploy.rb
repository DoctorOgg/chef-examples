directory node["oun-ServiceAPI"]["webapp"]['web_root'] do
  owner 'oun'
  group 'www-data'
  mode '0750'
  recursive true
  action :create
end

git node["oun-ServiceAPI"]["webapp"]['web_root'] do
  only_if { node["oun-ServiceAPI"]["webapp"]["git"]["version"] == "dev" && !Chef::Config[:solo] }
  repository node["oun-ServiceAPI"]["webapp"]["git"]["git_url"]
  branch node["oun-ServiceAPI"]["webapp"]["git"]["branch"]
  user "oun"
  group "www-data"
end

git node["oun-ServiceAPI"]["webapp"]['web_root'] do
  only_if { node["oun-ServiceAPI"]["webapp"]["git"]["version"] != "dev" && !Chef::Config[:solo] }
  repository node["oun-ServiceAPI"]["webapp"]["git"]["git_url"]
  reference node["oun-ServiceAPI"]["webapp"]["git"]["version"]
  user "oun"
  group "www-data"
end

# Run Composer
script "Run Composer" do
  not_if do ::File.exists?("#{node["oun-ServiceAPI"]["webapp"]['web_root']}/config/config.php") end
	interpreter "bash"
	user "root"
	cwd node["oun-ServiceAPI"]["webapp"]['web_root']
	code "composer install"
end

# Create the webapp config.php file based on the template
template "#{node["oun-ServiceAPI"]["webapp"]['web_root']}/config/config.php" do
	source "webapp-config.php.conf.erb"
	owner "oun"
	group "www-data"
	mode 0440
end

script "npm install" do
	interpreter "bash"
	user "root"
	cwd node["oun-ServiceAPI"]["webapp"]['web_root']
	code "npm install"
end

script "Run Grunt" do
  only_if {
    if ( File.exists? "#{node["oun-ServiceAPI"]["webapp"]['web_root']}/package.json" and ( File.exists? "#{node["oun-ServiceAPI"]["webapp"]['web_root']}/Gruntfile.js" or File.exists? "#{node["oun-ServiceAPI"]["webapp"]['web_root']}/Gruntfile.coffee" ) )
    true
  else
    false
  end
  }
	interpreter "bash"
	user "root"
	cwd node["oun-ServiceAPI"]["webapp"]['web_root']
	code " bash -ls -c 'grunt build' "
end
