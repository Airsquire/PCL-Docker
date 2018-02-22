
# Install VTK
FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y wget
RUN wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main"
RUN apt-get update
RUN apt-get install -y build-essential --fix-missing
RUN apt-get install -y git cmake --no-install-recommends --fix-missing
RUN apt-get install -y freeglut3-dev
RUN cd /opt && git clone git://vtk.org/VTK.git VTK 
RUN cd /opt/VTK && git checkout tags/v8.0.0
RUN cd /opt/VTK && mkdir build
RUN cd /opt/VTK/build && cmake -DCMAKE_BUILD_TYPE:STRING=Release -D VTK_RENDERING_BACKEND=OpenGL ..
RUN cd /opt/VTK/build && make -j 32 && make install


