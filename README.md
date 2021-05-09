# docker-ns3-ndn

## Follow these instructions to run this project:

1. Build the ubuntu18-simulators Dockerfile to create the Ubuntu image with all the required dependencies to run NS-3 and ndnSIM;
'''
docker build -t ubuntu18-simulators .
'''
2. Build the ubuntu18-developer Dockerfile. If you have uploaded the ubuntu18-simulators image to Docker Hub, it will be necessary to change the repository in line #1 of the Dockerfile (FROM ubuntu18-simulators:latest);
'''
docker build \
--build-arg username=${USER} \
--build-arg uid=$(id -u) \
--build-arg gid=$(id -g) \
-t ubuntu18-developer .
'''
3. Run the ubuntu18-developer. It is recommended to create volumes to persist the "scratch" folder data.
'''
docker run -it --rm --name container_dev -e DISPLAY=$DISPLAY \
-v "${HOME}/.Xauthority:${HOME}/.Xauthority:rw" \
-v "/tmp/.X11-unix:/tmp/.X11-unix" \
ubuntu18-developer
'''