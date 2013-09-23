
template "/etc/apache2/sites-enabled/vhost.conf" do
  user "root"
  mode "0644"
  source "vhost.conf.erb"
  notifies :reload, "service[apache2]"
end

service "apache2" do
  supports :restart => true, :reload => true, :status => true
  action [ :enable, :start ]
end

execute "check if short_open_tag is Off in /etc/php5/apache2/php.ini?" do
  user "root"
  not_if "grep 'short_open_tag = Off' /etc/php5/apache2/php.ini"
  command "sed -i 's/short_open_tag = On/short_open_tag = Off/g' /etc/php5/apache2/php.ini"
end

execute "check if short_open_tag is Off in /etc/php5/cli/php.ini?" do
  user "root"
  not_if "grep 'short_open_tag = Off' /etc/php5/cli/php.ini"
  command "sed -i 's/short_open_tag = On/short_open_tag = Off/g' /etc/php5/cli/php.ini"
end

execute "check if date.timezone is UTC in /etc/php5/apache2/php.ini?" do
  user "root"
  not_if "grep '^date.timezone = UTC' /etc/php5/apache2/php.ini"
  command "sed -i 's/;date.timezone =.*/date.timezone = UTC/g' /etc/php5/apache2/php.ini"
end

execute "check if date.timezone is UTC in /etc/php5/cli/php.ini?" do
  user "root"
  not_if "grep '^date.timezone = UTC' /etc/php5/cli/php.ini"
  command "sed -i 's/;date.timezone =.*/date.timezone = UTC/g' /etc/php5/cli/php.ini"
end