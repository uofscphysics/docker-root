FROM uofscphysics/base

LABEL maintainer="tylern@jlab.org"

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

RUN useradd -m user && chmod a+w /home/user
USER user
WORKDIR /home/user
ADD entry_point.sh /usr/local/bin/entry_point.sh
ENTRYPOINT ["/usr/local/bin/entry_point.sh"]
