
include_recipe "oun-sensu::set-defaults"

sensu_gem 'sensu-check-esc' do
  version '1.0.7'
end

sensu_client node.name do
  address node["ipaddress"]
  subscriptions ["#{node.chef_environment}_basic", "#{node.chef_environment}_#{cookbook_name}", "roundrobin:#{node.chef_environment}_#{cookbook_name}"]
end

include_recipe "oun-sensu::client"
