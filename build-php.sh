#!/bin/bash
set -e
mkdir -p tmp
mkdir -p build/php


extpath=$(pecl config-show|grep "PEAR executables"|rev|cut -d' ' -f 1|rev)
echo $extpath
ls $extpath
protoc --proto_path=proto \
  --php_out=build/php \
  --grpc_out=build/php \
  --plugin=protoc-gen-grpc=$extpath/grpc_php_plugin \
  --experimental_allow_proto3_optional \
  proto/*.proto
