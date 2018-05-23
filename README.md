# Docker Armake

Docker image with Armake and various pre-installed tooling aimed towards Python, to help speed up build times in CI pipelines.

This uses Ubuntu trusty and installs Python and [Armake](https://github.com/KoffeinFlummi/armake).

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
      - armake --version
```

circle-ci:

```yml
version: 2
jobs:
  build:
    docker:
      - image: acemod/armake
    steps:
      - checkout
      - run:
          name: Armake
          command: |
            armake --help
```
