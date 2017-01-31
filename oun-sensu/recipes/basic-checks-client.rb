package 'build-essential' do
 action :install
end

sensu_gem 'sensu-plugins-aws' do
  version '2.0.0'
end

sensu_gem 'sensu-plugins-vmstats' do
  version '1.0.0'
end

sensu_gem 'sensu-plugins-filesystem-checks' do
  version '0.2.0'
end

sensu_gem 'sensu-plugins-ntp' do
  version '0.0.4'
end

sensu_gem 'sensu-plugins-load-checks' do
  version '1.0.0'
end

sensu_gem 'sensu-plugins-network-checks' do
  version '1.0.0'
end

sensu_gem 'sensu-plugins-cpu-checks' do
  version '1.0.0'
end

sensu_gem 'sensu-plugins-memory-checks' do
  version '1.0.2'
end

sensu_gem 'sensu-plugins-disk-checks' do
  version '2.0.1'
end

sensu_gem 'sensu-plugins-disk-checks' do
  version '2.0.1'
end

sensu_gem 'sensu-plugins-process-checks' do
  version '1.0.0'
end

sensu_gem 'sensu-plugins-ssl' do
  version '1.0.0'
end
