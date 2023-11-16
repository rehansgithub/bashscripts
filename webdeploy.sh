#!/bin/bash

USR="devops"

for host in `cat remhosts`
do
  echo "############################################"
  echo "connecting to $host...."
  echo "pushing script to $host"
  scp multios $USR@$host:/tmp/
  echo "executing script on $host..."
  ssh $USR@$host sudo /tmp/multios
  ssh $USR@$host sudo rm -rf /tmp/multios
  echo "#############################################"
  echo
done
