#!/bin/bash
set -e
mkdir -p tmp
mkdir -p build/php

if [ "$PROTOC" = "" ];
then
  PROTOC=$(which protoc)
fi

$PROTOC --proto_path=proto \
  --php_out=build/php \
  --grpc_out=build/php \
  --plugin=protoc-gen-grpc=$GRPC_EXT_PATH/grpc_php_plugin \
  --experimental_allow_proto3_optional \
  proto/*.proto
