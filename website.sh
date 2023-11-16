#!/bin/bash


SVC="httpd"
DIR="/tmp/website"
PACKAGES="httpd wget unzip"


#USER ENTERS WEBSITE TO HOST
read -p "Enter website zip: " FILE
read -p "Enter file name: " NAME

#INSTALLING REQUIRED PACKAGES
sudo yum install $PACKAGES -y

#STARTING SERVICE
sudo systemctl start $SVC
sudo systemctl enable $SVC


mkdir -p $DIR
cd $DIR

#DOWNLOADING WEBSITE CONTENTS AND COPYING TO HTTPD LOCATION
wget $FILE
unzip $NAME.zip
sudo cp -r $NAME/* /var/www/html/

#RESTART SERVICE
sudo system restart httpd

#CLEAN UP
rm -rf /tmp/website

ip addr show
