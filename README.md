# sqldef-docker

Just a Dockerfile moved from [sqldef#16](https://github.com/k0kubun/sqldef/pull/16).

## Build master

```
$ docker build -t sqldef .
```

## Build a version

```
$ docker build -t sqldef --build-arg VERSION=v0.x.y .
```

## Run
```
docker run -it --rm sqldef 
```

## Run with args
```
docker run -it --rm sqldef mysqldef --help
```

## Using scripts in `bin/`

### setenv.sh
Modify `SQLDEF_VERSION` to point to the sqldef github tag you intend to build.  
Modify `VERSION` to indicate container release.  

### build.sh
For local builds:
```
bin/build.sh 
```

For builds intended for dockerhub:
```
DOCKER_REPO=docker.io/username bin/build.sh 
```

### run.sh
For local runs:
```
bin/run.sh
```

### push.sh
To publish to duckerhub:
```
bin/push.sh username
```
