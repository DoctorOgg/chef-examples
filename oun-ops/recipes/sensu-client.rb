include_recipe "oun-sensu::set-defaults"
node.override["sensu"]["version"] = node["oun-sensu"]["sensu"]["version"]
node.override["sensu"]["use_embedded_ruby"] = true
node.override["sensu"]["use_ssl"] = false

sensu_client node.name do
  address node["ipaddress"]
  subscriptions ["#{node.chef_environment}_basic", "#{node.chef_environment}_#{cookbook_name}"]
end

build_file = "#{Chef::Config['file_cache_path']}/#{node["canvas"]["sensu"]["build_file"]}"
s3_file build_file do
  not_if do ::File.exists?(build_file) end
  remote_path "#{node["canvas"]["s3_build_folder"]}/#{node["canvas"]["sensu"]["build_file"]}"
  bucket node["canvas"]["s3_builds_bucket"]
  aws_access_key_id node["chef"]["aws_access_key_id"]
  aws_secret_access_key node["chef"]["aws_secret_access_key"]
  mode "0440"
  action :create
end
#
# gem_package "sensu-plugins-canvas-queue" do
#  version node["canvas"]["sensu"]["plugin_version"]
#  source build_file
# end

script 'install check' do
  interpreter 'bash'
  user 'root'
  cwd '/tmp'
  code <<-EOF
  gem install #{build_file} --no-ri --no-rdoc
  rbenv rehash
  EOF
end

include_recipe "oun-sensu::client"
