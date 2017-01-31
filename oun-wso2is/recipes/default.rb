include_recipe "oun"

%w( unzip authbind mysql-client ).each do |pkg|
  package pkg
end

user node["oun_wso2is"]["user"] do
    uid node["oun_wso2is"]["uid"]
    home node["oun_wso2is"]["home_dir"]
    system true
    shell "/bin/bash"
    supports :manage_home => true
end

directory "#{node["oun_wso2is"]["home_dir"]}/builds" do
  owner node["oun_wso2is"]["user"]
  mode 0770
  action :create
  recursive true
end

include_recipe "#{cookbook_name}::install_java"
include_recipe "#{cookbook_name}::get_build"
include_recipe "#{cookbook_name}::configure"
include_recipe "#{cookbook_name}::login"

service "wso2is" do
	action :start
end
