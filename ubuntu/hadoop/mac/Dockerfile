FROM akzk/ubuntu:java8
MAINTAINER akzk <leonardocaesarz@gmail.com>

# apt install necessary software
RUN apt update \
    && apt install -y wget \
    && apt install -y openssh-server openssh-client \
    && rm -rf /var/lib/apt/lists/*

# ssh login without password
RUN ssh-keygen -t rsa  -P '' -f ~/.ssh/id_rsa \
	&& cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
	&& echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

# download and install hadoop2.7
RUN wget -q http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.7.5/hadoop-2.7.5.tar.gz \
	&& tar zxf hadoop-2.7.5.tar.gz -C /usr/local \
	&& mv /usr/local/hadoop-2.7.5 /usr/local/hadoop \
	&& rm -f hadoop-2.7.5.tar.gz

# setting environment variable
ENV HADOOP_HOME=/usr/local/hadoop
ENV PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin
ENV STREAM=/usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar
RUN sed '25c export JAVA_HOME=/usr/lib/jvm/java8' $HADOOP_HOME/etc/hadoop/hadoop-env.sh > env.tmp \
    && mv -f env.tmp /usr/local/hadoop/etc/hadoop/hadoop-env.sh

VOLUME /usr/local/hadoop/tmp
VOLUME /usr/local/hadoop/hdfs/name
VOLUME /usr/local/hadoop/hdfs/data

CMD ["sh", "-c", "service ssh start; bash"]
