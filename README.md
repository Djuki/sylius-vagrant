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


 You can change your mysql credential in Vagrantfile if you don't think it's creative enough

          "mysql" => {
            "server_root_password" => "iloverandompasswordsbutthiswilldo",
            "server_repl_password" => "iloverandompasswordsbutthiswilldo",
            "server_debian_password" => "iloverandompasswordsbutthiswilldo"
          }


 ## Installation

 1 - Clone this repo

        git clone https://github.com/Djuki/sylius-vagrant.git
        cd sylius-vagrant
        vagrant up

 2 - When vagrant is done with provisioning install Sylius

        vagrant ssh
        cd /var/www/Sylius
        composer install

 When all packages are installed install sylius application

        php app/console sylius:install

 Just answer on the questions from the cli and your app is ready on `172.33.33.34` address.
 To make it live on `sylius.local` you need to set up you local hosts file like this.


 If you are on Linux add this line into `etc/hosts` file.

        sudo nano /etc/hosts

 Add this line

        172.33.33.34     sylius.local

 Save the file `CTRL+O` and close `CRTL+X`

 You are ready to rock now