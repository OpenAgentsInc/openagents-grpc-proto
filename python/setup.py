from setuptools import setup, find_packages
import os


version='0.1'

if os.path.exists('VERSION'):
    try:
        with open('VERSION', 'r') as version_file:
            version = version_file.read().strip()
    except Exception as e:
        print(f'Failed to read version from VERSION file: {e}')

setup(
    name='openagents_grpc_proto',
    author='OpenAgents',
    version=version,
    packages=find_packages(),
    install_requires=[
        'protobuf==5.26.1',
        'grpcio==1.63.0'
    ],
)