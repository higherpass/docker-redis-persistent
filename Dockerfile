FROM phusion/baseimage
MAINTAINER Fake <fake@fake.com>

# Setup redis user
RUN groupadd -r redis && useradd -r -g redis redis

# Always a handy tool
RUN apt-get update \
  && apt-get install -y curl 

# Install redis
RUN apt-get install -y redis-server

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Startup scripts based on phusion/baseimage
RUN mkdir /etc/service/redis
ADD ./scripts/redis /etc/service/redis/run
RUN chmod +x /etc/service/redis/run

# Configure redis
RUN sed -i 's/daemonize yes/daemonize no/g' /etc/redis/redis.conf
RUN sed -i 's/bind 127.0.0.1/# bind 127.0.0.1/g' /etc/redis/redis.conf
RUN sed -i 's/dir \/var\/lib\/redis/dir \/data\/redis/g' /etc/redis/redis.conf

# Create and configure redis storage directory
RUN mkdir -p /data/redis && chown redis:redis /data/redis
VOLUME /data/redis
WORKDIR /data/redis

# Allow external connections
EXPOSE 6379

CMD ["/sbin/my_init"]
