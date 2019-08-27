FROM ubuntu:18.04

LABEL maintainer="tylern@jlab.org"
ARG NCORES=8
ARG ROOT_VERSION=v6-18-02

RUN apt-get update \
  && apt-get install -y \
    git dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev \
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

WORKDIR /tmp
RUN git clone https://github.com/root-project/root.git root_source \
  && cd root_source \
  && git checkout ${ROOT_VERSION} \
  && rm -rf /opt/root_source/.git \
  && mkdir compile && cd compile \
  && cmake -Dgminimal=ON -Dpython=ON -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    -Dcxx17=ON -Droot7=ON -Droofit=ON \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr/local/root /tmp/root_source \
  && make -j ${NCORES} && make install \
  && rm -rf /tmp/root_source


ENV ROOTSYS /usr/local/root
ENV PATH $ROOTSYS/bin:$PATH
ENV PYTHONDIR $ROOTSYS
ENV LD_LIBRARY_PATH $ROOTSYS/lib:$PYTHONDIR/lib:$LD_LIBRARY_PATH
ENV PYTHONPATH $ROOTSYS/lib:$PYTHONPATH

RUN pip3 --no-cache-dir install -U pip && rm -rf /tmp/*
RUN pip3 --no-cache-dir install numpy
RUN pip3 --no-cache-dir install \
    pandas \
    numba \
    cython \
    iminuit \
    lz4 \
    mpi4py \
    scipy \
    scikit-learn \
    jupyter \
    matplotlib \
    tqdm \
    bokeh \
    seaborn \
    ggplot \
    statsmodels \
    metakernel \
    && rm -rf /tmp/*

RUN ROOTSYS=$ROOTSYS pip3 --no-cache-dir install root-numpy uproot rootpy && rm -rf /tmp/*
RUN rm -rf /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python
RUN rm -rf /usr/bin/pip && ln -s /usr/bin/pip3 /usr/bin/pip

RUN useradd -m user && chmod a+w /home/user
USER user
WORKDIR /home/user
RUN mkdir -p /home/user/.local/share/jupyter/kernels
RUN cp -r $ROOTSYS/etc/notebook/kernels/root /home/user/.local/share/jupyter/kernels
ADD entry_point.sh /usr/local/bin/entry_point.sh
ENTRYPOINT ["/usr/local/bin/entry_point.sh"]
CMD ["ipython3"]
