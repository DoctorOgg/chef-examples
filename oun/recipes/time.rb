
if node["platform"] == "ubuntu" && node["platform_version"] <= "12.04"
  script 'Set Timezone' do
    interpreter 'bash'
    user 'root'
    cwd '/tmp'
    code "echo #{node["oun"]["timezone"]} | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"
  end
else
    script 'Set Timezone' do
      interpreter 'bash'
      user 'root'
      cwd '/tmp'
      code "timedatectl set-timezone #{node["oun"]["timezone"]}"
    end
end


# # Ensure NTP works
node.override['ntp']['sync_clock'] = true
node.override['ntp']['sync_hw_clock'] = false
node.override['ntp']['servers'] = node["oun"]["ntp_servers"]
include_recipe 'ntp'

# Set Correct Locale Settings
node.override["locale"]["lang"]    = node["oun"]["locale"]
node.override["locale"]["lc_all"]  = node["oun"]["locale"]
include_recipe "locale"
