build_file = "#{Chef::Config['file_cache_path']}/#{node["oun_ops"]["genghis"]["build_file"]}"

s3_file build_file do
  not_if do ::File.exists?(build_file) end
  remote_path "#{node["oun_ops"]["genghis"]["s3_build_folder"]}/#{node["oun_ops"]["genghis"]["build_file"]}"
  bucket node["oun_ops"]["genghis"]["s3_builds_bucket"]
  aws_access_key_id node["chef"]["aws_access_key_id"]
  aws_secret_access_key node["chef"]["aws_secret_access_key"]
  mode "0440"
  action :create
end

dpkg_package 'php5-mongo' do
  action :install
  source build_file
end

directory node["oun_ops"]["genghis"]["web_root"] do
  owner 'www-data'
  group 'www-data'
  mode '0750'
  recursive false
  action :create
end

git node["oun_ops"]["genghis"]["web_root"] do
  repository node["oun_ops"]["genghis"]["git_url"]
  action :sync
end
