# docker-redis-persistent
Simple Docker container to run persistent instances of Redis

Based on phusion/baseimage

Redis information stored in /data/redis.  To facilitate persistent storage
/data/redis is a volume.

Exposes Redis on port 6379.

Download the image:
$ sudo docker pull higherpass/redis-persistent

Create your container:
$ sudo docker run -d --name redis -p 6379:6379 higherpass/redis-persistent

Optionally create your container redirecting the redis persistent data:
$ sudo docker run -d --name redis -p 6379:6379 -v <PATH_TO_STORE>:/data/redis higherpass/redis-persistent
