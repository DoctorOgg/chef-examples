include_recipe "oun"


include_recipe "#{cookbook_name}::mongo-client"
include_recipe "#{cookbook_name}::chefdk"
include_recipe "#{cookbook_name}::sqlclients"
include_recipe "#{cookbook_name}::redisclients"
include_recipe "#{cookbook_name}::webserver"
include_recipe "#{cookbook_name}::ruby"
include_recipe "#{cookbook_name}::aws-tools"


include_recipe "oun-sensu::set-defaults"

sensu_client node.name do
  address node["ipaddress"]
  subscriptions ["base_basic"]
end

include_recipe "oun-sensu::client"
