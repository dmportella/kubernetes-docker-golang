#!/bin/bash
echo "CI: " $CI "TRAVIS: " $TRAVIS

echo "settting up"
./setup.sh

echo "testing"
go test

echo "golang build"
go build -o hotel-api .

echo "build docker image"
./build-image.sh

if [ -z "$TRAVIS" ]; then
	TAG=${TAG:-$(grep version dockerfile | awk '{print $3}')}
	IMAGE=dmportella/golangweb:${TAG}

	echo "running container image:" ${IMAGE}
	
	docker run -it --rm --name golangweb --publish 8080:8080 ${IMAGE}

	echo "deleting image"
	docker rmi ${IMAGE}
fi

echo "DONE"