
include_recipe "oun-sensu::set-defaults"

sensu_client node.name do
  address node["ipaddress"]
  subscriptions ["#{node.chef_environment}_basic"]
end

include_recipe "oun-sensu::client"
