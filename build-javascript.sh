#!/bin/bash

mkdir -p build/javascript/src
mkdir -p build/javascript/dist

npm i --save-dev @grpc/grpc-js ts-protoc-gen @protobuf-ts/plugin typescript @types/node

npx protoc --ts_out build/javascript/src \
--experimental_allow_proto3_optional \
--ts_opt long_type_number,server_generic \
 --proto_path proto proto/*.proto

cp -Rvf npm/* build/javascript/
cd build/javascript
npm run build
npm pack