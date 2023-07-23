#!/bin/bash

set -e
#set -u

LAMBDA_LAYER_NAME=$(basename $PWD | sed -e 's/^lambda\-//')
LAMBDA_ZIP_ARCHIVE=$PWD/lambda-python-layer.zip
LAYER_DESCRIPTION="for python lambda library"

export AWS_PAGER=""
if [ -z "$AWS_DEFAULT_REGION"  ]; then
	export AWS_DEFAULT_REGION=us-east-1
fi
if [ -z "$AWS_DEFAULT_PROFILE"  ]; then
	export AWS_DEFAULT_PROFILE=default
fi

aws lambda publish-layer-version \
--layer-name $LAMBDA_LAYER_NAME \
--zip-file fileb://$LAMBDA_ZIP_ARCHIVE \
--compatible-runtimes python3.8 python3.9 python3.10
