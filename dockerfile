FROM ubuntu:14.04
MAINTAINER Daniel Portella

ARG CONT_IMG_VER

LABEL version ${CONT_IMG_VER}
LABEL description Go process example for docker.

# everything from here to the user command is done under root.
RUN mkdir api
ADD golangweb /api/
RUN chmod +x /api/golangweb 

# some environment variables
ENV CONT_IMG_VER ${CONT_IMG_VER}
ENV ENVIRONMENT development
ENV BINDING :8080

# Define working directory.
WORKDIR /api

# Creating a group, user and adding the user to that group.
# allowing the user access to the api folder. 
RUN groupadd -r gogroup -g 433 && \
	useradd -u 431 -r -g gogroup -d /api -s /sbin/nologin -c "go image user" go-user && \
	chown -R go-user /api && \
    chmod -R 774 /api

# switching from root to the non-root user we just created
USER go-user

# exposing port 8080 for the go app
EXPOSE 8080

# Define default command.
ENTRYPOINT /api/golangweb