certs_bag = data_bag_item(node["oun-ServiceAPI"]["eec_config"]["ssl"]["databag"],'ssl')

directory node["oun-ServiceAPI"]["eec_config"]["ssl"]["ssl_dir"] do
  owner "oun"
  group "nogroup"
  mode 0750
  action :create
end

service "eec-server" do
  provider Chef::Provider::Service::Upstart
end

file "#{node["oun-ServiceAPI"]["eec_config"]["ssl"]["ssl_dir"]}/#{node["oun-ServiceAPI"]["eec_config"]["ssl"]["key"]}" do
  owner 'oun'
  group 'nogroup'
  mode '640'
  action :create
  content certs_bag["key"]
  notifies :restart, "service[eec-server]"
end

file "#{node["oun-ServiceAPI"]["eec_config"]["ssl"]["ssl_dir"]}/#{node["oun-ServiceAPI"]["eec_config"]["ssl"]["cert"]}" do
  owner 'oun'
  group 'nogroup'
  mode '640'
  action :create
  content certs_bag["cert"]
  notifies :restart, "service[eec-server]"
end

file "#{node["oun-ServiceAPI"]["eec_config"]["ssl"]["ssl_dir"]}/#{node["oun-ServiceAPI"]["eec_config"]["ssl"]["cert_chain_file"]}" do
  owner 'oun'
  group 'nogroup'
  mode '640'
  action :create
  content certs_bag["chain"]
  notifies :restart, "service[eec-server]"
end
