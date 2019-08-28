FROM uofscphysics/base:latest

LABEL maintainer="tylern@jlab.org"
USER root

RUN pip --no-cache-dir install -U pip && rm -rf /tmp/*
RUN pip --no-cache-dir install numpy
RUN pip --no-cache-dir install \
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

USER user
WORKDIR /home/user
ADD entry_point.sh /usr/local/bin/entry_point.sh
ENTRYPOINT ["/usr/local/bin/entry_point.sh"]
