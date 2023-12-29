#!/bin/bash

user="devops"

for host in `cat rm_hosts`
do
  echo
  echo "Connecting to host $host"
  scp multios_websetup.sh $user@$host:/tmp/
  ssh $user@$host sudo /tmp/multios_websetup.sh
  ssh $user@$host sudo rm -rf /tmp/multios_websetup.sh

done
