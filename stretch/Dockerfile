FROM debian:stretch
MAINTAINER Rex Tsai "http://about.me/chihchun"

ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i "/^# deb.*universe/ s/^# //" /etc/apt/sources.list
RUN sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list
RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get -y --no-install-recommends install \
    build-essential \
    devscripts \
    sbuild \
    cdbs \
    equivs \
    git-buildpackage \
    vim

RUN apt-get -y --no-install-recommends install arriero

RUN apt-get clean

# Setup sudo for apt-get
RUN apt-get install -y sudo
RUN echo "ALL ALL=NOPASSWD: /usr/bin/apt-get,/usr/bin/dpkg,/usr/bin/mk-build-deps" >> /etc/sudoers.d/apt-get \                                             
 && chmod 0440 /etc/sudoers.d/apt-get

ADD build.sh /usr/local/bin/build.sh
RUN chmod 755 /usr/local/bin/build.sh
RUN useradd --create-home builder
VOLUME /home/builder
USER builder
WORKDIR /home/builder/build
CMD /usr/local/bin/build.sh
