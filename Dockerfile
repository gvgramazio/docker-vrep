FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
  wget \
  libglib2.0-0  \
  libgl1-mesa-glx \
  xcb \
  "^libxcb.*" \
  libx11-xcb-dev \
  libglu1-mesa-dev \
  libxrender-dev \
  libxi6 \
  libdbus-1-3 \
  libfontconfig1

RUN wget http://coppeliarobotics.com/files/V-REP_PRO_EDU_V3_5_0_Linux.tar.gz
RUN tar -xf V-REP_PRO_EDU_V3_5_0_Linux.tar.gz
RUN apt-get remove -y wget

RUN echo 'export QT_DEBUG_PLUGINS=1' >> ~/.bashrc
RUN echo 'export PATH=/V-REP_PRO_EDU_V3_5_0_Linux/:$PATH' >> ~/.bashrc

# Install python3 and python packages
RUN apt-get install -y git python3 python3-pip
RUN python3 -m pip install numpy matplotlib psutil

# Download vrepper
RUN git clone https://github.com/gvgramazio/vrepper.git

# Install xvfb to emulates a dumb framebuffer using virtual memory.
RUN apt-get install -y xvfb
