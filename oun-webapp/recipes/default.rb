include_recipe "oun"
include_recipe "#{cookbook_name}::configure"
include_recipe "#{cookbook_name}::deploy"
include_recipe "#{cookbook_name}::sensu-client"
