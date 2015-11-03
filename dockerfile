FROM ubuntu:14.04
MAINTAINER Daniel Portella
LABEL version="1.0.0"
LABEL description="Go process example for docker"

RUN mkdir api
ADD hotel-api /api/
RUN chmod +x /api/hotel-api 

ENV ENVIRONMENT development
ENV BINDING :8000

# Define working directory.
WORKDIR /api

USER daemon

EXPOSE 8000

# Define default command.
ENTRYPOINT /api/hotel-api