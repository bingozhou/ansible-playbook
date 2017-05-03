cd /tmp
tar xf redis-3.2.8.tar.gz
cd /tmp/redis-3.2.8
make && make install

if [ ! -d /data ];
then mkdir /data
fi

useradd -md /data/redis redis
mkdir -p /data/redis
cp redis.conf /data/redis

sed -i 's/daemonize no/daemonize yes/g' /data/redis/redis.conf
sed -i 's/dir .\//dir \/data\/redis\//g' /data/redis/redis.conf
chown -R redis.redis /data/redis/*.*
