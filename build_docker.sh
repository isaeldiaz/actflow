#!/bin/bash

if [ ! -d docker ]; then
	echo "ERROR: This script must be ran from the repo's root"
	exit 1
fi

# Building a base image with only the libraries
docker build -t actflow_base:latest -f ./docker/Base.Dockerfile .

# Building the executables
docker build -t actflow_build:latest -f ./docker/Build.Dockerfile .
# Using label to extract executables
docker run -l foo=bar actflow_build sh -c 'echo 1'
BUILD_DIR=$(docker run actflow_build sh -c 'echo $VLSI_TOOLS_SRC' 2> /dev/null )
CONTAINER_HASH=$(docker ps -aqf 'label=foo=bar')
docker cp $CONTAINER_HASH:$BUILD_DIR/release/async_tools.tar.gz ./

# Building lean docker image with only executables
docker build -t actflow:latest -f ./docker/App.Dockerfile .

#Clean up intermediate containers/images
docker rm $CONTAINER_HASH
docker image rm actflow_build:latest
