include_recipe "logrotate"

log_files = [
  '/opt/oun/logs/api-error.log',
  '/opt/oun/logs/api-access.log'
]

logrotate_app 'service-api' do
  path      log_files
  frequency 'daily'
  create    '644 root root'
  options   ['copytruncate', 'compress', 'notifempty','missingok']
  rotate    7
end
