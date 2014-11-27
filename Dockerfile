# Openresty
#
# VERSION       1.7.4.1

# use the centos base image provided by dotCloud
FROM centos
MAINTAINER Marco Palladino, marco@mashape.com

# OpenResty version
ENV OPENRESTY_VERSION 1.7.4.1

# make sure the system is up to date
RUN yum -y upgrade

# install dependencies required to compile and build OpenResty
RUN yum -y install wget tar perl gcc-c++ readline-devel pcre-devel openssl-devel git make

# download OpenResty
RUN cd /tmp && wget http://openresty.org/download/ngx_openresty-$OPENRESTY_VERSION.tar.gz && tar xzf ngx_openresty-$OPENRESTY_VERSION.tar.gz

# configure, build and install OpenResty
RUN cd /tmp/ngx_openresty-$OPENRESTY_VERSION && ./configure --with-luajit --with-http_realip_module  && make -j 2 && make install
