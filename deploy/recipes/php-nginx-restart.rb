#
# Cookbook Name:: deploy
# Recipe:: php-nginx-restart

include_recipe 'deploy'

node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'php-nginx'
    Chef::Log.debug("Skipping deploy::php-nginx-restart application #{application} as it is not a PHP Nginx app")
    next
  end

  service 'nginx' do
    supports :status => true, :restart => true, :reload => true
    action :restart
  end
end
