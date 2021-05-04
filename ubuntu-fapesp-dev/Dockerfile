FROM lntosi/ubuntu-fapesp-app:latest
MAINTAINER Lucas Tosi <tosi@stefaninirafael.com>
LABEL Description="Docker image for Developers - FAPESP"
ENV DEBIAN_FRONTEND noninteractive

ARG username
ARG uid
ARG gid

RUN groupadd -g $gid $username
RUN useradd -m -u $uid -g $gid -s /bin/bash $username

RUN chown -R $username /simulators

USER $username
WORKDIR /home/$username
CMD "/bin/bash"