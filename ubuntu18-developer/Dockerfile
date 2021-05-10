FROM ubuntu18-ns3-ndn:latest
MAINTAINER Lucas Tosi <lntosi@hotmail.com>
LABEL Description="Docker image for Developers"
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
