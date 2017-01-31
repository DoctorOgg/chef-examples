node.override["java"]["jdk_version"] = node["oun_wso2is"]["jdk_version"]
node.override["java"]["set_etc_environment"] = true
include_recipe 'java::default'

%w( ant ).each do |pkg|
  package pkg
end
