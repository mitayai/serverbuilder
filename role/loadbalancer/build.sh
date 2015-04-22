#!/bin/sh
METADATA=`curl -s http://169.254.169.254/metadata/v1.json`
apt-get -y update
apt-get -y upgrade
apt-get -y install nginx
