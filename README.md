# Docker image for Ubuntu/Debian package builder

This image contains the basic packaging tools for Ubuntu/Debian developers to backport and build Debian packages.

It includes

* build-essential - Informational list of build-essential packages
* devscripts - scripts to make the life of a Debian Package maintainer easier
* equivs - Circumvent Debian package dependencies
* cdbs - common build system for Debian packages
* git-buildpackage - Suite to help with Debian packages in Git repositories
* sbuild - Tool for building Debian binary packages from Debian sources
* arriero - Simplifies management of several Debian packages
* vim - Vi IMproved - enhanced vi editor

## Supported versions

* Ubuntu 14.04 - chihchun/deb-backporter:trusty
* Ubuntu 16.04 - chihchun/deb-backporter:xenial
* Ubuntu 18.04 - chihchun/deb-backporter:bionic
* Debian 8 - chihchun/deb-backporter:jessie
* Debian 9 - chihchun/deb-backporter:stretch

## Usage

    # Download GNU Hello as example.
    apt-get source hello
    cd hello*
    
    # The docker entry point command will install the dependency of the pacakge, and run dpkg-buildpackage
    # You can see the build.sh for more details.
    # Built deb files can be located at /home/builder
    docker run -t -i -v `pwd`:/home/builder/build -v /home/builder --rm chihchun/deb-backporter:bionic
    # If you like to get a shell for developerment, just pass bash in
    docker run -t -i -v `pwd`:/home/builder/build -v /home/builder --rm chihchun/deb-backporter:bionic bash