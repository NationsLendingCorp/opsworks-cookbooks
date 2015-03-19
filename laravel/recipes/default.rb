Chef::Log.info 'Installing Bower.'
execute "bower install" do
  command "npm install -g bower && touch /var/log/.bower_installed"
  creates "/var/log/.bower_installed"
  action :run
end

Chef::Log.info 'Installing Gulp.'
execute "gulp install" do
  command "npm install -g gulp && touch /var/log/.gulp_installed"
  creates "/var/log/.gulp_installed"
  action :run
end

Chef::Log.info 'Enable php mcrypt'
execute "mcrypt enable" do
  command "php5enmod mcrypt && touch /var/log/.mcrypt_enabled"
  creates "/var/log/.mcrypt_enabled"
  action :run
end

Chef::Log.info 'Enable php mongodb'
execute "mongo enable" do
  command "php5enmod mongo && touch /var/log/.mongo_enabled"
  creates "/var/log/.mongo_enabled"
  action :run
end