#!/bin/bash
# 1. update mysql password
# 2. remove the anonymous users
# 3. drop the test database

#show databases;


newpasswd=pw_root



#nohup /usr/bin/mysqld_safe --skip-grant-tables >/dev/null 2>&1 &
#sleep 1
sleep 1
/usr/bin/mysql -uroot << EOF
update mysql.user set password=PASSWORD('$newpasswd') where user='root';
update mysql.user set host='%' where user='root' and host='localhost';
delete from mysql.user where user='';
drop database test;
flush privileges;
EOF
#service mysql restart
