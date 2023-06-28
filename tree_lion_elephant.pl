#!/usr/bin/perl
# The Technology for Good Project

use strict;
use warnings;

# Creating Variables
my $domain = 'tech4good.com'; 
my $dataBaseName = 'tfg_db';
my $dataBaseUser = 'tfg_user';
my $dataBasePassword = 'TfG#pass';
my $backupFolder = '/backups';
my $projectName = 'The Technology for Good Project';

# Setting up Database
system("mysql -u $dataBaseUser -p$dataBasePassword -e \"CREATE DATABASE IF NOT EXISTS $dataBaseName; USE $dataBaseName;";

# Scaffolding the database
system("mysql -u $dataBaseUser -p$dataBasePassword -e \"CREATE TABLE IF NOT EXISTS users (id INT PRIMARY KEY AUTO_INCREMENT, username VARCHAR(50) NOT NULL, password VARCHAR (255) NOT NULL);\"");
system("mysql -u $dataBaseUser -p$dataBasePassword -e \"CREATE TABLE IF NOT EXISTS projects (id INT PRIMARY KEY AUTO_INCREMENT, title VARCHAR(50) NOT NULL, description TEXT NOT NULL);\"");

# Creating the backup folder
mkdir($backupFolder); 

# Setting up a web server 
system("sudo apt-get update");
system("sudo apt-get install apache2");
system("sudo ufw allow 'Apache Full'");
system("sudo a2enmod rewrite");
system("sudo service apache2 restart");

# Downloading and Installing PHP
system("sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql");

# Installing Composer
system("curl -sS https://getcomposer.org/installer | php");
system("sudo mv composer.phar /usr/local/bin/composer");

# Downloading and Installing Symfony
system("wget https://symfony.com/installer -O symfony");
system("sudo chmod a+x symfony");
system("sudo mv symfony /usr/local/bin/symfony");

# Installing Symfony CLI
system("wget https://phar.symfony.com/symfony.phar");
system("sudo chmod a+x symfony.phar");
system("sudo mv symfony.phar /usr/local/bin/symfony");

# Creating a Symfony project
system("symfony new $projectName");

# Installing project dependencies
system("composer install --ignore-platform-reqs -d $projectName");

# Setting up the application and environment
system("php $projectName/app/console setup:App $domain $dataBaseName $dataBaseUser $dataBasePassword");
system("php $projectName/app/console setup:Environment prod");

# Configuring the application and environment for the web server
system("sudo cp $projectName/web/app.php /var/www/html/app.php");
system("sudo cp $projectName/web/.htaccess /var/www/html/.htaccess");
system("sudo chown -R www-data:www-data /var/www/html/");

# Setting up cron jobs
system("sudo crontab -e");
system("@daily php $projectName/app/console backup:Database > $backupFolder/$dataBaseName/");

# Updating the web server
system("sudo service apache2 restart");

# Testing the application 
system("curl http://$domain");

print "Project Setup Complete\n";