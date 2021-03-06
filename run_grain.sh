#!/bin/bash

set -e

CURRENT_VERSION="0"

mkdir -p /var/uploads
test -d /var/db || (mkdir -p /var/db && echo $CURRENT_VERSION > /var/VERSION)

./niscud --fork --logpath /var/mongod.log --dbpath /var/db --noauth --bind_ip 127.0.0.1 --nohttpinterface --noprealloc --smallfiles
sleep 2
LCB_HTTP_HOST=0.0.0.0 npm start
