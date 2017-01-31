%w( sssd-tools sssd ).each do |pkg|
  package pkg
end

if node["platform_version"].to_i  >= 13 && node["platform"] == "ubuntu"
  %w( sssd-ldap ).each do |pkg|
    package pkg
  end
end

package 'nscd' do
 action :remove
end

service 'ssh' do
 start_command "service ssh start"
 restart_command "service ssh restart"
 action :nothing
end

service 'sssd' do
 start_command "service sssd start"
 restart_command "service sssd restart"
 action :nothing
end

cookbook_file "/etc/ssl/certs/#{node["oun"]["ldap"]["ca_cert"]}" do
  source node["oun"]["ldap"]["ca_cert"]
  owner 'root'
  group 'root'
  mode "0444"
end

template '/etc/sssd/sssd.conf' do
  source 'sssd.conf.erb'
  owner 'root'
  group 'root'
  mode 0600
  notifies :restart, "service[sssd]", :immediately
end

template "/etc/nsswitch.conf" do
	source "nsswitch.sssd.conf.erb"
	owner "root"
	group "root"
	mode 0644
end

template "/etc/sudoers" do
	source "sudoers.erb"
	owner "root"
	group "root"
	mode 0440
end

if node["platform_version"].to_i  >= 13 && node["platform"] == "ubuntu"
  template "/etc/ssh/sshd_config" do
  	source "sshd_config.sssd.erb"
  	owner "root"
  	group "root"
  	mode 600
  	notifies :restart, "service[ssh]", :immediately
  end
else
  template "/etc/ssh/sshd_config" do
    source "sshd_config.sssd.old.erb"
    owner "root"
    group "root"
    mode 600
    notifies :restart, "service[ssh]", :immediately
  end
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
