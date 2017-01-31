include_recipe "sysctl::default"
sysctl_param 'kernel.randomize_va_space' do
 value 2
 notifies :start, "service[procps]"
end

sysctl_param 'kernel.core_uses_pid' do
 value 1
 notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.conf.all.rp_filter' do
  value 1
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.conf.default.rp_filter' do
  value 1
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.conf.all.accept_source_route' do
  value 0
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.conf.default.accept_source_route' do
  value 0
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.ip_forward' do
  value 0
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.conf.all.send_redirects' do
  value 0
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.conf.default.send_redirects' do
  value 0
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.conf.all.accept_redirects' do
  value 0
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.conf.default.accept_redirects' do
  value 0
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.conf.all.secure_redirects' do
  value 0
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.conf.default.secure_redirects' do
  value 0
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.icmp_echo_ignore_broadcasts' do
  value 1
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.conf.all.log_martians' do
  value 1
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.icmp_ignore_bogus_error_responses' do
  value 1
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.tcp_max_syn_backlog' do
  value 2048
  notifies :start, "service[procps]"
end

sysctl_param 'net.ipv4.tcp_syncookies' do
  value 1
  notifies :start, "service[procps]"
end
