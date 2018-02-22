# Install Eigen
FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y build-essential --fix-missing
RUN apt-get install -y  \
    ca-certificates \
    mercurial \
    cmake \
    --no-install-recommends --fix-missing
RUN cd /opt && hg clone -r 3.2 https://bitbucket.org/eigen/eigen eigen
RUN mkdir -p /opt/eigen/build
RUN cd /opt/eigen/build && cmake ..
RUN cd /opt/eigen/build && make install