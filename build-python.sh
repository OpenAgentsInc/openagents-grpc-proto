#!/bin/bash
set -e
mkdir -p tmp
python3 -m venv tmp/protobuild-venv
. tmp/protobuild-venv/bin/activate
pip install grpcio-tools

mkdir -p build/python/openagents_service_provider_proto
python -m grpc_tools.protoc -Iproto \
--python_out=build/python/openagents_service_provider_proto \
--pyi_out=build/python/openagents_service_provider_proto \
--grpc_python_out=build/python/openagents_service_provider_proto \
proto/*.proto

cp -Rvf python/* build/python/
cd build/python



if [ "$DEBUG" = "1" ] ;
then
    deactivate
    pip install -e .
else 
    python setup.py sdist
fi