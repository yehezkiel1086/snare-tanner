#!/bin/bash

docker compose down
docker image prune
docker rmi mushorg/snare mushorg/tanner mushorg/phpox mushorg/redis busybox
