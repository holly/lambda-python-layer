#!/bin/bash

set -e
#set -u

APP=$(basename $PWD)
ZIPFILE=$PWD/tmp/lambda_layer.zip

LAYER_DESCRIPTION="for python lambda library"

export AWS_PAGER=""
if [ -z "$AWS_DEFAULT_REGION"  ]; then
	export AWS_DEFAULT_REGION=us-east-1
fi
if [ -z "$AWS_DEFAULT_PROFILE"  ]; then
	export AWS_DEFAULT_PROFILE=default
fi
if [ -z "$LAMBDA_LAYER_NAME"  ]; then
	LAMBDA_LAYER_NAME=$(echo $APP | sed -e 's/^lambda\-//')
fi

aws lambda publish-layer-version \
--layer-name $LAMBDA_LAYER_NAME \
--zip-file fileb://$ZIPFILE \
--compatible-runtimes python3.8 python3.9
