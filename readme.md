# kubernetes-docker-golang

Simple golang web site using mux to run on KUBERNETES or RANCHER and other docker management platforms.

[![Build Status](https://travis-ci.org/dmportella/kubernetes-docker-golang.svg?branch=master)](https://travis-ci.org/dmportella/kubernetes-docker-golang)

## DOCKERHUB

[![dockeri.co](http://dockeri.co/image/dmportella/golangweb)](https://hub.docker.com/r/dmportella/golangweb/)

## GOLANGWEB

Simple golang site with route to simulate site failure.

Built for testing *kubernetes* and *rancher* instances.

### Normal route

Web site should be available on port `8080`.

### Health check
```
GET /__health
{
version: "1.0.0",
status: "OK"
}
```
#### routes
* Health check url.: `/__health/`
* Set to throw 500: `/__health/throw500`
* Set to time out: `/__health/timeout`
* Set kill the process: `/__health/killprocess`

## Building

The shell file `build.sh` will run npm install, install and run grunt and it will build and run the docker image.

> $ `./build.sh`

Builds docker image and tags it.

> $ `./build-image.sh`

* Installs godep and other setup things

> $ `./setup.sh`