# Docker Tutorial

## Best Practices
- One service per container
- Build Context should be small
- Avoid unnecessary packages
- Less Layers


## Installation (Ubuntu)
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
docker images -f dangling=true                      # Filter dangling images
docker images -f dangling=true -q                   # List the Image IDs of dangling images
echo $(docker images -f dangling=true -q)           # list of images, -q for listing the IDs
docker images | grep <search keyword>               # filter images by the keyword
sudo docker ps                                      # List running containers
sudo docker ps -a                                   # List down all containers with status

sudo docker run <image_name/image_id>               # Run the docker image

# Run the docker image (create container)
docker run --name <container_name> -p <system_port>:<container_port> <image_name> 

sudo docker rmi <image_id>                          # Remove the docker image (-f for forcefully delete)
docker rmi <image:tag>                              # When have child images error
docker rm $(docker ps -a -q)                        # Remove all docker containers
sudo docker run -it ubuntu                          # Start linux terminal interactive mode
docker exec -it <cotainer_id> bash                  # Log In into container
docker cp apache:/var/www/html/copy.html .          # Copy file from container to dockerhost current dir
sudo docker start <cotainer_id/name>                # Start the container
sudo docker start <first 2-digits of container_id>  # start the container

sudo docker stats                                   # Memory, CPU etc Live Usage

# Allocate the memory and cpu count to container
docker run -d --name nginx -p 9090:80 --memory 200mb --cpuset-cpus 2 nginx

sudo docker system df                               # Disk Usage 
sudo docker system prun                             # Delete Non running images
sudo docker inspect <image_name/id>                 # Details of Image
docker container inspect <container_id/name>        # Details of container, network etc
docker exec -it <container> bash -c "ping IP"       # Ping the container ip 

docker build -t my_image1:1.0 .                     # Buid the image from docker file with name Dockerfile
docker build -t my_image2:my_tag -f Dockerfile2 .   # default tag is latest, -f is used to specify the dockerfile, location

# Passing args while building an Image
docker build -t apache:user -f Dockerfile4  --build-arg user=prasad --build-arg myarg=cool .

# Bind Volume to container (Here its Mysql)
docker run -d -p 3307:3306 -v $PWD/mysql_data:/var/lib/mysql/ -e "MYSQL_ROOT_PASSWORD=<root_user_password>" mysql

docker volume ls -f dangling=true                   # List dangling/orphans volumes

docker network ls                                   # Network and Drivers list
docker network inspect <network_name>               # Get the details of the network

# Create and configure network
docker network create -d bridge --subnet 192.168.0.0/16 --gateway 192.168.0.1 <network_name>

docker network rm <network_name>                    # Remove network (default network e.g. bridge can not be removed)

docker login                                        # Login to Docker Hub Account
<new_image> = <username/image_name>                 # To push on dockerhub
docker commit <container_id> <new_image>            # commit (save) the (new) image
docker push <new_image>                             # Push the image on Docker Hub
docker image pull prasad01dalavi/flask-server       # Pull(download) the image locally
# --------------------------------------------------------------------------------------------------------------------------
```
### Dockerfile1
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

### Dockerfile5
- fallocate: For creating/allocating the file size
- multistaging: To reduce the image size
