
%w( ldap-auth-client nscd ldap-utils).each do |pkg|
  package pkg
end

cookbook_file "/etc/ssl/certs/#{node["oun"]["ldap"]["ca_cert"]}" do
  source node["oun"]["ldap"]["ca_cert"]
  owner 'root'
  group 'root'
  mode "0444"
end

service 'ssh' do
 start_command "service ssh start"
 restart_command "service ssh restart"
 action :nothing
end

service "nscd" do
	action :nothing
	supports :status => true, :start => true, :stop => true, :restart => true
end

template "/etc/ldap.conf" do
	source "etc-ldap.conf.erb"
	owner "root"
	group "root"
	mode 0644
	notifies :restart, "service[nscd]", :immediately
end

template "/etc/ldap/ldap.conf" do
	source "etc-ldap-ldap.conf.erb"
	owner "root"
	group "root"
	mode 0644
	notifies :restart, "service[nscd]", :immediately
end

template "/etc/nsswitch.conf" do
	source "nsswitch.ldap.conf.erb"
	owner "root"
	group "root"
	mode 0644
	notifies :restart, "service[nscd]", :immediately
end

template "/etc/sudoers" do
	source "sudoers.erb"
	owner "root"
	group "root"
	mode 0440
end

template "/usr/share/pam-configs/my_mkhomedir" do
	source "my_mkhomedir.erb"
	owner "root"
	group "root"
	mode 0644
end

script "update-pam" do
	interpreter "bash"
	user "root"
	cwd "/tmp"
	code <<-EOH
		/usr/sbin/pam-auth-update --force --package
	EOH
end

template "etc/ssh/sshd_config" do
	source "sshd_config.ldap.erb"
	owner "root"
	group "root"
	mode 0644
	notifies :restart, "service[ssh]", :immediately
	notifies :restart, "service[nscd]", :immediately
end
