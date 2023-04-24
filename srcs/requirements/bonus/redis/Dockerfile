# redis dockerfile

ARG VERSION=buster
FROM debian:${VERSION}

# installing redis
RUN apt-get update -y && apt-get install redis-server php-redis -y


RUN sed -i "s/bind 127.0.0.1/bind 0.0.0.0/g" /etc/redis/redis.conf

# set maxmemory for memory eviction limit
RUN sed -i 's/maxmemory <bytes>/maxmemory 3mb/g' /etc/redis/redis.conf

CMD ["redis-server", "--protected-mode", "no"]

