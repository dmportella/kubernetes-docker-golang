# GO Lang in Docker and managed by Kubernetes

This is a work in progress to get a go lang application containerized in docker and being managed in a kubernete cluster.

## 0 - Dependencies
**Note:** *Please note this has been developed and tests using a linux debian OS (mint distro)*

- Docker: http://www.docker.com/
- Go Lang: https://golang.org/
- kubernete: http://kubernetes.io/

## 1 - Building the solution

The solution can be run by calling the *build.sh* file in the root of the repository.

> $ *bash build.sh*

**Note:** *Please note this will run all the commands listed below which will build the app, build the container, run it and clean up by deleting the image locally.*

### 1.1 - GO Lang App

Simple hello world app running by defaul on port 8000.

**To build run** *this will build a single package called hotel-api*
 
> $ *go build -o hotel-api .*

### 1.2 - Build container

This section has each command used to build and run the go container.

**Deletes all images with this name if you already have them**

> $ *docker rmi hotel-api*

**Build docker Image**

> $ *docker build -t hotel-api:latest .*

**Run docker instance dev mode**

> $ *docker run -it --rm --name hotel-api --publish 8000:8000 hotel-api*

## 2 - Kubernetes

This is a work in progress but replication controller, the pod and service files are done.

Not tested it yet as I am still working on my kubernete environment which I am planning to automate the creation of it and put it here.

## License

See license file included in the repository.

...Hmmm Muffins