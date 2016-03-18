#!/bin/bash

REPO=dmportella/golangweb
TAG=${TAG:-$(grep version dockerfile | awk '{print $3}')}
IMAGE=${REPO}:${TAG}

echo "docker build -t ${IMAGE} ."
docker build -t ${IMAGE} . > docker-build.log

IMAGE_ID=$(grep 'Successfully built' docker-build.log | awk '{print $3}')

echo "Tagging latest" ${IMAGE_ID} 

echo "docker tag ${IMAGE_ID} ${REPO}:latest"
docker tag ${IMAGE_ID} ${REPO}:latest

echo "done building" ${IMAGE}
