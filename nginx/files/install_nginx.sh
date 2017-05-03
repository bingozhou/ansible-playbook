#!/bin/bash

#判断是否存在主目录
myPath="/data/" 
if [ ! -d "$myPath"]; then  
　　mkdir "$myPath"  
fi 
#安装nginx所需的依赖包
yum install -y gcc-c++  pcre* openssl* zlib zlib-devel
#新增nginx用户和组
groupadd -r nginx
useradd -s /sbin/nologin -md /data/nginx -g nginx -r nginx
#编译安装nginx
cd /tmp
tar xf nginx-1.12.0.tar.gz;cd nginx-1.12.0
./configure \
--prefix=/data/nginx \
--sbin-path=/data/nginx/sbin/nginx \
--conf-path=/data/nginx/nginx.conf \
--pid-path=/data/nginx/nginx.pid \
--user=nginx \
--group=nginx \
--with-http_ssl_module \
--with-http_v2_module \
--with-http_stub_status_module \
--with-pcre \
--with-http_realip_module 
make && make install
#创建软连接并运行
ln -sfn /data/nginx/sbin/nginx /usr/sbin/nginx
#/usr/sbin/nginx 
