#!/bin/bash
set -e
mkdir -p tmp
python3 -m venv tmp/protobuild-venv
. tmp/protobuild-venv/bin/activate
pip install grpcio-tools

mkdir -p build/python/openagents_grpc_proto
python -m grpc_tools.protoc -Iproto \
--python_out=build/python/openagents_grpc_proto \
--pyi_out=build/python/openagents_grpc_proto \
--grpc_python_out=build/python/openagents_grpc_proto \
proto/*.proto

cp -Rvf python/* build/python/
cd build/python

if [ "$TAG" = "" ];
then
    TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "")
    if [[ -n "$TAG" ]]; then
        TAG=${TAG#v}
        export TAG
    else
        export TAG="0.1"
    fi
fi

echo "$TAG" > VERSION
echo "Building version $TAG"

if [ "$DEBUG" = "1" ] ;
then
    pip install -e .
else 
    python setup.py sdist
fi