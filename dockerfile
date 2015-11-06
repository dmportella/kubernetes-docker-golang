FROM ubuntu:14.04
MAINTAINER Daniel Portella
LABEL version="1.0.0"
LABEL description="Go process example for docker."

RUN mkdir api
ADD hotel-api /api/
RUN chmod +x /api/hotel-api 

ENV ENVIRONMENT development
ENV BINDING :8000

# Define working directory.
WORKDIR /api

RUN groupadd -r gogroup -g 433 && \
	useradd -u 431 -r -g gogroup -d /api -s /sbin/nologin -c "go image user" go-user && \
	chown -R go-user /api

USER go-user

EXPOSE 8000

# Define default command.
ENTRYPOINT /api/hotel-api