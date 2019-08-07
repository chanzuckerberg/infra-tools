# CZI infra-tools

This repo is temporary holding place for a handful of infra-y scripts. Will likely be replaced
when we can open source our full infrastructure stack.

## docker-helper
### Usage
#### Build a Docker image
```bash
$ docker-helper build <docker_repo> <build_path> <branch> <commit_sha> <build_number>
```
#### Push a Docker image
```bash
$ docker-helper push <docker_repo>
```
