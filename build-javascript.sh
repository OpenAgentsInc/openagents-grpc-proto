#!/bin/bash
set -e
mkdir -p build/javascript


npm i --save-dev @grpc/grpc-js ts-protoc-gen @protobuf-ts/plugin typescript @types/node

npx protoc --ts_out build/javascript \
--experimental_allow_proto3_optional \
--ts_opt long_type_number,server_generic \
 --proto_path proto proto/*.proto

cp -Rvf npm/* build/javascript/
cd build/javascript

TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "")
if [[ -n "$TAG" ]]; then
    TAG=${TAG#v}
    sed -i "s/\"version\": \".*\"/\"version\": \"$TAG\"/g" package.json
fi

node generate_imports.cjs

npm run build

npm pack