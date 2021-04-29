FROM ubuntu:18.04
MAINTAINER Lucas Tosi <tosi@stefaninirafael.com>
LABEL Description="Docker image for NS-3 Network Simulator - FAPESP"
ENV DEBIAN_FRONTEND noninteractive

# Pre-requisites:
RUN apt-get update && \
	apt-get install -y \
	wget \
	sudo \
	apt-utils \
	curl \
	net-tools \
	wireshark \
	gnuplot \
	gcc \
	g++ \
	python \
	python3 \
	python3-dev \
	python3-setuptools \
	git \
	mercurial \
	qt5-default \
	gir1.2-goocanvas-2.0 \
	python-gi \
	python-gi-cairo \
	python-pygraphviz \
	python3-gi \
	python3-gi-cairo \
	python3-pygraphviz \
	gir1.2-gtk-3.0 \
	ipython \
	ipython3 \
	openmpi-bin \
	openmpi-common \
	openmpi-doc \
	libopenmpi-dev \
	autoconf \
	cvs \
	bzr \
	unrar \
	gdb \
	valgrind \
	uncrustify \
	doxygen \
	graphviz \
	imagemagick \
	texlive \
	texlive-extra-utils \
	texlive-latex-extra \
	texlive-font-utils \
	texlive-lang-portuguese \
	dvipng \
	latexmk \
	python3-sphinx \
	dia \
	gsl-bin \
	libgsl-dev \
	libgsl23 \
	libgslcblas0  \
	tcpdump \
	sqlite \
	sqlite3 \
	libsqlite3-dev \
	libxml2 \
	libxml2-dev \
	cmake \
	libc6-dev \
	libc6-dev-i386 \
	libclang-6.0-dev \
	llvm-6.0-dev \
	automake \
	python-pip \
	python3-pip \
	libgtk2.0-0 \
	libgtk2.0-dev \
	vtun \
	lxc \
	uml-utilities \
	libboost-signals-dev \
	libboost-filesystem-dev \	
	build-essential \	
	libboost-all-dev \
	libssl-dev \
	castxml \
	libgirepository1.0-dev \
	python3-pygccxml &&\
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*
	    
RUN pip3 install distro \
	kiwi

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

# NS-3:
RUN mkdir -p -m 777 /simulators && \
    cd /simulators/ && \
    git clone https://gitlab.com/nsnam/bake && \
    export BAKE_HOME=/simulators/bake && \
    export PATH=$PATH:$BAKE_HOME && \
    export PYTHONPATH=$PYTHONPATH:$BAKE_HOME && \
    bake.py check && \
    bake.py configure -e ns-3.30.1 && \
    bake.py show && \
    bake.py deploy && \
    cd /simulators/source/ns-3.30.1/ && \
    ./waf -d optimized configure && \
    ./waf && \
    ./waf configure --enable-examples --enable-tests && \
    ./waf build && \
    cd /simulators/source/netanim-3.108 && \
    make clean && \
    qmake NetAnim.pro && \
    make

# Compiling and running ndnSIM
RUN mkdir -p -m 777 /simulators/ndnSIM && \
    cd /simulators/ndnSIM/ && \
    git clone https://github.com/named-data-ndnSIM/ns-3-dev.git ns-3 && \
    git clone https://github.com/named-data-ndnSIM/pybindgen.git pybindgen && \
    git clone --recursive https://github.com/named-data-ndnSIM/ndnSIM.git ns-3/src/ndnSIM && \
    cd ns-3 && \
    ./waf configure --enable-examples && \
    ./waf

RUN chown -R developer /simulators

USER developer
ENV HOME /home/developer
WORKDIR /home/developer

