FROM ubuntu:18.04
MAINTAINER Lucas Tosi <lntosi@hotmail.com>
LABEL Description="Docker image for NS-3 and ndnSIM"
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Compiling Text Editors and other tools
RUN apt update && \
	apt install -y \
	wget \
	sudo \
	curl \
	apt-utils \
	net-tools \
	wireshark \
	gnuplot \
	gedit \
	vim \
	nano &&\
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Pre-requisites:
RUN apt-get update && \
	apt-get install -y \
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
	./waf configure --build-profile=optimized --enable-examples --enable-tests && \
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
	./waf -d optimized configure --enable-examples && \
	./waf

# Compiling VSCODE
RUN apt update && \
	apt install -y \
	wget \
	software-properties-common \
	apt-transport-https \
	gconf-service \
	libasound2 \
	libatk1.0-0 \
	libc6 libcairo2 \
	libcups2 \
	libdbus-1-3 \
	libexpat1 \
	libfontconfig1 \
	libgcc1 \
	libgconf-2-4 \
	libgdk-pixbuf2.0-0 \
	libglib2.0-0 \
	libgtk-3-0 \
	libnspr4 \
	libpango-1.0-0 \
	libpangocairo-1.0-0 \
	libstdc++6 \
	libx11-6 \
	libx11-xcb1 \
	libxcb1 \
	libxcomposite1 \
	libxcursor1 \
	libxdamage1 \
	libxext6 \
	libxfixes3 \
	libxi6 \
	libxrandr2 \
	libxrender1 \
	libxss1 \
	libxtst6 \
	ca-certificates \
	fonts-liberation \
	libappindicator1 \
	libnss3 \
	lsb-release \
	xdg-utils && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*

RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

RUN apt update && \
	apt install -y \
	code && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*

# Compiling Octave
RUN apt update && \
	apt install -y \
	octave \
	liboctave-dev && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*
