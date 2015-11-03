# GO Lang in Docker and managed by Kubernetes

This is a work in progress to get a go lang application containerized in docker and being managed in a kubernete cluster.

## 0 - Dependencies
**Note:** *Please note this has been developed and tests using a linux debian OS (mint distro)*

- Docker: http://www.docker.com/
- Go Lang: https://golang.org/
- kubernete: http://kubernetes.io/

## 1 - GO Lang App

Simple hello world app running by defaul on port 8000.

**To build run** *this will build a single package called hotel-api*
 
> $ *go build -o hotel-api .*

## 2 - Build container

**deletes all images with this name if you already have them**

> $ *docker rmi hotel-api*

**build image**

> $ *docker build -t hotel-api:latest .*

**run docker instance dev mode**

> $ *docker run -it --rm --name hotel-api --publish 8000:8000 hotel-api*

## 3 - Kubernetes

This is a work in progress but replication controller file and pod config file is done.

Not tested it yet as I am still working on my kubernete environment.

## License

See license file included in the repository. 

...Hmmm Muffins