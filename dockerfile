FROM ubuntu:14.04
MAINTAINER Daniel Portella
LABEL version="1.0.0"
LABEL description="Go process example for docker."

# everything from here to the user command is done under root.
RUN mkdir api
ADD hotel-api /api/
RUN chmod +x /api/hotel-api 

# some environment variables
ENV ENVIRONMENT development
ENV BINDING :8000

# Define working directory.
WORKDIR /api

# Creating a group, user and adding the user to that group.
# allowing the user access to the api folder. 
RUN groupadd -r gogroup -g 433 && \
	useradd -u 431 -r -g gogroup -d /api -s /sbin/nologin -c "go image user" go-user && \
	chown -R go-user /api

# switching from root to the non-root user we just created
USER go-user

# exposing port 8000 for the go app
EXPOSE 8000

# Define default command.
ENTRYPOINT /api/hotel-api