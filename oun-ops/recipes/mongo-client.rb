# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
# echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

apt_repository "mongo" do
  uri "http://repo.mongodb.org/apt/ubuntu"
  distribution "trusty/mongodb-org/3.2"
  components ["multiverse"]
  keyserver "keyserver.ubuntu.com"
  key "EA312927"
end

package 'mongodb-clients' do
 action :install
end
