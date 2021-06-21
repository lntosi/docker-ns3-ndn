docker-ns3-ndn
==============
**Recommended OS: Debian 10**

## Table of Contents:

1) [Building this Project from scratch](#how-to-build-this-project)
2) [Building this Project using the Docker Hub image](#a-simpler-and-faster-method)


## How to build this Project

1) Download this repository to your computer;

2) Access the ubuntu18-ns3-ndn Dockerfile folder to build the Ubuntu image with all the required dependencies to run NS-3 and ndnSIM;

```shell
docker build -t ubuntu18-ns3-ndn .
```

3) Access the ubuntu18-developer Dockerfile folder to build the image that you will use. If you have uploaded the ubuntu18-ns3-ndn image to Docker Hub, it will be necessary to change the repository in line #1 of the Dockerfile (FROM ubuntu18-ns3-ndn:latest);

```shell
docker build \
--build-arg username=${USER} \
--build-arg uid=$(id -u) \
--build-arg gid=$(id -g) \
-t ubuntu18-developer .
```

4) Run the ubuntu18-developer. It is recommended to create volumes to persist the "scratch" folder data.

```shell
docker run -it --rm --name container_dev -e DISPLAY=$DISPLAY \
-v "${HOME}/.Xauthority:${HOME}/.Xauthority:rw" \
-v "/tmp/.X11-unix:/tmp/.X11-unix" \
ubuntu18-developer
```

## A simpler and faster method

1) Download the ubuntu18-developer Dockerfile folder to your computer;

2) Change line #1 of the Dockerfile to (instead of building the ubuntu18-ns3-ndn image, you will download it from Docker Hub):

`FROM lntosi/ubuntu18-ns3-ndn:latest`

3) Build the image that you will use;

```shell
docker build \
--build-arg username=${USER} \
--build-arg uid=$(id -u) \
--build-arg gid=$(id -g) \
-t ubuntu18-developer .
```

**Note:  Much more substantial information about ns-3 and ndnSIM can be found at:**

`http://www.nsnam.org`

`https://ndnsim.net/current/`