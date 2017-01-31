default["oun"]["ldap"]["uri"]            = ["ldap://ds1.oneuni.net:10389","ldap://ds2.oneuni.net:10389"]
default["oun"]["ldap"]["search_base"]    = "dc=oneuni,dc=net"
default["oun"]["ldap"]["master_uri"]     = "ldap://ds1.oneuni.net:10389"
default["oun"]["ldap"]["bind_dn"]        = "SETME"
default["oun"]["ldap"]["bind_dn_pass"]   = "SETME"
default["oun"]["ldap"]["sshkey_attr"]    = "sshPublicKey"
default["oun"]["ldap"]["ca_cert"]        = "oun_internal_ca.pem"
default["oun"]["sudoers_groups"]         = ["admin","sudo"]
default["oun"]["sudoers_users"]          = []
default["oun"]["enable_ssh_group_limit"] = true
default["oun"]["ssh_allowd_groups"]      = ["ldap_ssh_enabled","admin","sudo"]


default["oun"]["packages"]               = [ "vim-nox", "htop", "git-core" ,"links", "joe", "zip", "unzip", "sysstat", "curl", "screen", "nullmailer", "fail2ban"]
default["oun"]["locale"]                 = "en_US.utf8"
default["oun"]["timezone"]               = "Etc/GMT"
default["oun"]["ntp_servers"]       = [ "0.north-america.pool.ntp.org", "1.north-america.pool.ntp.org", "2.north-america.pool.ntp.org", "3.north-america.pool.ntp.org" ]
default["service"]                  = node.chef_environment
