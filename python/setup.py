from setuptools import setup, find_packages

setup(
    name='openagents_service_provider_proto',
    version='0.1',
    packages=find_packages(),
    install_requires=[
        'protobuf==5.26.1',
        'grpcio==1.62.1'
    ],
)