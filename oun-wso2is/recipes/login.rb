# /repository/deployment/server/webapps/authenticationendpoint/login.jsp
case node.chef_environment
when "prod1"
  cookbook_file "#{node["oun_wso2is"]["home_dir"]}/#{node["oun_wso2is"]["base_wso2is_dir"]}/repository/deployment/server/webapps/authenticationendpoint/login.jsp" do
    source "login.jsp.prod"
    owner node["oun_wso2is"]["user"]
    group 'root'
    mode '0644'
  end
when "stage1"
  cookbook_file "#{node["oun_wso2is"]["home_dir"]}/#{node["oun_wso2is"]["base_wso2is_dir"]}/repository/deployment/server/webapps/authenticationendpoint/login.jsp" do
    source "login.jsp.stage"
    owner node["oun_wso2is"]["user"]
    group 'root'
    mode '0644'
  end
else
  cookbook_file "#{node["oun_wso2is"]["home_dir"]}/#{node["oun_wso2is"]["base_wso2is_dir"]}/repository/deployment/server/webapps/authenticationendpoint/login.jsp" do
    source "login.jsp.dev"
    owner node["oun_wso2is"]["user"]
    group 'root'
    mode '0644'
  end
end
