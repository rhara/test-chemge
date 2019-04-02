FROM ubuntu:16.04

COPY sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install lsof wget curl vim git unzip bzip2 -y
RUN apt-get install libxrender1 -y
RUN apt-get install build-essential libcppunit-dev libpopt-dev -y

WORKDIR /root

RUN git clone https://github.com/tsudalab/ChemGE.git

RUN wget -c --progress=bar:force:noscroll http://sourceforge.net/projects/rdock/files/rDock_2013.1_src.tar.gz
RUN tar xvf rDock_2013.1_src.tar.gz

WORKDIR /root/rDock_2013.1_src/build

RUN make -j8 linux-g++-64
RUN echo 'export RBT_ROOT="$HOME/rDock_2013.1_src"' >> $HOME/.bashrc
RUN echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$RBT_ROOT/lib"' >> $HOME/.bashrc
RUN echo 'export PATH="$PATH:$RBT_ROOT/bin"' >> $HOME/.bashrc
ENV RBT_ROOT="$HOME/rDock_2013.1_src"
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$RBT_ROOT/lib"
ENV PATH="$PATH:$RBT_ROOT/bin"

WORKDIR /root

RUN wget -q -c -O /tmp/Miniconda3-latest-Linux-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash /tmp/Miniconda3-latest-Linux-x86_64.sh -b
ENV PATH /root/miniconda3/bin:$PATH
ENV CONDA_EXE /root/miniconda3/bin/conda
RUN conda update -y -n base -c defaults conda
RUN conda create -y -n py35 -c rdkit python=3.5 rdkit nltk networkx
ENV PATH /root/miniconda3/envs/py35/bin:$PATH
ENV CONDA_DEFAULT_ENV py35
ENV CONDA_PREFIX /root/miniconda3/envs/py35

WORKDIR /root/ChemGE
