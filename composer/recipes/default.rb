Chef::Log.info 'Fetching composer.'
bash "install_composer" do
  user "root"
  cwd "/home/ubuntu"
  code <<-EOH
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer
    chown ubuntu:ubuntu /usr/local/bin/composer
  EOH
end

Chef::Log.info 'Installing composer.'
execute "composer install" do
  command "/usr/local/bin/composer install && touch /var/log/.php_composer_installed"
  creates "/var/log/.php_composer_installed"
  action :run
end