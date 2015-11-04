# For running a client to bounce off of @ port 9004:
# sudo docker run -d --net=none --expose=[9000] -p 127.0.0.1:9004:9000 -t alljoyn-builder:production
# To connect to this machine after running it

FROM ubuntu

MAINTAINER borromeotlhs@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yq 
RUN apt-get install build-essential subversion libncurses5-dev zlib1g-dev gawk gcc-multilib flex git-core gettext libssl-dev unzip python2.7 wget -yq


#RUN adduser openwrt openwrt
#USER openwrt
#WORKDIR ~/

RUN git clone git://git.openwrt.org/openwrt.git

WORKDIR openwrt

RUN useradd -m -d /home/onion -p onion onion && adduser onion sudo && chsh -s /bin/bash onion
RUN chown -R onion:onion .

USER onion
RUN cp feeds.conf.default feeds.conf
RUN echo "src-git alljoyn https://git.allseenalliance.org/gerrit/core/openwrt_feed.git;master" >> feeds.conf
#RUN echo "src-git alljoyn git://git.allseenalliance.org/gerrit/core/openwrt_feed;attitude_adjustment" >> feeds.conf

RUN ./scripts/feeds update -a
RUN ./scripts/feeds install -a -p alljoyn
RUN ./scripts/feeds install -a -p luci

USER root
RUN ln -s /usr/bin/python2.7 /usr/bin/python
USER onion

#make defconfig
#make prereq
#make menuconfig
