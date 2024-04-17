#!/bin/bash
set -e
mkdir -p tmp
mkdir -p build/php
pecl channel-update pecl.php.net || true
pecl install grpc || true
pecl install protobuf || true
protoc --proto_path=proto \
  --php_out=build/php \
  --grpc_out=build/php \
  --plugin=protoc-gen-grpc=bins/opt/grpc_php_plugin \
  --experimental_allow_proto3_optional \
  proto/*.proto