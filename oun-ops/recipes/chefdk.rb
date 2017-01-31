remote_file "#{Chef::Config[:file_cache_path]}/#{node["oun_ops"]["chefdk"]["source_url"].split('/')[-1]}" do
    source node["oun_ops"]["chefdk"]["source_url"]
    action :create
end

dpkg_package "chefdk" do
    source "#{Chef::Config[:file_cache_path]}/#{node["oun_ops"]["chefdk"]["source_url"].split('/')[-1]}"
    action :install
end
