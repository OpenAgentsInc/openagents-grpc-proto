from setuptools import setup, find_packages
import os

version = os.getenv('TAG', '0.1')
setup(
    name='openagents_grpc_proto',
    version=version,
    packages=find_packages(),
    install_requires=[
        'protobuf==5.26.1',
        'grpcio==1.62.1'
    ],
)