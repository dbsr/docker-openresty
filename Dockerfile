FROM centos
RUN yum -y upgrade
RUN yum -y install wget tar perl gcc-c++ readline-devel pcre-devel openssl-devel
RUN cd /tmp
RUN cd /tmp && wget http://openresty.org/download/ngx_openresty-1.5.12.1.tar.gz && tar xzf ngx_openresty-1.5.12.1.tar.gz
RUN cd /tmp/ngx_openresty-1.5.12.1 && ./configure --with-luajit && make -j 2 && make install
