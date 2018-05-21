# Docker Armake

Docker image with Armake and various pre-installed tooling aimed towards Python, to help speed up build times in CI pipelines.

[![Docker Build Statu](https://img.shields.io/docker/pulls/acemod/armake.svg)](https://hub.docker.com/r/acemod/armake/)

----

## Available tools

- armake
- git
- python3
- make
- zip
- pygithub


## Usage

In gitlab-ci:

```yaml
unit-tests:
    stage: test
    image: acemod/armake:latest
    script:
      - ...
```
