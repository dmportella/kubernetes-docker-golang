## Build container

'deletes all images with this name
docker rmi hotel-api

'build image
docker build -t hotel-api:lastest .

'run docker instance dev mode
docker run -it --rm --name hotel-api --publish 8000:8000 hotel-api
