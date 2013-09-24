#
# Cookbook Name:: Sylius env
# Recipe:: default
#
# Copyright 2013, Sylius
#
# All rights reserved - Do Not Redistribute
#

# update repositories before start
include_recipe "sylius::update-apt"

include_recipe "apache2"

include_recipe "mysql::client"
include_recipe "mysql::server"

include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2::mod_php5"

#install mongodb server
include_recipe "mongodb::default"

#install basic packages
include_recipe "sylius::packages"

# Install xdebug and mongo php extension
include_recipe "sylius::pear"

#set up vhost and timezone
include_recipe "sylius::server"

include_recipe "composer"

include_recipe "sylius::mysql"

include_recipe "sylius::sylius"




