include_recipe "sensu::default"

node.override["sensu"]["version"] = node["oun-sensu"]["sensu"]["version"]
node.override["sensu"]["use_embedded_ruby"] = true
node.override["sensu"]["use_ssl"] = false

node.override["sensu"]["redis"]["host"] = node["oun-sensu"]["redis"]["fqdn"]
node.override["sensu"]["api"]["host"] = node["oun-sensu"]["sensu"]["fqdn"]
node.override["sensu"]["init_style"] = "sysv"

node.override["sensu"]["rabbitmq"]["host"] = node["oun-sensu"]["rabbitmq"]["fqdn"]
node.override["sensu"]["rabbitmq"]["password"] = node["oun-sensu"]["rabbitmq"]["password"]
node.override["sensu"]["rabbitmq"]["port"] = 5672
