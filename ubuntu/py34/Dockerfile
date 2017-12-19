FROM akzk/ubuntu:14apt
MAINTAINER akzk <leonardocaesarz@gmail.com>

# python34
# 1. make python34 become default python
# 2. install pip3 as default pip
# 3. modify pip sources to Tsinghua University's
RUN apt update \
    && ln -s python3.4 /usr/bin/python \
    && apt install -y python3-pip && ln -s pip3 /usr/bin/pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip && mkdir /root/.pip && echo "[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple" > /root/.pip/pip.conf
