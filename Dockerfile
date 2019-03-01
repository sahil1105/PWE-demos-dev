FROM jupyter/minimal-notebook:latest

USER root

# download dlv
RUN cd /opt && \
	wget http://www.dlvsystem.com/files/dlv.x86-64-linux-elf-static.bin -O dlv && \
	chmod +x dlv && \
	ln -s /opt/dlv /usr/bin


USER jovyan

# get the clingo binary file for linux
# and install 
# get the clingo binary file using conda install
RUN conda install -c potassco clingo 
RUN conda install -c anaconda graphviz
RUN conda install -c anaconda pygraphviz

# install PW_explorer	
RUN pip install PW_explorer

# prepare a home directory for answer set programming
RUN cd ~ && \
	mkdir asp

RUN mkdir $HOME/work/clingo_files
COPY *.ipynb $HOME/asp/
COPY clingo_files $HOME/asp/clingo_files

MAINTAINER Nikolaus Parulian <nikolaus.nova@gmail.com>
