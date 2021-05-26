docker-ns3-ndn
==============

## Follow these instructions to run this project:

1. Build the ubuntu18-ns3-ndn Dockerfile to create the Ubuntu image with all the required dependencies to run NS-3 and ndnSIM;

```shell
docker build -t ubuntu18-ns3-ndn .
```

2. Build the ubuntu18-developer Dockerfile. If you have uploaded the ubuntu18-ns3-ndn image to Docker Hub, it will be necessary to change the repository in line #1 of the Dockerfile (FROM ubuntu18-ns3-ndn:latest);

```shell
docker build \
--build-arg username=${USER} \
--build-arg uid=$(id -u) \
--build-arg gid=$(id -g) \
-t ubuntu18-developer .
```

3. Run the ubuntu18-developer. It is recommended to create volumes to persist the "scratch" folder data.

```shell
docker run -it --rm --name container_dev -e DISPLAY=$DISPLAY \
-v "${HOME}/.Xauthority:${HOME}/.Xauthority:rw" \
-v "/tmp/.X11-unix:/tmp/.X11-unix" \
ubuntu18-developer
```

Note:  Much more substantial information about ns-3 and ndnSim can be found at:

http://www.nsnam.org

https://ndnsim.net/current/