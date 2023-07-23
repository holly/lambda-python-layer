#!/bin/bash

set -e
set -u

APP=$(basename $PWD | sed -e 's/^lambda\-//')
TAG="$USER/$APP"
docker build -t ${TAG}:latest  .
