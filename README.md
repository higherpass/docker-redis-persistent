# docker-redis-persistent
Simple Docker container to run persistent instances of Redis

Based on phusion/baseimage

Redis information stored in /data/redis.  To facilitate persistent storage
/data/redis is a volume.

Exposes Redis on port 6379.

