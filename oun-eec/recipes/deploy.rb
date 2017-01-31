service "eec-server" do
  provider Chef::Provider::Service::Upstart
  action [:stop]
end

if node["oun-ServiceAPI"]["eec_config"]["git"]["version"] == "dev"
  git node["oun-ServiceAPI"]["eec_config"]["home"] do
    repository node["oun-ServiceAPI"]["eec_config"]["git"]["url"]
    branch node["oun-ServiceAPI"]["eec_config"]["git"]["branch"]
    action :sync
    depth 1
    user "oun"
    group "root"
  end
else
  git node["oun-ServiceAPI"]["eec_config"]["home"] do
    repository node["oun-ServiceAPI"]["eec_config"]["git"]["url"]
    reference node["oun-ServiceAPI"]["eec_config"]["git"]["version"]
    action :sync
    depth 1
    user "oun"
    group "root"
  end
end


template "#{node["oun-ServiceAPI"]["eec_config"]["home"]}/config/config.js" do
	source "config.js.erb"
	owner "oun"
	group "root"
	mode 0444
end

script "npm install" do
	interpreter "bash"
	user "root"
	cwd node["oun-ServiceAPI"]["eec_config"]["home"]
	code "npm install"
end

if node["oun-ServiceAPI"]["eec_config"]["ssl"]["enabled"] == true
  include_recipe "#{cookbook_name}::get-ssl"
end

service "eec-server" do
  provider Chef::Provider::Service::Upstart
  action [:enable,:start]
end
