#!/bin/bash

#this config file contains AUTHTOKEN and MYEMAIL
. ~/.projects/william+mirrors

#config serverbuilder
ROLE=loadbalancer
NAME=devel-mirror01.nyc3.mirrors.digitalocean.com

#run serverbuilder
curl -s -X POST "https://api.digitalocean.com/v2/droplets" \
      -d'{"name":"devel-mirror01.nyc3.mirrors.digitalocean.com","region":"nyc3","size":"512mb","private_networking":true,"backups":true,"ipv6":true,"image":"ubuntu-14-04-x64","user_data":"#!/bin/bash
apt-get -y update && apt-get -y upgrade && apt-get -y install git mailutils && git clone https://github.com/mitayai/serverbuilder.git /opt/serverbuilder && bash /opt/serverbuilder/role/loadbalancer/build.sh", "ssh_keys":["6e:a7:47:10:48:08:85:c9:7d:af:77:97:15:9f:9a:ac"]}' \
      -H "Authorization: Bearer $AUTHTOKEN" \
      -H "Content-Type: application/json" > create.log
