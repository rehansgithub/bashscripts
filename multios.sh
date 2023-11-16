#!/bin/bash


#SVC="httpd"
DIR="/tmp/website"
#PACKAGES="httpd wget unzip"


URL="https://www.tooplate.com/zip-templates/2135_mini_finance.zip"
FILE="2135_mini_finance"


yum --help > /dev/null

if [ $? -eq 0 ]
then
  PACKAGES="httpd wget unzip"
  SVC="httpd"
  echo "running setup on CentOS"

   #INSTALLING REQUIRED PACKAGES
   sudo yum install $PACKAGES -y

   #STARTING SERVICE
   sudo systemctl start $SVC
   sudo systemctl enable $SVC


   mkdir -p $DIR
   cd $DIR

   #DOWNLOADING WEBSITE CONTENTS AND COPYING TO HTTPD LOCATION
   wget $URL > /dev/null
   unzip $FILE.zip > dev/null
   sudo cp -r $FILE/* /var/www/html/

   #RESTART SERVICE
   sudo system restart httpd

   #CLEAN UP
   rm -rf /tmp/website

else
  #variable for UBUNTU
   PACKAGE="apache2 wget unzip"
   SVC="apache2"
   sudo apt update > /dev/null
   echo "running setup on UBUNTU"


   #INSTALLING REQUIRED PACKAGES
   sudo apt install $PACKAGE -y

   #STARTING SERVICE
   sudo systemctl start $SVC
   sudo systemctl enable $SVC


   mkdir -p $DIR
   cd $DIR

   #DOWNLOADING WEBSITE CONTENTS AND COPYING TO HTTPD LOCATION
   wget $URL
   unzip $FILE.zip >> /dev/null
   sudo cp -r $FILE/* /var/www/html/

   #RESTART SERVICE
   sudo system restart $SVC

   #CLEAN UP
   rm -rf $DIR
fi

