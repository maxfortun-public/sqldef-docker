#!/bin/bash -e

DOCKER_REPO=$1
if [ -z "$DOCKER_REPO" ]; then
	echo "Usage: $0 <dockerhub repo>"
	echo " e.g.: $0 username"
fi

SWD=$(cd $(dirname $0); pwd)
BWD=$(dirname "$SWD")

. $SWD/setenv.sh

docker push $DOCKER_REPO/$NAME:$VERSION
docker push $DOCKER_REPO/$NAME:latest

