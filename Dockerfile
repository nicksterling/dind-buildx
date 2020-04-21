FROM docker:dind
RUN apk upgrade
RUN apk add curl
RUN curl -LJO https://github.com/docker/buildx/releases/download/v0.3.1/buildx-v0.3.1.linux-amd64 && mkdir -p ~/.docker/cli-plugins && mv buildx-v* ~/.docker/cli-plugins/docker-buildx && chmod +x ~/.docker/cli-plugins/docker-buildx
COPY build-multiarch.sh /usr/local/bin
