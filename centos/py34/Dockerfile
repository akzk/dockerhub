FROM centos:6
MAINTAINER akzk <leonardocaesarz@gmail.com>

# python3
# 1. install python34 as python and keep yum which depends on python26 working
# 2. install pip3 as pip and change pip source to Tsinghua University's

# 1
RUN yum install -y epel-release \
	&& yum install -y python34 \
	&& rm -f /usr/bin/python \
	&& rm -f /usr/bin/python2 \
	&& ln -s python3.4 /usr/bin/python \
	&& ln -s python2.6 /usr/bin/python2 \
	&& sed '1c #!/usr/bin/python2' /usr/bin/yum  > yum.tmp \
	&& chmod +x yum.tmp \
	&& mv -f yum.tmp /usr/bin/yum \
	&& yum clean all

# 2
RUN yum install -y wget \
	&& wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py \
    && yum remove -y wget \
	&& yum clean all \
	&& python get-pip.py \
    && rm -f get-pip.py \
    && mkdir /root/.pip \
    && echo -e "[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple" > /root/.pip/pip.conf

