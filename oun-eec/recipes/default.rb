include_recipe "oun"

user "oun" do
    uid 600
    home node["oun-ServiceAPI"]["home_dir"]
    system true
    shell "/bin/bash"
    supports :manage_home => true
end

directory node["oun-ServiceAPI"]["eec_config"]["home"] do
  owner "oun"
  group "nogroup"
  mode 0755
  action :create
end

directory "#{node["oun-ServiceAPI"]["home_dir"]}/run" do
  owner "oun"
  group "root"
  mode 0755
  action :create
end


include_recipe "#{cookbook_name}::eec_publisher"
include_recipe "#{cookbook_name}::install-base-software"
include_recipe "#{cookbook_name}::deploy"
include_recipe "#{cookbook_name}::monit"
include_recipe "#{cookbook_name}::sensu-client"
