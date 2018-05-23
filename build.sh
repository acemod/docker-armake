#!/bin/bash

DOCKER_IMAGE=acemod/armake
TAGS=(v0.6.2 v0.6.1 v0.6 v0.5.1 master)

docker build -t $DOCKER_IMAGE:latest --build-arg REVISION=v0.6.2 .
docker push $DOCKER_IMAGE:latest

for VERSION_TAG in "${TAGS[@]}"
do
  echo docker build -t $DOCKER_IMAGE:$VERSION_TAG --build-arg REVISION=$VERSION_TAG .
  docker build -t $DOCKER_IMAGE:$VERSION_TAG --build-arg REVISION=$VERSION_TAG .
  docker push $DOCKER_IMAGE:$VERSION_TAG
done
