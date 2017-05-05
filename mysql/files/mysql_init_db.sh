#!/bin/bash

mkdir -p /data/mydata
chown mysql.mysql /data/mydata
/usr/bin/mysql_install_db --user=mysql --datadir=/data/mydata --defaults-file=/etc/my.cnf
#service mysql start
#ln -sfn /data/mydata/mysql.sock /var/lib/mysql/mysql.sock
