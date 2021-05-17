FROM ubuntu18-ns3-ndn:latest
MAINTAINER Lucas Tosi <lntosi@hotmail.com>
LABEL Description="Docker image for Developers"
ENV DEBIAN_FRONTEND noninteractive

ARG username
ARG uid
ARG gid

RUN groupadd -g $gid $username
RUN useradd -ms /bin/bash --gid $gid --uid $uid $username && adduser $username sudo && echo -n "$username:senha" | chpasswd

RUN chown -R $username /simulators/
RUN chmod 777 -R /simulators/

USER $username
WORKDIR /home/$username
CMD "/bin/bash"
