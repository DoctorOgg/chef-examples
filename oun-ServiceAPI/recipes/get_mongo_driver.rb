s3_file "#{Chef::Config['file_cache_path']}/#{node["oun-ServiceAPI"]["mongo_driver_file"]}" do
  remote_path "#{node["oun-ServiceAPI"]["s3_build_folder"]}/#{node["oun-ServiceAPI"]["mongo_driver_file"]}"
  bucket node["oun-ServiceAPI"]["s3_builds_bucket"]
  aws_access_key_id node["chef"]["aws_access_key_id"]
  aws_secret_access_key node["chef"]["aws_secret_access_key"]
  owner "root"
  group "root"
  mode "0440"
  action :create
end

dpkg_package "php5-mongo" do
  source "#{Chef::Config['file_cache_path']}/#{node["oun-ServiceAPI"]["mongo_driver_file"]}"
  action :install
end
