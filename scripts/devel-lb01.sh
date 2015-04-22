#!/bin/bash
ROLE='loadbalancer'
NAME='devel-lb01'
. ~/.projects/william+mirrors
curl -X POST "https://api.digitalocean.com/v2/droplets" \
      -d'{"name":"devel-lb01","region":"nyc3","size":"512mb","private_networking":true,"backups":true,"ipv6":true,"image":"ubuntu-14-04-x64","user_data":"#!/bin/bash
apt-get -y update
apt-get -y upgrade
apt-get -y install git
git clone https://github.com/mitayai/serverbuilder.git
cd serverbuilder/role/${ROLE}
bash build.sh", "ssh_keys":["6e:a7:47:10:48:08:85:c9:7d:af:77:97:15:9f:9a:ac"]}' \
      -H "Authorization: Bearer ${AUTHTOKEN}" \
      -H "Content-Type: application/json"
      
