default["oun_ops"]["chefdk"]["source_url"]           = "https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.15.15-1_amd64.deb"

default["oun_ops"]["genghis"]["enable"]              = true
default["oun_ops"]["genghis"]["web_root"]            = "/srv/genghis"
default["oun_ops"]["genghis"]["build_file"]          = "php5-mongo_1.6.14-1_amd64.deb"
default["oun_ops"]["genghis"]["s3_build_folder"]     = "php_mongo_driver/ubuntu_14.04"
default["oun_ops"]["genghis"]["s3_builds_bucket"]    = "oun-builds"
default["oun_ops"]["genghis"]["git_url"]             = "https://github.com/oneuni/genghis.git"

default["oun_ops"]["webserver"]["web_root"]          = "/srv/ops-webroot"
default["oun_ops"]["webserver"]["authorized_groups"] = ["ldap_ssh_enabled"]
default["oun_ops"]["webserver"]["ssl-databag"]       = "star-oneuni-net-ssl"
default["oun_ops"]["ruby"]["ruby_version"]           = "2.2.5"
default["oun_ops"]["aws-tools"]["aws_checksum"]      = "f8061e699f2dd82bc4ea0a06b76d99f411aee5bbe0afb77710c715e9be9fedc3"
default["oun_ops"]["EndlessWaffleURL"]               = "https://ew.oneuni.net"
