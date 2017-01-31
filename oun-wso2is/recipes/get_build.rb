build_file = "#{node["oun_wso2is"]["home_dir"]}/builds/#{node["oun_wso2is"]["build_file"]}"
s3_file build_file do
  not_if do ::File.exists?(build_file) end
  remote_path "#{node["oun_wso2is"]["s3_build_folder"]}/#{node["oun_wso2is"]["build_file"]}"
  bucket node["oun_wso2is"]["s3_builds_bucket"]
  aws_access_key_id node["chef"]["aws_access_key_id"]
  aws_secret_access_key node["chef"]["aws_secret_access_key"]
  owner node["oun_wso2is"]["user"]
  mode "0440"
  action :create
end

script "unzip wso2" do
  not_if do ::File.directory?("#{node["oun_wso2is"]["home_dir"]}/#{node["oun_wso2is"]["base_wso2is_dir"]}") end
	interpreter "bash"
	user node["oun_wso2is"]["user"]
	cwd node["oun_wso2is"]["home_dir"]
	code "unzip #{node["oun_wso2is"]["home_dir"]}/builds/#{node["oun_wso2is"]["build_file"]}"
end
