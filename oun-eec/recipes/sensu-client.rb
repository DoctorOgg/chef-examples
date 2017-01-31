
include_recipe "oun-sensu::set-defaults"

sensu_client node.name do
  address node["ipaddress"]
  subscriptions ["#{node.chef_environment}_basic", "#{node.chef_environment}_#{cookbook_name}"]
end

sensu_gem node["oun-ServiceAPI"]["eec_config"]["sensu"]["plugin_name"] do
  version node["oun-ServiceAPI"]["eec_config"]["sensu"]["plugin_version"]
end

include_recipe "oun-sensu::client"
