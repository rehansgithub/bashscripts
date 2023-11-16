#!/bin/bash

echo "#####################"
date
ls /var/run/httpd/httpd.pid &> /dev/null

if [ $? -eq 0 ]
then
  echo "process is running"
else
  echo "httpd is not runnin"
  echo "starting the process..."
  systemctl start httpd
  if [ $? -eq 0 ]
  then
    echo "started!!!"
  else
    echo "failed, contact admin"
  fi
fi
echo "##############"
echo
