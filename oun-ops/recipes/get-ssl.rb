certs_bag = data_bag_item(node["oun_ops"]["webserver"]["ssl-databag"],'ssl')

service "apache2" do
	action :nothing
	supports :status => true, :start => true, :stop => true, :restart => true
end

file '/etc/ssl/private/ops.key' do
  owner 'root'
  group 'ssl-cert'
  mode '640'
  action :create
  content certs_bag["key"]
  notifies :restart, "service[apache2]"
end

file '/etc/ssl/certs/ops.pem' do
  owner 'root'
  group 'root'
  mode '644'
  action :create
  content certs_bag["cert"]
  notifies :restart, "service[apache2]"
end

file '/etc/ssl/certs/ops-chain.pem' do
  owner 'root'
  group 'root'
  mode '644'
  action :create
  content certs_bag["chain"]
  notifies :restart, "service[apache2]"
end
