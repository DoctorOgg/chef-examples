template "/etc/init.d/wso2is" do
  source 'sysv-init-wso2is.erb'
  owner 'root'
  group 'root'
  mode 0550
end

full_path_wso2 = "#{node["oun_wso2is"]["home_dir"]}/#{node["oun_wso2is"]["base_wso2is_dir"]}"

template "#{full_path_wso2}/repository/conf/tomcat/catalina-server.xml" do
  source 'catalina-server.xml.erb'
  owner node["oun_wso2is"]["user"]
  group 'root'
  mode 0440
end

template "#{full_path_wso2}/repository/conf/datasources/master-datasources.xml" do
  source 'master-datasources.xml.erb'
  owner node["oun_wso2is"]["user"]
  group 'root'
  mode 0440
end
template "#{full_path_wso2}/repository/conf/email/email-admin-config.xml" do
  source 'email-admin-config.xml.erb'
  owner node["oun_wso2is"]["user"]
  group 'root'
  mode 0440
end

template "#{full_path_wso2}/repository/conf/user-mgt.xml" do
  source 'user-mgt.xml.erb'
  owner node["oun_wso2is"]["user"]
  group 'root'
  mode 0440
end

template "#{full_path_wso2}/repository/conf/carbon.xml" do
  source 'carbon.xml.erb'
  owner node["oun_wso2is"]["user"]
  group 'root'
  mode 0440
end


if Chef::Config[:solo]
  Chef::Log.warn('This recipe uses search. Chef Solo does not support search.')
  backend_nodes_list = []
else
  backend_nodes_list = search(:node, "chef_environment:#{node.chef_environment} AND role:idr").sort_by{ |n| n.name }
end

template "#{full_path_wso2}/repository/conf/axis2/axis2.xml" do
  source 'axis2.xml.erb'
  owner node["oun_wso2is"]["user"]
  group 'root'
  mode 0440
  variables(:backend_nodes => backend_nodes_list);
end

template "#{full_path_wso2}/repository/conf/identity.xml" do
  source 'identity.xml.erb'
  owner node["oun_wso2is"]["user"]
  group 'root'
  mode 0440
end

template "#{full_path_wso2}/repository/conf/security/identity-mgt.properties" do
  source 'identity-mgt.properties.erb'
  owner node["oun_wso2is"]["user"]
  group 'root'
  mode 0440
end

template "#{full_path_wso2}/repository/conf/security/application-authentication.xml" do
  source 'application-authentication.xml.erb'
  owner node["oun_wso2is"]["user"]
  group 'root'
  mode 0440
end

file "/etc/authbind/byport/#{node["oun_wso2is"]["http_port"]}" do
  owner node["oun_wso2is"]["user"]
  group 'root'
  mode '0755'
  action :touch
end

file "/etc/authbind/byport/#{node["oun_wso2is"]["https_port"]}" do
  owner node["oun_wso2is"]["user"]
  group 'root'
  mode '0755'
  action :touch
end

cookbook_file "#{full_path_wso2}/repository/components/lib/mysql-connector-java-5.1.34-bin.jar" do
  owner node["oun_wso2is"]["user"]
  source "mysql-connector-java-5.1.34-bin.jar"
  mode 0440
end

# cookbook_file "#{full_path_wso2}/repository/components/lib/axis2-transport-tcp-1.7.3.jar" do
#   owner node["oun_wso2is"]["user"]
#   source "axis2-transport-tcp-1.7.3.jar"
#   mode 0440
# end
