# CZI infra-tools

This repo is temporary holding place for a handful of infra-y scripts. Will likely be replaced
when we can open source our full infrastructure stack.

## docker-helper
### Usage
#### Build a Docker image
```bash
$ docker-helper build chanzuckerberg/<docker_repo> <build_path> <branch> <commit_sha> <build_number>
```
Suggested branch value: $(git branch | grep \* | cut -d ' ' -f2)
Suggested commit_sha value: $(git rev-parse --short HEAD)
Suggested build number: 1 (but it could be any number)


#### Push a Docker image
```bash
$ docker-helper push <docker_repo>
```
