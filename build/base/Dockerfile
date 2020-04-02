FROM ubuntu:18.04

LABEL maintainer="tylern@jlab.org"

RUN apt-get update \
  && apt-get install -y \
    git wget dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev \
    libxft-dev libxext-dev zsh \
    gfortran libssl-dev libpcre3-dev \
    xlibmesa-glu-dev libglew1.5-dev libftgl-dev \
    libmysqlclient-dev libfftw3-dev libcfitsio-dev \
    graphviz-dev libavahi-compat-libdnssd-dev \
    libldap2-dev libxml2-dev libkrb5-dev \
    libcr-dev mpich \
    libgsl0-dev libqt4-dev python python3 python3-dev python3-pip \
  && rm -rf /var/lib/apt/lists/* \
  && pip3 install ipython

RUN rm -rf /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python
RUN rm -rf /usr/bin/ipython && ln -s /usr/bin/ipython3 /usr/bin/ipython
RUN rm -rf /usr/bin/pip && ln -s /usr/bin/pip3 /usr/bin/pip

RUN useradd -m user && chmod a+w /home/user
WORKDIR /home/user
