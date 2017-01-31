include_recipe "apt"

directory "/root" do
  owner "root"
  group "root"
  mode 0770
end

node["oun"]["packages"].each do |pkg|; package pkg; end

include_recipe "#{cookbook_name}::time"
include_recipe "#{cookbook_name}::sysctl"
include_recipe "#{cookbook_name}::unattended_upgrades"

# if node["platform_version"].to_i  >= 14.04 && node["platform"] == "ubuntu"
#   include_recipe "#{cookbook_name}::sssd"
# else
#   include_recipe "#{cookbook_name}::padl"
# end
include_recipe "#{cookbook_name}::sssd"

template "/etc/skel/.bashrc" do
	source "bashrc.erb"
	owner "root"
	group "root"
	mode 0444
end

template "/root/.bashrc" do
	source "bashrc.erb"
	owner "root"
	group "root"
	mode 0444
end
