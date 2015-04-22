#!/bin/sh
HOSTNAME=`curl -s http://169.254.169.254/metadata/v1/hostname`
apt-get -y update
apt-get -y upgrade
apt-get -y install nginx
echo "postfix postfix/main_mailer_type select Internet Site" | debconf-set-selections
echo "postfix postfix/mynetworks string 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128" | debconf-set-selections
echo "postfix postfix/root_address string" | debconf-set-selections
echo "postfix postfix/procmail boolean false" | debconf-set-selections
echo "postfix postfix/sqlite_warning boolean" | debconf-set-selections
echo "postfix postfix/mailbox_limit string 0" | debconf-set-selections
echo "postfix postfix/mydomain_warning boolean" | debconf-set-selections
echo "postfix postfix/relayhost string" | debconf-set-selections
echo "postfix postfix/recipient_delim string +" | debconf-set-selections
echo "postfix postfix/relay_restrictions_warning boolean" | debconf-set-selections
echo "postfix postfix/retry_upgrade_warning boolean" | debconf-set-selections
echo "postfix postfix/tlsmgr_upgrade_warning boolean" | debconf-set-selections
echo "postfix postfix/chattr boolean false" | debconf-set-selections
echo "postfix postfix/mailname string $HOSTNAME" | debconf-set-selections
echo "postfix postfix/protocols select all" | debconf-set-selections
echo "postfix postfix/rfc1035_violation boolean false" | debconf-set-selections
echo "postfix postfix/destinations string $HOSTNAME, localhost.localdomain, , localhost" | debconf-set-selections
echo "postfix postfix/kernel_version_warning boolean" | debconf-set-selections
apt-get -y install postfix
curl -s http://169.254.169.254/metadata/v1.json | mail -s "$HOSTNAME online" $MYEMAIL