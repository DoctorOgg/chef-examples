include_recipe "monit-ng"

monit_check 'eec-server' do
  check_id  "#{node["oun-ServiceAPI"]["home_dir"]}/run/eec-server.pid"
  group     'eec-server'
  start     '/sbin/start eec-server'
  stop      '/sbin/stop eec-server'
  tests [
    {
      'condition' => "failed port #{node["oun-ServiceAPI"]["eec_config"]["listen_port"]} proto http and request '/static/eec-socket-client.js' for 5 cycles",
      'action' => 'restart'
    }
  ]
end

monit_check 'eec-publisher' do
  check_id  "#{node["oun-ServiceAPI"]["home_dir"]}/run/eec-publisher.pid"
  group     'eec-publisher'
  start     '/sbin/start eec-publisher'
  stop      '/sbin/stop eec-publisher'
end
