#!/bin/bash -ex

SWD=$(cd $(dirname $0); pwd)
BWD=$(dirname "$SWD")

. $SWD/setenv.sh

docker update --restart=no $NAME || true
docker stop $NAME || true
