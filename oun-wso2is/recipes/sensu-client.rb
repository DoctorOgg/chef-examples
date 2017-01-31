include_recipe "oun-sensu::set-defaults"
node.override["sensu"]["version"] = node["oun-sensu"]["sensu"]["version"]
node.override["sensu"]["use_embedded_ruby"] = true
node.override["sensu"]["use_ssl"] = false

sensu_client node.name do
  address node["ipaddress"]
  subscriptions ["#{node.chef_environment}_basic", "#{node.chef_environment}_#{cookbook_name}"]
end



include_recipe "oun-sensu::client"
