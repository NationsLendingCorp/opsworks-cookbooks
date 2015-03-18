Chef::Log.info 'Fetching composer.'
bash "install_composer" do
  user "root"
  cwd "/home/ubuntu"
  code <<-EOH
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer
    chown ubuntu:ubuntu /usr/local/bin/composer
  EOH
  not_if "test -d /home/ubuntu"
end

Chef::Log.info 'Installing composer.'
execute "composer install" do
  command "composer install && touch /var/log/.php_composer_installed"
  creates "/var/log/.php_composer_installed"
  action :run
end