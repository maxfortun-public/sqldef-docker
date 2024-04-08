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

## Feature branching and release cycle with sqldef
### Schema release git workflow
> Based on [GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) with one major difference.  
> GitFlow starts releases from `develop` branch.  
> We start releases from `master` branch.
<img src="B2EFlow.svg" width="600" />

1. Create a `feature` branch from `master`.
2. Make changes and test them locally.
3. Commit and push changes into the `feature` branch.
4. Merge `feature` branch into the `dev` branch.
5. Deploy `dev` branch into the `Dev` environment.
> Via CI/CD
6. Test the `Dev` environment.
7. Merge `feature` branch into the `int` branch.
8. Deploy `int` branch into the `Int` environment.
> Via CI/CD
9. Test the `Int` environment.
10. Merge `feature` branch into the `master` branch.
11. Tag `master` branch with a version.
12. Deploy the `tag` into the `Prod` environment.
> Via CI/CD


### Branch naming conventions
Each change branch should start with either a `feature/change_` or a `feature/rollback_` prefix to make it easier to track the purpose of the change.

1. Add an index
> feature/change_application_name_1.2.3

2. Rollback
> feature/rollback_application_name_1.2.3

