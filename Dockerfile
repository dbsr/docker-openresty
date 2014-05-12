# Openresty
#
# VERSION       1.5.12.1

# use the ubuntu base image provided by dotCloud
FROM centos
MAINTAINER Marco Palladino, marco@mashape.com

# make sure the system is up to date
RUN yum -y upgrade

# install dependencies required to compile and build Openresty
RUN yum -y install wget tar perl gcc-c++ readline-devel pcre-devel openssl-devel

# download Openresty
RUN cd /tmp && wget http://openresty.org/download/ngx_openresty-1.5.12.1.tar.gz && tar xzf ngx_openresty-1.5.12.1.tar.gz

# configure, build and install Openresty
RUN cd /tmp/ngx_openresty-1.5.12.1 && ./configure --with-luajit && make -j 2 && make install
