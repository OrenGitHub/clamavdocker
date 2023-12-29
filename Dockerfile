FROM ubuntu:22.04
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get install -y \
  `# install tools` \
  gcc make pkg-config python3 python3-pip python3-pytest valgrind cmake \
  `# install clamav dependencies` \
  check libbz2-dev libcurl4-openssl-dev libjson-c-dev libmilter-dev \
  libncurses5-dev libpcre2-dev libssl-dev libxml2-dev zlib1g-dev
RUN apt-get install curl -y
RUN apt-get install git -y
RUN apt-get install wget -y
RUN wget https://www.clamav.net/downloads/production/clamav-1.2.1.tar.gz
RUN tar -xf clamav-1.2.1.tar.gz
RUN cd clamav-1.2.1 && mkdir build
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="$HOME/.cargo/bin:${PATH}"
RUN cd clamav-1.2.1/build && cmake -DDEBUG=ON -DCMAKE_C_FLAGS:STRING=-g -DCMAKE_CXX_FLAGS:STRING=-g -DOPTIMIZE:BOOL=OFF -DCMAKE_BUILD_TYPE:STRING=DebWithDebInfo -DENABLE_STATIC_LIB:BOOL=ON ..
RUN cd clamav-1.2.1/build && make
RUN apt-get install file -y
RUN file clamav-1.2.1/build/clamdtop/clamdtop
RUN objdump -S -D clamav-1.2.1/build/clamdtop/clamdtop > clamav-1.2.1/build/clamdtop/clamdtop.asm
