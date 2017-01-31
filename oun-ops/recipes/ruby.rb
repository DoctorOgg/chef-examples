include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"


rbenv_ruby node["oun_ops"]["ruby"]["ruby_version"] do
  global true
end

rbenv_gem "EndlessWaffleCLI" do
  ruby_version node["oun_ops"]["ruby"]["ruby_version"]
end

template "/etc/profile.d/EndlessWaffleCLI.sh" do
	source "EndlessWaffleCLI.profile.sh.erb"
	owner "root"
	group "root"
	mode 0444
end
