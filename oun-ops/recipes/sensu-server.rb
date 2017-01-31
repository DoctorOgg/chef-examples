include_recipe "sensu"

node["oun-sensu"]["environments"].keys.each do |k|
    myHandlers = node["oun-sensu"]["notify"]["handlers"][k]

    if node["oun-sensu"]["environments"][k].key? cookbook_name
      
      sensu_check "#{k}_#{cookbook_name}_check_proc_nginx" do
        command "/opt/sensu/embedded/bin/check-process.rb  -p nginx"
        handlers myHandlers
        subscribers ["#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        additional(:notification => "nginx Not running", :occurrences => node["oun-sensu"]["environments"][k][cookbook_name]["occurrences"])
      end

      sensu_check "#{k}_#{cookbook_name}_check_proc_delayed_jobs_pool" do
        command "/opt/sensu/embedded/bin/check-process.rb  -p delayed_jobs_pool"
        handlers myHandlers
        subscribers ["#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        additional(:notification => "delayed_jobs_pool Not running", :occurrences => node["oun-sensu"]["environments"][k][cookbook_name]["occurrences"])
      end

      sensu_check "#{k}_#{cookbook_name}_check_canvas_queue" do
        command "/opt/rbenv/shims/check-canvas-queue.rb -w #{node["oun-sensu"]["environments"][k][cookbook_name]["canvas_queue"]["warn"]} -c #{node["oun-sensu"]["environments"][k][cookbook_name]["canvas_queue"]["crit"]}"
        handlers myHandlers
        subscribers ["#{k}_#{cookbook_name}"]
        interval node["oun-sensu"]["environments"][k][cookbook_name]["interval"]
        additional(:occurrences => node["oun-sensu"]["environments"][k][cookbook_name]["occurrences"])
      end

    end


end
