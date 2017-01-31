package 'build-essential' do
 action :install
end

sensu_gem 'sensu-plugins-slack' do
  version '1.0.0'
end

sensu_gem 'sensu-plugins-pagerduty' do
  version '2.0.0'
end

sensu_gem 'sensu-plugins-aws' do
  version '2.0.0'
end

sensu_handler "sns" do
  type "pipe"
  command "/opt/sensu/embedded/bin/handler-sns.rb"
  severities ["ok", "warning", "critical", "unknown"]
end

sensu_handler "slack" do
  type "pipe"
  command "/opt/sensu/embedded/bin/handler-slack.rb"
  severities ["ok", "warning", "critical", "unknown"]
end


sensu_snippet "slack" do
  content(
    :webhook_url => node["oun-sensu"]["notify"]["slack"]["webhook_url"],
    :username => node["oun-sensu"]["notify"]["slack"]["username"],
    :channel => node["oun-sensu"]["notify"]["slack"]["channel"],
    :timeout => node["oun-sensu"]["notify"]["slack"]["timeout"],
    :payload_template => "/etc/sensu/conf.d/slackTemplate.erb"
    )
end

cookbook_file '/etc/sensu/conf.d/slackTemplate.erb' do
  source 'slackTemplate.erb'
  owner 'root'
  group 'sensu'
  mode '0440'
end

sensu_snippet "sns" do
  content(
    :topic_arn => node["oun-sensu"]["notify"]["sns"]["topic_arn"],
    :use_ami_role => false,
    :access_key => node["oun-sensu"]["notify"]["sns"]["access_key"],
    :secret_key => node["oun-sensu"]["notify"]["sns"]["secret_key"]
    )
end
