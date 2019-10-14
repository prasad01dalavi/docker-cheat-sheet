# Docker Tutorial

## Installation (Ubuntu):
```
# Install Docker on Ubuntu 16.04 LTS
sudo apt-get install docker.io

# Verify Installation:
docker --version

# User docker cmd without sudo
sudo usermod -a -G docker <username>       # and then restart

# Run first docker image (if not present then it is downloaded and run):
sudo docker run hello-world

apt install docker-compose                 # Install Docker Compose
docker-compose -v                          # Docker Compose Version
```

## Commands

```
sudo service docker start                           # To start the docker
sudo service docker stop                            # To stop the docker
sudo docker info                                    # Get the Information about the docker
sudo docker images                                  # List down the docker images
sudo docker ps                                      # List running containers
sudo docker ps -a                                   # List down all containers with status

sudo docker run <image_name/image_id>               # Run the docker image
sudo docker rmi <image_id>                          # Remove the docker image (-f for forcefully delete)
docker rm $(docker ps -a -q)                        # Remove all docker containers
sudo docker run -it ubuntu                          # Start linux terminal interactive mode
docker exec -it <cotainer_id> bash                  # Log In into container

sudo docker start <image_id>                        # Start the container
sudo docker start <first 2-digits of container_id>  # start the container

sudo docker stats                                   # Memory, CPU etc Live Usage
sudo docker system df                               # Disk Usage 
sudo docker system prun                             # Delete Non running images
sudo docker inspect <image_name/id>                 # Details of Image
docker build -t my_image1:1.0 .                     # Buid the image from docker file with name Dockerfile
docker build -t my_image2:my_tag -f Dockerfile2 .   # default tag is latest, -f is used to specify the dockerfile, location

# Passing args while building an Image
docker build -t apache:user -f Dockerfile4  --build-arg user=prasad --build-arg myarg=cool .

docker network ls                                   # Network and Drivers list

docker login                                        # Login to Docker Hub Account
docker commit <container_id> prasad01dalavi/flask-server  # commit (save) the (new) image
docker push prasad01dalavi/flask-server             # Push the image on Docker Hub
docker image pull prasad01dalavi/flask-server       # Pull(download) the image locally

```
### Dockerfile1:
- Simple Nginx Server which overwrite the contents of default index file

### Dockerfile2
- ADD: To download contents from the Internet
- ENV: How to set environment variables and use them further

### Dockerfile3
- LABEL: To provide metadata for the dockerfile
- WORKDIR: Declare/Create the working directory

### Dockerfile4
- RUN useradd: Adding new user
- USER: Chaging User permissions
- ARG: Provide arguments while building an image
