cd /tmp
tar xf redis-3.2.8.tar.gz
cd /tmp/redis-3.2.8
make && make install
mkdir -p /data/redis
cp redis.conf /data/redis
cd /data/redis
sed -i 's/daemonize no/daemonize yes/g' /data/redis/redis.conf
sed -i 's/dir .\//dir \/data\/redis\//g' /data/redis/redis.conf
