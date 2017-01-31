include_recipe "oun"
include_recipe "#{cookbook_name}::set-defaults"
include_recipe "sensu::server_service"
include_recipe "sensu::api_service"



sensu_snippet "api" do
  content(
    :host => "127.0.0.1",
    :password => node["oun-sensu"]["sensu"]["api_password"],
    :port => 4567,
    :user => "admin"
    )
end

node.override['uchiwa']['settings']['user'] = 'admin'
node.override['uchiwa']['settings']['pass'] = node["oun-sensu"]["sensu"]["api_password"]
node.override['uchiwa']['settings']['refresh'] = 5
node.override['uchiwa']['settings']['host'] = '0.0.0.0'
node.override['uchiwa']['settings']['port'] = 3000


# APIs Settings
node.override['uchiwa']['api'] = [
  {
    'name' => 'Sensu',
    'user' => 'admin',
    'pass' => node["oun-sensu"]["sensu"]["api_password"],
    'host' => '127.0.0.1',
    'url' => 'http://127.0.0.1:4567',
    'path' => '',
    'ssl' => false,
    'timeout' => 5
  }
]

include_recipe "#{cookbook_name}::notifiers"

include_recipe "uchiwa"
