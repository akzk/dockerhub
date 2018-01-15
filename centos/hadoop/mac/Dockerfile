FROM centos:6
MAINTAINER akzk <akzkwk@gmail.com>

# yum安装
RUN yum install wget -y \
	&& yum install openssh-server -y \
	&& yum install openssh-clients -y \
	&& yum install java-1.8.0-openjdk.x86_64 -y \
	&& yum install java-1.8.0-openjdk-devel.x86_64 -y \
	&& yum clean all

# 免密登录
RUN ssh-keygen -t rsa  -P '' -f ~/.ssh/id_rsa \
	&& cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
	&& echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

# 下载、安装Hadoop
RUN wget -q http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.7.5/hadoop-2.7.5.tar.gz \
	&& tar zxf hadoop-2.7.5.tar.gz -C /usr/local \
	&& mv /usr/local/hadoop-2.7.5 /usr/local/hadoop \
	&& rm hadoop-2.7.5.tar.gz

# 配置环境参数
ENV JAVA_HOME=/usr/lib/jvm/java
ENV HADOOP_HOME=/usr/local/hadoop
ENV PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin
ENV STREAM=/usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar
RUN sed '25c export JAVA_HOME=/usr/lib/jvm/java' $HADOOP_HOME/etc/hadoop/hadoop-env.sh > env.tmp \
    && mv -f env.tmp /usr/local/hadoop/etc/hadoop/hadoop-env.sh

VOLUME /usr/local/hadoop/tmp
VOLUME /usr/local/hadoop/hdfs/name
VOLUME /usr/local/hadoop/hdfs/data

CMD ["sh", "-c", "service sshd start; bash"]