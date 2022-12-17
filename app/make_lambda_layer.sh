#!/bin/bash

export PYTHONPATH=./
SAVE_DIR=/data

set -e

mkdir -p $SAVE_DIR

if [ -z "$LAMBDA_ZIP_ARCHIVE" ]; then
    LAMBDA_ZIP_ARCHIVE=$SAVE_DIR/lambda_layer.zip 
fi
rm -fv $LAMBDA_ZIP_ARCHIVE

find $PYTHONPATH -type d -name __pycache__ | xargs rm -frv
zip -r $LAMBDA_ZIP_ARCHIVE ./python 
