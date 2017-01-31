include_recipe "oun"
include_recipe "#{cookbook_name}::install-base-software"
include_recipe "#{cookbook_name}::configure"

cron "api-cron" do
  user "oun"
  command "php #{node["oun-ServiceAPI"]["sapi_home_dir"] }/cron/cron.php | /usr/bin/logger"
  only_if do File.exist?("#{node["oun-ServiceAPI"]["sapi_home_dir"] }/cron/cron.php") end
end
include_recipe "#{cookbook_name}::sensu-client"
