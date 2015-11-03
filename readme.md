# GO Lang in Docker and managed by Kubernetes

This is a work in progress to get a go lang application containerized in docker and being managed in a kubernete cluster.

## GO Lang App

Simple hello world app running by defaul on port 8000.

to build run *go build .*

## Build container

**deletes all images with this name if you already have them**

docker rmi hotel-api

**build image**

docker build -t hotel-api:lastest .

**run docker instance dev mode**

docker run -it --rm --name hotel-api --publish 8000:8000 hotel-api

## Kubernetes

This is a work in progress but replication controller file and pod config file is done.

Not tested it yet as I am still working on my kubernete environment. 

...Hmmm Muffins