#!/bin/bash
set -e
mkdir -p tmp
mkdir -p build/php
pecl install grpc
protoc --proto_path=proto \
  --php_out=build/php \
  --grpc_out=build/phpp \
  --plugin=protoc-gen-grpc=bins/opt/grpc_php_plugin \
  --experimental_allow_proto3_optional \
  proto/*.proto