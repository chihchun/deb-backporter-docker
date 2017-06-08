
FROM ubuntu:xenial
MAINTAINER Rex Tsai "http://about.me/chihchun"

ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i "/^# deb.*universe/ s/^# //" /etc/apt/sources.list
RUN sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get -y --no-install-recommends install \
    ubuntu-dev-tools \
    devscripts \
    equivs \
    cdbs \
    build-essential \
    git \
    git-buildpackage

RUN apt-get clean

# Setup sudo for apt-get
RUN apt-get install -y sudo
RUN echo "ALL ALL=NOPASSWD: /usr/bin/apt-get,/usr/bin/dpkg,/usr/bin/mk-build-deps" >> /etc/sudoers.d/apt-get \                                             
 && chmod 0440 /etc/sudoers.d/apt-get

ADD build.sh /usr/local/bin/build.sh
RUN chmod 755 /usr/local/bin/build.sh
RUN useradd --create-home ubuntu
USER ubuntu
WORKDIR /home/ubuntu/build
CMD /usr/local/bin/build.sh
