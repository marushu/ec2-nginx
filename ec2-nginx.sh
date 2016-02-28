#!/bin/sh

sudo /usr/sbin/usermod -s /bin/bash nginx;

sudo /sbin/service monit stop;
sudo /sbin/service nginx stop;
sudo /sbin/service php-fpm stop;
sudo /usr/sbin/usermod -d /var/www/vhosts nginx;
sudo /sbin/service php-fpm start;
sudo /sbin/service nginx start;
sudo /sbin/service monit start;

sudo mkdir /var/www/vhosts/.ssh;
sudo cp /home/ec2-user/.ssh/authorized_keys /var/www/vhosts/.ssh/;
sudo chown -R nginx:nginx /var/www/vhosts/.ssh/;
