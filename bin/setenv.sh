NAME=sqldef
SQLDEF_VERSION=v0.17.5
VERSION=$SQLDEF_VERSION.1
DOCKER_REPO=${DOCKER_REPO:-local}

DOCKER_BUILD_ARGS+=( --build-arg VERSION=$SQLDEF_VERSION )
