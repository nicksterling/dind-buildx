FROM docker:dind
RUN apk upgrade
RUN apk add vim git make
COPY skel /
