# CZI infra-tools

This repo is temporary holding place for a handful of infra-y scripts. Will likely be replaced
when we can open source our full infrastructure stack.

## docker-helper
### Usage
#### Build a Docker image
```bash
$ docker-helper build chanzuckerberg/<docker_repo> <build_path> <branch (optional)> <commit_sha (optional)> <build_number (optional)>
```

#### Push a Docker image
```bash
$ docker-helper push <docker_repo>
```
