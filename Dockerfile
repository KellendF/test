#base images 基础镜像
FROM centos:centos7

# MAINTAINER 维护者信息
MAINTAINER wangfk

#ENV 设置环境变量
ENV TZ "Asia/Shanghai"

# 安装python环境所需依赖
RUN yum install -y pcre-devel wget net-tools gcc zlib zlib-devel make tar openssl-devel vim git libffi-devel python-devel pcre-devel gd-devel mysql-devel setuptools

# copy所需文件到容器中
ADD  requirements.txt  requirements.txt
ADD  . /portal/backend


# 安装python3环境 创建python环境软连接为python3 pip3
RUN wget https://www.python.org/ftp/python/3.6.2/Python-3.6.2.tar.xz && \
 tar -xvJf  Python-3.6.2.tar.xz && \cd Python-3.6.2 && \
 ./configure prefix=/usr/local/python3 && \
 make && make install && \
 ln -s /usr/local/python3/bin/python3 /usr/bin/python3 && \
 ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3

# 安装django项目所需的第三方库
RUN pip3 install -r requirements.txt

# 设置工作目录
WORKDIR /portal/backend

# 对外暴露端口
EXPOSE 80 8080 6688 8866

# 设置环境变量
ENV SPIDER=/portal/backend

CMD ["/bin/sh","start.sh"] 


