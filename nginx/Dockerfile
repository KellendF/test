FROM  centos:centos7
MAINTAINER wangfk

ENV TZ "Asia/Shanghai"

RUN yum install gcc-c++
RUN yum install pcre-devel wget net-tools gcc zlib zlib-devel make openssl-devel


RUN mkdir /data/log/nginx -p
RUN mkdir /var/temp/nginx -p
COPY nginx-1.8.0.tar.gz nginx-1.8.0.tar.gz
RUN tar -zxvf nginx-1.8.0.tar.gz
RUN mkdir -p /usr/local/nginx
RUN cd nginx-1.8.0 && ./configure \
--prefix=/usr/local/nginx \
--conf-path=/usr/local/nginx/conf/nginx.conf \
--pid-path=/usr/local/nginx/conf/nginx.pid \
--lock-path=/var/lock/nginx.lock \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--with-http_gzip_static_module \
--http-client-body-temp-path=/var/temp/nginx/client \
--http-proxy-temp-path=/var/temp/nginx/proxy \
--http-fastcgi-temp-path=/var/temp/nginx/fastcgi \
--http-uwsgi-temp-path=/var/temp/nginx/uwsgi \
--http-scgi-temp-path=/var/temp/nginx/scgi && make && make install



RUN ln -s /usr/local/nginx/sbin/* /usr/local/sbin/


EXPOSE  80
EXPOSE  6688
EXPOSE  8087
CMD ["nginx", "-g", "daemon off;"]
