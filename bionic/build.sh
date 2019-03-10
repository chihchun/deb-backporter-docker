#!/bin/sh
set -x
# Install dependency 
if [ -f debian/control ] ; then
    sudo mk-build-deps debian/control -i --tool 'apt-get -y --no-install-recommends'
fi
if [ -f debian/rules ] ; then
    dpkg-buildpackage -rfakeroot -d -us -uc -b
fi 
exec /bin/bash