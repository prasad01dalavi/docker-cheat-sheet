# This will be considered as comment
# We can get scratch image from repository and start from there
# But now getting base image as ubuntu
FROM ubuntu

MAINTAINER Prasad Dalavi <prasad01dalavi@gmail.com>

# Executed during the building of image
RUN apt-get update

# Run during container creation
CMD ["echo", "Hello World...! This is my first docker image"]


