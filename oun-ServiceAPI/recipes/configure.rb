
if node["oun-ServiceAPI"]["git"]["api_version"] == "dev"
  git node["oun-ServiceAPI"]["sapi_home_dir"]  do
    repository node["oun-ServiceAPI"]["git"]["url"]
    branch node["oun-ServiceAPI"]["git"]["branch"]
    user "oun"
		group "www-data"
  end
else
  git node["oun-ServiceAPI"]["sapi_home_dir"]  do
    repository node["oun-ServiceAPI"]["git"]["url"]
    reference node["oun-ServiceAPI"]["git"]["api_version"]
    user "oun"
		group "www-data"
  end
end

script "Run Composer" do
  only_if do ::File.exists?("#{node["oun-ServiceAPI"]["sapi_home_dir"]}/composer.json") end
	interpreter "bash"
	user "root"
	cwd node["oun-ServiceAPI"]["sapi_home_dir"]
	code "composer install && composer update"
end

template "#{node["oun-ServiceAPI"]["sapi_home_dir"]}/config/config.php" do
	source "api-config.php.conf.erb"
	owner "oun"
	group "www-data"
	mode 0440
  variables :zendesk_newticketparams => node["oun-ServiceAPI"]["zendesk"]["newticketparams"].to_json.gsub("\"","\\\"")
end

template "#{node["oun-ServiceAPI"]["sapi_home_dir"]}/config/tenants/admin.conf.php" do
  source "admin.conf.php.erb"
  variables :config => node["oun-ServiceAPI"]["admin"]
  owner "oun"
  group "www-data"
  mode 0440
end

node["oun-ServiceAPI"]["tenants"].each do |tenant|
  template "#{node["oun-ServiceAPI"]["sapi_home_dir"]}/config/tenants/#{tenant["tenant_id"]}.conf.php" do
    source "tenant.conf.php.erb"
    variables :config => tenant
    owner "oun"
		group "www-data"
    mode 0440
  end
end
