#!/bin/bash

mypasswd=`cat /root/.mysql_secret|awk -F: {'print$4'} |tr -d " "`
myuser=root
#mypasswd=123
myhost=172.25.0.211
newpasswd=123456


service mysql start
/usr/bin/mysql -u$myuser -p$mypasswd -h$myhost << EOF

show databases;
update mysql.user set password=PASSWORD('$newpasswd') where user='root';
flush privileges;
EOF