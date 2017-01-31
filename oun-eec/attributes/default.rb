default["oun-ServiceAPI"]["home_dir"]                                = "/opt/oun"
default["oun-ServiceAPI"]["eec_config"]["home"]                      = "#{node["oun-ServiceAPI"]["home_dir"]}/eec"
default["oun-ServiceAPI"]["eec_config"]["enable_auth_bind"]          = false
default["oun-ServiceAPI"]["eec_config"]["ssl_listen_port"]           = 443
default["oun-ServiceAPI"]["eec_config"]["listen_port"]               = 80
default["oun-ServiceAPI"]["eec_config"]["ssl"]["enabled"]            = false
default["oun-ServiceAPI"]["eec_config"]["ssl"]["ssl_dir"]            = "#{node["oun-ServiceAPI"]["home_dir"]}/ssl"
default["oun-ServiceAPI"]["eec_config"]["ssl"]["databag"]            = "SETME"
default["oun-ServiceAPI"]["eec_config"]["ssl"]["key"]                = "ssl.key"
default["oun-ServiceAPI"]["eec_config"]["ssl"]["cert"]               = "ssl.cert"
default["oun-ServiceAPI"]["eec_config"]["ssl"]["cert_chain_file"]    = "CA.cert"
default["oun-ServiceAPI"]["eec_config"]["ssl"]["ciphers"]            = "ALL:!EXP:!NULL:!ADH:!LOW:!SSLv2:!MD5:!RC4"
default["oun-ServiceAPI"]["eec_config"]["ssl"]["honorCipherOrder"]   = true
default["oun-ServiceAPI"]["eec_config"]["ssl"]["secureProtocol"]     = "TLSv1_method"
default["oun-ServiceAPI"]["eec_config"]["ssl"]["secureOptions"]      = "require('constants').SSL_OP_CIPHER_SERVER_PREFERENCE"
default["oun-ServiceAPI"]["eec_config"]["nodejs_version"]            = "0.10.29"
default["oun-ServiceAPI"]["eec_config"]["nodejs_checksum"]           = "47379d01f765f87c1a1498b4e65de30e45201de50334954860d7375a8258b15d"
default["oun-ServiceAPI"]["eec_config"]["git"]["version"]            = "dev"
default["oun-ServiceAPI"]["eec_config"]["git"]["url"]                = "https://github.com"
default["oun-ServiceAPI"]["eec_config"]["git"]["branch"]             = "master"
default["oun-ServiceAPI"]["eec_config"]["redis_url"]                 = "tcp://redis.local:6379"
default["oun-ServiceAPI"]["eec_config"]["mysql_host"]                = "SETME"
default["oun-ServiceAPI"]["eec_config"]["mysql_port"]                = "3306"
default["oun-ServiceAPI"]["eec_config"]["mysql_username"]            = "SETME"
default["oun-ServiceAPI"]["eec_config"]["mysql_password"]            = "SETME"
default["oun-ServiceAPI"]["eec_config"]["mysql_database"]            = "eec"
default["oun-ServiceAPI"]["eec_config"]["security_redis_dbindex"]    = 1
default["oun-ServiceAPI"]["webapp"]['fqdn']                          = "http://app.local"

default["oun-ServiceAPI"]["eec_config"]["sensu"]["plugin_version"] = "1.0.6"
default["oun-ServiceAPI"]["eec_config"]["sensu"]["plugin_name"]    = "sensu-check-eec-status"