
node["oun-sensu"]["environments"].keys.each do |k|
  # if node["oun-sensu"]["environments"][k].key? "check_ntp"
    myHandlers = node["oun-sensu"]["notify"]["handlers"][k]

    sensu_check "#{k}_check_proc_sshd" do
      only_if { node["oun-sensu"]["environments"][k].key? "check_ssh" }
      command "/opt/sensu/embedded/bin/check-process.rb  -p sshd"
      handlers myHandlers
      subscribers ["#{k}_basic"]
      interval node["oun-sensu"]["environments"][k]["check_ssh"]["interval"]
      additional(:notification => "SSHD Not running", :occurrences => node["oun-sensu"]["environments"][k]["check_ssh"]["occurrences"])
    end

    sensu_check "#{k}_check_proc_ntp" do
      only_if  { node["oun-sensu"]["environments"][k].key? "check_ntp" }
      command "/opt/sensu/embedded/bin/check-process.rb  -p ntpd"
      handlers myHandlers
      subscribers ["#{k}_basic"]
      interval node["oun-sensu"]["environments"][k]["check_ntp"]["interval"]
      additional(:notification => "NTP Not running", :occurrences => node["oun-sensu"]["environments"][k]["check_ntp"]["occurrences"])
    end

    sensu_check "#{k}_check_ntp" do
      only_if  { node["oun-sensu"]["environments"][k].key? "check_ntp" }
      command "/opt/sensu/embedded/bin/check-ntp.rb  -c #{node["oun-sensu"]["environments"][k]["check_ntp"]["drift_crit"]} -w #{node["oun-sensu"]["environments"][k]["check_ntp"]["drift_warn"]}"
      handlers myHandlers
      subscribers ["#{k}_basic"]
      interval node["oun-sensu"]["environments"][k]["check_ntp"]["interval"]
      additional(:notification => "NTP outof sync", :occurrences => node["oun-sensu"]["environments"][k]["check_ntp"]["occurrences"])
    end

    sensu_check "#{k}_check_load" do
      only_if  { node["oun-sensu"]["environments"][k].key? "check_load" }
      command "/opt/sensu/embedded/bin/check-load.rb -p -c #{node["oun-sensu"]["environments"][k]["check_load"]["crit"]} -w #{node["oun-sensu"]["environments"][k]["check_load"]["warn"]}"
      handlers myHandlers
      subscribers ["#{k}_basic"]
      interval node["oun-sensu"]["environments"][k]["check_load"]["interval"]
      additional(:notification => "Load issues", :occurrences => node["oun-sensu"]["environments"][k]["check_load"]["occurrences"])
    end

    sensu_check "#{k}_check_mem" do
      only_if  { node["oun-sensu"]["environments"][k].key? "check_mem" }
      command "/opt/sensu/embedded/bin/check-memory-percent.rb -c #{node["oun-sensu"]["environments"][k]["check_mem"]["crit"]} -w #{node["oun-sensu"]["environments"][k]["check_mem"]["warn"]}"
      handlers myHandlers
      subscribers ["#{k}_basic"]
      interval node["oun-sensu"]["environments"][k]["check_mem"]["interval"]
      additional(:notification => "Load issues", :occurrences => node["oun-sensu"]["environments"][k]["check_mem"]["occurrences"])
    end

    sensu_check "#{k}_check_iowait" do
      only_if  { node["oun-sensu"]["environments"][k].key? "check_iowait" }
      command "/opt/sensu/embedded/bin/check-cpu.rb --iowait -c #{node["oun-sensu"]["environments"][k]["check_iowait"]["crit"]} -w #{node["oun-sensu"]["environments"][k]["check_iowait"]["warn"]}"
      handlers myHandlers
      subscribers ["#{k}_basic"]
      interval node["oun-sensu"]["environments"][k]["check_iowait"]["interval"]
      additional(:notification => "Load issues", :occurrences => node["oun-sensu"]["environments"][k]["check_iowait"]["occurrences"])
    end

    sensu_check "#{k}_check_disk" do
      only_if  { node["oun-sensu"]["environments"][k].key? "check_disk" }
      command "/opt/sensu/embedded/bin/check-disk-usage.rb -x cgroup,tmpfs -c #{node["oun-sensu"]["environments"][k]["check_disk"]["usage_crit"]} -w #{node["oun-sensu"]["environments"][k]["check_disk"]["usage_warn"]} -K #{node["oun-sensu"]["environments"][k]["check_disk"]["inode_crit"]} -W #{node["oun-sensu"]["environments"][k]["check_disk"]["inode_warn"]} "
      handlers myHandlers
      subscribers ["#{k}_basic"]
      interval node["oun-sensu"]["environments"][k]["check_disk"]["interval"]
      additional(:notification => "Load issues", :occurrences => node["oun-sensu"]["environments"][k]["check_disk"]["occurrences"])
    end

end
#sssd
