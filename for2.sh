#!/bin/bash

MYUSERS="aplha beta gamma"

for usr in $MYUSERS
do
  echo "ADDING USER $usr"
  useradd $usr
  id $usr
done
