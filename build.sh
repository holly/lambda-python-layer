#!/bin/bash

set -e
set -u

APP=$(basename $PWD)
TAG="$USER/$APP"
docker build -t ${TAG}:latest  .

SRC=$PWD/tmp
DST=/data

if [ -d $SRC ]; then
	rm -frv $SRC
fi
mkdir $SRC

#docker run --hostname $APP --name $APP --rm --cpu-period=1000000 --cpu-quota=800000 --memory=128m --mount type=bind,src=/data/lambda,dst=/data -it $TAG:latest
docker run --hostname $APP --name $APP --rm --cpu-period=1000000 --cpu-quota=800000 --memory=128m --mount type=bind,src=$SRC,dst=$DST -it $TAG:latest
