include_recipe "sensu"

node["oun-sensu"]["environments"].keys.each do |k|
    myHandlers = node["oun-sensu"]["notify"]["handlers"][k]
    myMetrics = node["oun-sensu"]["metrics"]["handlers"][k]

    if node["oun-sensu"]["environments"][k].key? cookbook_name

      sensu_check "#{k}_#{cookbook_name}_check_proc_java" do
        command "/opt/sensu/embedded/bin/check-process.rb  -p java"
        handlers myHandlers
        subscribers ["#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        additional(:notification => "WSO2 Not running", :occurrences => node["oun-sensu"]["environments"][k][cookbook_name]["occurrences"])
      end

      sensu_check "#{k}_#{cookbook_name}_check_port_tcp_80" do
        command "/opt/sensu/embedded/bin/check-ports.rb -h localhost -p 80"
        handlers myHandlers
        subscribers ["#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        additional(:notification => "WSO2 Not listing on port 80", :occurrences => node["oun-sensu"]["environments"][k][cookbook_name]["occurrences"])
      end

      ## metrics
      sensu_check "#{k}_#{cookbook_name}_metrics_percent_load" do
        command "/opt/sensu/embedded/bin/metrics-cpu-pcnt-usage.rb"
        handlers myMetrics
        subscribers ["#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        type "metric"
      end

      sensu_check "#{k}_#{cookbook_name}_metrics_percent_memory" do
        command "/opt/sensu/embedded/bin/metrics-memory-percent.rb"
        handlers myMetrics
        subscribers ["#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        type "metric"
      end

      sensu_check "#{k}_#{cookbook_name}_metrics_network" do
        command "/opt/sensu/embedded/bin/metrics-net.rb"
        handlers myMetrics
        subscribers ["#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        type "metric"
      end

      sensu_check "#{k}_#{cookbook_name}_metrics_processes-threads-count" do
        command "/opt/sensu/embedded/bin/metrics-processes-threads-count.rb"
        handlers myMetrics
        subscribers ["#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        type "metric"
      end

      sensu_check "#{k}_#{cookbook_name}_metrics_disk" do
        command "/opt/sensu/embedded/bin/metrics-disk.rb"
        handlers myMetrics
        subscribers ["#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        type "metric"
      end

      sensu_check "#{k}_#{cookbook_name}_metrics_disk_usage" do
        command "/opt/sensu/embedded/bin/metrics-disk-usage.rb"
        handlers myMetrics
        subscribers ["#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        type "metric"
      end

    end


end
