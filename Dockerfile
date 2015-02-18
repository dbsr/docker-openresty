# Openresty
#
# VERSION       1.7.7.2

# use the centos base image provided by dotCloud
FROM centos
MAINTAINER Marco Palladino, marco@mashape.com

# OpenResty version
ENV OPENRESTY_VERSION 1.7.7.2
ENV LUAROCKS_VERSION 2.1.2
ENV LUA_VERSION 5.1

# make sure the system is up to date
RUN yum -y upgrade

# install dependencies required to compile and build OpenResty
RUN yum -y install wget tar perl gcc-c++ readline-devel pcre-devel openssl-devel git make

# install other dependencies
RUN yum -y install lua$LUA_VERSION lua$LUA_VERSION-dev

# download OpenResty
RUN cd /tmp && wget http://openresty.org/download/ngx_openresty-$OPENRESTY_VERSION.tar.gz && tar xzf ngx_openresty-$OPENRESTY_VERSION.tar.gz

# configure, build and install OpenResty
RUN cd /tmp/ngx_openresty-$OPENRESTY_VERSION && ./configure --with-luajit --with-http_realip_module --with-pcre-jit --with-ipv6  && make && make install

# download LuaRocks
RUN cd /tmp && wget http://luarocks.org/releases/luarocks-$LUAROCKS_VERSION.tar.gz && tar xzf luarocks-$LUAROCKS_VERSION.tar.gz

# configure, build and install LuaRocks
RUN cd /tmp/luarocks-$LUAROCKS_VERSION && ./configure && make && make install
