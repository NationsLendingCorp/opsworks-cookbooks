Chef::Log.info 'Installing Gulp.'
execute "composer install" do
  command "npm install -y gulp && touch /var/log/.gulp_installed"
  creates "/var/log/.gulp_installed"
  action :run
end