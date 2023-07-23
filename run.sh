#!/bin/bash

set -e
set -u

APP=$(basename $PWD | sed -e 's/^lambda\-//')
TAG="$USER/$APP"
LAMBDA_ZIP_ARCHIVE=$PWD/lambda-python-layer.zip

#docker run --hostname $APP --name $APP --rm --cpu-period=1000000 --cpu-quota=800000 --memory=128m --mount type=bind,src=$SRC,dst=$DST -it $TAG:latest
docker run -d --hostname $APP --name $APP --rm  -it $TAG:latest bash 
sleep 3
docker exec $APP zip -r - ./python >$LAMBDA_ZIP_ARCHIVE
docker kill $APP
