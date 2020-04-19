#!/bin/sh

apk add --no-cache vim git

cd ~

git clone git://github.com/nicksterling/dind-buildx && cd dind-buildx
#git checkout stable

cd ~

git clone git://github.com/docker/buildx && cd buildx
export DOCKER_BUILDKIT=1
docker build --platform=local -o . git://github.com/docker/buildx
mkdir -p ~/dind-buildx/skel/root/.docker/cli-plugins
mv buildx ~/dind-buildx/skel/.docker/cli-plugins/docker-buildx
cd ~/dind-buildx

docker build -t nicksterling/dind-buildx:stable .

