# Sylius Vagrant

This vagrant is full stack environment for Sylius e-commerce build on top of Symfony 2 framework.

This full stack includes
 - Apache 2
 - php 5.3.10
 - php mongo extension
 - php intl extension
 - phpmyadmin
 - Mongo Server installed from 10gen repo
 - git
 - composer (installed globally)
 - Sylius - It will clone Sylius project for you from github

 ## Credentials

 ### Mysql

 user: root
 
 password: iloverandompasswordsbutthiswilldo


 ## Installation

 1 - Clone this repo

    git clone https://github.com/Djuki/sylius-vagrant.git
    cd sylius-vagrant
    vagrant up

 2 - When vagrant is done with provisioning insgtall Sylius

    vagrant ssh
    cd /var/www/Sylius
    composer install

 When all packages are installed install sylius application

    php app/console sylius:install

 Just answer on the questions from the cli and your app is ready
