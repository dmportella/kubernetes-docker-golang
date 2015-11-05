#! /bin/bash
echo
echo "Building go application."
echo
go build -o hotel-api .
echo
echo "Building docker image."
echo
docker build -t hotel-api:latest .
echo
echo "Running docker image."
echo
docker run -it --rm --name hotel-api --publish 8000:8000 hotel-api
echo
echo "Deleting the docker image."
echo
docker rmi hotel-api
echo