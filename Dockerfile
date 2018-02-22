#
# pcl dockerfile
# Author: Airsquire You Yue
# Pull base image.
FROM ubuntu:16.04
FROM nvidia/cuda:9.1-devel

# Install.
RUN apt-get update

RUN apt-get install -y software-properties-common
RUN apt-get install -y ca-certificates
RUN apt-get install -y wget 
RUN apt-get install -y curl 
RUN apt-get install -y ssh 

RUN wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main"

RUN apt-get update
RUN apt-get install -y build-essential


RUN apt-get install -y  \
  mc \
  lynx \
  libvtk5.10 libvtk5-dev \
  libqhull* \
  pkg-config \
  python2.7-dev \
  --no-install-recommends --fix-missing


RUN apt-get install -y  \
  mesa-common-dev \
  cmake  \
  git  \
  mercurial \
  freeglut3-dev \
  libflann-dev \
  --no-install-recommends --fix-missing


RUN apt-get autoremove

# Install Boost
RUN wget -O boost_1_58_0.tar.gz http://sourceforge.net/projects/boost/files/boost/1.58.0/boost_1_58_0.tar.gz/download
RUN tar xzvf boost_1_58_0.tar.gz && rm boost_1_58_0.tar.gz
RUN apt-get update
RUN apt-get install -y build-essential g++ python-dev autotools-dev libicu-dev build-essential libbz2-dev libboost-all-dev
RUN cd boost_1_58_0 && ./bootstrap.sh --prefix=/usr/local
RUN cd boost_1_58_0 && ./b2 
RUN cd boost_1_58_0 ./b2 install
RUN dpkg -s libboost-dev | grep 'Version'

# Install Eigen
RUN cd /opt && hg clone -r 3.2 https://bitbucket.org/eigen/eigen eigen
RUN mkdir -p /opt/eigen/build
RUN cd /opt/eigen/build && cmake ..
RUN cd /opt/eigen/build && make install

# Install VTK
RUN cd /opt && git clone git://vtk.org/VTK.git VTK
RUN cd /opt/VTK && mkdir VTK-build
RUN cd /opt/VTK/VTK-build && cmake -DCMAKE_BUILD_TYPE:STRING=Release ..

RUN cd /opt && git clone https://github.com/PointCloudLibrary/pcl.git pcl
RUN cd /opt/pcl && git checkout tags/pcl-1.8.1
RUN mkdir -p /opt/pcl/build
RUN cd /opt/pcl/build && cmake -D WITH_CUDA=true BUILD_GPU=true ..
RUN cd /opt/pcl/build && make -j 32
RUN cd /opt/pcl/build && make install
RUN cd /opt/pcl/build && make test
RUN cd /opt/pcl/build && make clean
