include_recipe "#{cookbook_name}::install-base-software"
include_recipe "#{cookbook_name}::configure"

directory "/opt/oun/run" do
  owner "oun"
  mode 0755
  action :create
end

template "/etc/init/eec-publisher.conf" do
  source "upstart-eec.conf.erb"
  owner "root"
  group "root"
  mode 0444
end

service "eec-publisher" do
  action  :start
  supports :status => true, :start => true, :stop => true, :restart => true
  provider Chef::Provider::Service::Upstart
end
