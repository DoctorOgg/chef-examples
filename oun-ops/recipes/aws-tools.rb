# $ curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
# $ unzip awscli-bundle.zip
# $ sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
build_file = "#{Chef::Config['file_cache_path']}/awscli-bundle.zip"

%w( python-pip python-dev python-tlslite ).each do |pkg|
  package pkg
end

script 'install pycrypto' do
  interpreter 'bash'
  user 'root'
  cwd '/tmp'
  code <<-EOF
  pip install pycrypto
  EOF
end

# curl -L -s https://s3.amazonaws.com/aws-cli/awscli-bundle.zip | shasum -a 256
remote_file build_file do
  source 'https://s3.amazonaws.com/aws-cli/awscli-bundle.zip'
  owner 'root'
  group 'root'
  checksum node["oun_ops"]["aws-tools"]["aws_checksum"]
end

script 'unzip and install' do
  interpreter 'bash'
  user 'root'
  cwd Chef::Config['file_cache_path']
  code <<-EOF
  unzip awscli-bundle.zip
  ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
  EOF
end
