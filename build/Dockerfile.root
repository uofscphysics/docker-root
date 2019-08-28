FROM uofscphysics/python

LABEL maintainer="tylern@jlab.org"
ARG NCORES=8
ARG ROOT_VERSION=v6-18-02

ENV ROOTSYS /usr/local/root
ENV PATH $ROOTSYS/bin:$PATH
ENV PYTHONDIR $ROOTSYS
ENV LD_LIBRARY_PATH $ROOTSYS/lib:$PYTHONDIR/lib:$LD_LIBRARY_PATH
ENV PYTHONPATH $ROOTSYS/lib:$PYTHONPATH


WORKDIR /tmp
RUN git clone https://github.com/root-project/root.git root_source \
  && cd root_source \
  && git checkout ${ROOT_VERSION} \
  && rm -rf /opt/root_source/.git \
  && mkdir compile && cd compile \
  && cmake -Dgminimal=ON -Dpython=ON -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    -DCMAKE_CXX_STANDARD=17 -Droot7=ON -Droofit=ON \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr/local/root /tmp/root_source \
  && make -j ${NCORES} && make install \
  && rm -rf /tmp/root_source


RUN mkdir -p /home/user/.local/share/jupyter/kernels
RUN cp -r $ROOTSYS/etc/notebook/kernels/root /home/user/.local/share/jupyter/kernels
ENTRYPOINT ["root"]
