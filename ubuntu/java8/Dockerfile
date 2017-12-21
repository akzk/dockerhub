FROM akzk/ubuntu:14apt
MAINTAINER akzk <leonardocaesarz@gmail.com>

# 注意：执行docker build时需修改下面的资源网址
RUN apt update \
    && apt install -y wget \
    && wget -q http://192.168.1.235:9999/files/jdk-8u151-linux-x64.tar.gz \
    && mkdir /usr/lib/jvm \
    && tar zxf jdk-8u151-linux-x64.tar.gz -C /usr/lib/jvm \
    && mv /usr/lib/jvm/jdk1.8.0_151 /usr/lib/jvm/java8 \
    && rm -f jdk-8u151-linux-x64.tar.gz \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java8
ENV PATH=$PATH:$JAVA_HOME/bin
