#
# pcl dockerfile
# Author: Airsquire You Yue
# Pull base image.
FROM ubuntu:16.04
FROM nvidia/cuda:8.0-devel
FROM youyue/boost-docker:1.58.0
FROM youyue/eigen-docker:3.2
FROM youyue/vtk-docker:8.0
# Install neccessary tools
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y ca-certificates
RUN wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main"
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y  \
  mc \
  lynx \
  libqhull* \
  pkg-config \
  libxmu-dev \
  libxi-dev \
  python2.7-dev \
  --no-install-recommends --fix-missing
RUN apt-get install -y  \
  mesa-common-dev \
  cmake  \
  git  \
  freeglut3-dev \
  libflann-dev \
  --no-install-recommends --fix-missing
RUN apt-get autoremove
# Instal PCL
RUN cd /opt && git clone https://github.com/PointCloudLibrary/pcl.git pcl
RUN cd /opt/pcl && git checkout tags/pcl-1.8.1
RUN mkdir -p /opt/pcl/build
RUN cd /opt/pcl/build && cmake -D WITH_CUDA=true -D BUILD_GPU=true -D BUILD_visualization=true -D BUILD_CUDA=true -D VTK_DIR=/opt/VTK/build -D BUILD_2d=true ..
RUN cd /opt/pcl/build && make -j 32
RUN cd /opt/pcl/build && make install
RUN cd /opt/pcl/build && make test
RUN cd /opt/pcl/build && make clean
