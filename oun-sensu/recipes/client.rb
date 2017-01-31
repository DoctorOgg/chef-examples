include_recipe "#{cookbook_name}::basic-checks-client"

include_recipe "sensu::client_service"

# sensu_client node["name"] do
#   address node["ipaddress"]
#   subscriptions node["roles"] + ["all"]
#   additional(:environment => node["chef_environment"])
# end
