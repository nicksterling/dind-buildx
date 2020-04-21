#!/bin/sh

if [ -z "$1" ] 
then
	echo "ERROR: Please provide a docker image name"
	exit 1
else
	echo "Docker has started! Proceeding to build $1 image"
fi

docker run --rm --privileged docker/binfmt

docker buildx create --name mybuilder
docker buildx use mybuilder
docker buildx inspect --bootstrap

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t $1 --push .

