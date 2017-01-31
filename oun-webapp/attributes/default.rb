default["oun-ServiceAPI"]["home_dir"]                                                   = '/opt/oun'

default["oun-ServiceAPI"]["main_config"]["api_baseuri"]                                 = "http://sapi.local/"
default["oun-ServiceAPI"]["main_config"]["webapp_redis_url"]                            = "tcp://redis.local:6379"


default["oun-ServiceAPI"]["webapp"]["mongo_driver"]["mongo_driver_file"]                = "php5-mongo_1.6.11-1_amd64.deb"
default["oun-ServiceAPI"]["webapp"]["mongo_driver"]["s3_builds_bucket"]                 = "oun-builds"
default["oun-ServiceAPI"]["webapp"]["mongo_driver"]["s3_build_folder"]                  = "php_mongo_driver/ubuntu_14.04"

default["oun-ServiceAPI"]["webapp"]["git"]["branch"]                                    = "dev1"
default["oun-ServiceAPI"]["webapp"]["git"]["version"]                                   = "dev"
default["oun-ServiceAPI"]["webapp"]["git"]["git_url"]                                   = "https://github.com/oneuni/EmpoweredWebApp.git"

default["oun-ServiceAPI"]["eec_config"]["fqdn"]                                         = "http://eec.dev.somehost.com:8080"

default["oun-ServiceAPI"]["webapp"]['web_root']                                         = "#{node["oun-ServiceAPI"]["home_dir"]}/webapp"
default["oun-ServiceAPI"]["webapp"]['php-fpm']['file_socket']                           = "#{node["oun-ServiceAPI"]["home_dir"]}/var/php5-fpm.sock"
default["oun-ServiceAPI"]["webapp"]['php-fpm']['post_max_size']                         = '500M'
default["oun-ServiceAPI"]["webapp"]['php-fpm']['memory_limit']                          = '200M'
default["oun-ServiceAPI"]["webapp"]['php-fpm']['upload_max_filesize']                   = '500M'
default["oun-ServiceAPI"]["webapp"]["rbenv-version"]                                    = "1.9.3-p448"
default["oun-ServiceAPI"]["webapp"]['fqdn']                                             = "http://app.local"
default["oun-ServiceAPI"]["webapp"]["api_key"]                                          = "SETME"
default["oun-ServiceAPI"]["webapp"]["app_id"]                                           = "webapp_v1"
default["oun-ServiceAPI"]["webapp"]["redisSessionDatabase"]                             = 1
default["oun-ServiceAPI"]["webapp"]["env"]                                              = "prod"
default["oun-ServiceAPI"]["webapp"]["wso2_login_url"]                                   = "https://idr.local/commonauth"


##################################################
# Viddler
##################################################
default["oun-ServiceAPI"]["viddler"]["viddlerUsername"]                                 = "SETME"
default["oun-ServiceAPI"]["viddler"]["viddlerPassword"]                                 = "SETME"
default["oun-ServiceAPI"]["viddler"]["viddlerApiKey"]                                   = "SETME"

##################################################
# Features
##################################################
default["oun-ServiceAPI"]["webapp"]["features"]["feature_login_lookup_redirect_in_esc"] = false
default["oun-ServiceAPI"]["webapp"]["features"]["feature_blogs"]                        = true
default["oun-ServiceAPI"]["webapp"]["features"]["feature_settings"]                     = true
default["oun-ServiceAPI"]["webapp"]["features"]["feature_course_list"]                  = true
default["oun-ServiceAPI"]["webapp"]["features"]["feature_profile"]                      = true
default["oun-ServiceAPI"]["webapp"]["features"]["feature_notification"]                 = true
default["oun-ServiceAPI"]["webapp"]["features"]["feature_gradebook"]                    = true
default["oun-ServiceAPI"]["webapp"]["features"]["feature_groups"]                       = true
default["oun-ServiceAPI"]["webapp"]["features"]["feature_whatsnext"]                    = true
default["oun-ServiceAPI"]["webapp"]["features"]["feature_supportcases"]                 = true
default["oun-ServiceAPI"]["webapp"]["features"]["feature_messages"]                     = true
default["oun-ServiceAPI"]["webapp"]["features"]["feature_studygroups"]                  = true
default["oun-ServiceAPI"]["webapp"]["features"]["feature_studygroupdiscussions"]        = true
default["oun-ServiceAPI"]["webapp"]["features"]["feature_notes"]                        = true
default["oun-ServiceAPI"]["webapp"]["features"]["feature_analytics"]                    = false
default["oun-ServiceAPI"]["webapp"]["features"]["feature_note_taking"]                  = false
