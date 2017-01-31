include_recipe "sensu"

node["oun-sensu"]["environments"].keys.each do |k|
    myHandlers = node["oun-sensu"]["notify"]["handlers"][k]
    myMetrics = node["oun-sensu"]["metrics"]["handlers"][k]

    if node["oun-sensu"]["environments"][k].key? cookbook_name
      esc_token = node["oun-sensu"]["environments"][k][cookbook_name]["esc"]["token"]
      esc_endpoint_url = node["oun-sensu"]["environments"][k][cookbook_name]["esc"]["endpoint_url"]

      ### Esc service Checks
      sensu_check "#{k}_#{cookbook_name}_check_esc_api_alerts" do
        command "/opt/sensu/embedded/bin/sensu-check-esc-api-alerts.rb -s #{esc_endpoint_url} -t #{esc_token}"
        handlers myHandlers
        subscribers ["roundrobin:#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        additional(:occurrences => node["oun-sensu"]["environments"][k][cookbook_name]["occurrences"])
      end

      # sensu_check "#{k}_#{cookbook_name}_check_esc_critical_errors" do
      #   command "/opt/sensu/embedded/bin/sensu-check-esc-critical-errors.rb -s #{esc_endpoint_url} -t #{esc_token}"
      #   handlers myHandlers
      #   subscribers ["roundrobin:#{k}_#{cookbook_name}"]
      #   interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
      #   additional(:occurrences => node["oun-sensu"]["environments"][k][cookbook_name]["occurrences"])
      # end

      # sensu_check "#{k}_#{cookbook_name}_check_esc_general_errors" do
      #   command "/opt/sensu/embedded/bin/sensu-check-esc-general-errors.rb -s #{esc_endpoint_url} -t #{esc_token}"
      #   handlers myHandlers
      #   subscribers ["roundrobin:#{k}_#{cookbook_name}"]
      #   interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
      #   additional(:occurrences => node["oun-sensu"]["environments"][k][cookbook_name]["occurrences"])
      # end

      sensu_check "#{k}_#{cookbook_name}_check_esc_stuck_cron" do
        command "/opt/sensu/embedded/bin/sensu-check-esc-stuck-cron.rb -s #{esc_endpoint_url} -t #{esc_token}"
        handlers myHandlers
        subscribers ["roundrobin:#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        additional(:occurrences => node["oun-sensu"]["environments"][k][cookbook_name]["occurrences"])
      end

      sensu_check "#{k}_#{cookbook_name}_check_esc_system_errors" do
        command "/opt/sensu/embedded/bin/sensu-check-esc-system-errors.rb -s #{esc_endpoint_url} -t #{esc_token}"
        handlers myHandlers
        subscribers ["roundrobin:#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        additional(:occurrences => node["oun-sensu"]["environments"][k][cookbook_name]["occurrences"])
      end


      ### END Esc service Checks


      sensu_check "#{k}_#{cookbook_name}_check_proc_nginx" do
        command "/opt/sensu/embedded/bin/check-process.rb  -p apache2"
        handlers myHandlers
        subscribers ["#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        additional(:occurrences => node["oun-sensu"]["environments"][k][cookbook_name]["occurrences"])
      end

      sensu_check "#{k}_#{cookbook_name}_check_ports_tcp_80" do
        command "/opt/sensu/embedded/bin/check-ports.rb -p 80"
        handlers myHandlers
        subscribers ["#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        additional(:occurrences => node["oun-sensu"]["environments"][k][cookbook_name]["occurrences"])
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
