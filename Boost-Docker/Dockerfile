# boost 1.58.0 dockerfile
# Author: Airsquire You Yue
FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y wget 
RUN wget -O boost_1_58_0.tar.gz http://sourceforge.net/projects/boost/files/boost/1.58.0/boost_1_58_0.tar.gz/download
RUN tar xzvf boost_1_58_0.tar.gz && rm boost_1_58_0.tar.gz
RUN apt-get update
RUN apt-get install -y build-essential g++ python-dev autotools-dev libicu-dev build-essential libbz2-dev libboost-all-dev
RUN cd boost_1_58_0 && ./bootstrap.sh --prefix=/usr/local
RUN cd boost_1_58_0 && ./b2 
RUN cd boost_1_58_0 ./b2 install