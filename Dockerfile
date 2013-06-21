# runnable base
FROM ubuntu:12.04

# REPOS
RUN apt-get -y update
RUN apt-get install -y -q software-properties-common
RUN add-apt-repository -y ppa:gophers/go/ubuntu
RUN apt-get -y update

#SHIMS
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl
ENV DEBIAN_FRONTEND noninteractive

# EDITORS
RUN apt-get install -y -q vim
RUN apt-get install -y -q nano

# TOOLS
RUN apt-get install -y -q curl
RUN apt-get install -y -q git
RUN apt-get install -y -q make
RUN apt-get install -y -q wget

# BUILD
RUN apt-get install -y -q build-essential
RUN apt-get install -y -q g++

# GVM
RUN apt-get install -y -q golang
RUN apt-get install -y -q mercurial
RUN apt-get install -y -q bison
RUN apt-get install -y -q binutils
RUN apt-get install -y -q gcc
RUN curl -s https://raw.github.com/moovweb/gvm/master/binscripts/gvm-installer | bash
RUN bash -c "source $HOME/.gvm/scripts/gvm && gvm install go1.1.1"
RUN bash -c "source $HOME/.gvm/scripts/gvm && gvm use go1.1.1"

ENV DEBIAN_FRONTEND dialog