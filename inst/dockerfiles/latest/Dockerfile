# Example host distro
FROM ubuntu:latest

# Install deps
RUN apt-get update && apt-get install -y python3 python3-networkx sqlite3 \
  python3-clint mafft ncbi-blast+ mcl cython3 wget git autotools-dev autoconf \
  automake cmake libtool liblapack-dev libatlas-cpp-0.6-dev libnlopt-dev \
  libnlopt0 libarmadillo-dev

# Install FastTree
RUN wget http://www.microbesonline.org/fasttree/FastTree.c && \
  gcc -O3 -finline-functions -funroll-loops -Wall -o FastTree FastTree.c -lm \
  && mv FastTree bin/

# Install Phyix
RUN git clone --depth=1 https://github.com/FePhyFoFum/phyx.git && cd phyx/src \
  && ./configure && make && make install && cd ../..

# Finally, PyPhlawd!
RUN git clone --depth=1 https://github.com/FePhyFoFum/PyPHLAWD.git && \
  cd PyPHLAWD/src && bash compile_cython.sh

# outsider *requires* working_dir
RUN mkdir /working_dir
WORKDIR /working_dir
