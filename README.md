# docker-ns3-ndn

## Follow these instructions to run this project:

1. Build the ubuntu-app Dockerfile to create the Ubuntu image with all the required dependencies to run NS-3 and ndnSIM;
2. This step is optional, but it is good to upload the ubuntu-app image to the Docker Hub to push further updates, if necessary;
3. Build the ubuntu-dev Dockerfile. If you have uploaded the ubuntu-app image, it will be necessary to change the repository in line #1 of the Dockerfile (FROM lntosi/ubuntu-app:latest);
4. Run the ubuntu-dev image. It is recommended to create volumes to persist the scratch folder data.
