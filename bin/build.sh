#!/bin/bash -e

SWD=$(cd $(dirname $0); pwd)
BWD=$(dirname "$SWD")

. $SWD/setenv.sh

DOCKER_BUILD_ARGS+=( -t "$DOCKER_REPO/$NAME:$VERSION" )
DOCKER_BUILD_ARGS+=( -t "$DOCKER_REPO/$NAME:latest" )

docker build ${DOCKER_BUILD_ARGS[*]} --rm $BWD/docker

dockerImages=$(docker images "$NAME" -f "before=$DOCKER_REPO/$NAME:$VERSION" -q)
[ -n "$dockerImages" ] && docker rmi -f $dockerImages || true
