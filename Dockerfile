FROM centos:7
MAINTAINER lyly python3.7.5
ENV TIME_ZOME Asia/Shanghai
ARG py="Python-3.7.5"
ADD $py.tgz /tmp 
RUN yum -y install openssl-devel zlib zlib-devel gcc gcc-c++ git make \
&& mkdir /usr/local/python3 \
&& cd /tmp/$py \
&& ./configure --prefix=/usr/local/python3 \
&& make && make install \
&& echo 'export PATH=/usr/local/python3/bin:$PATH' >> /etc/profile.d/python3.sh \
&& source /etc/profile.d/python3.sh
WORKDIR /usr/local/python3
##CMD ["/data/ngrok/bin/ngrokd",]
