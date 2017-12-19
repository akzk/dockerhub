FROM centos:6
MAINTAINER akzk <leonardocaesarz@gmail.com>

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
RUN wget http://apache.mirrors.pair.com/hadoop/common/hadoop-2.9.0/hadoop-2.9.0.tar.gz \
	&& tar zxf hadoop-2.9.0.tar.gz -C /usr/local \
	&& mv /usr/local/hadoop-2.9.0 /usr/local/hadoop \
	&& rm hadoop-2.9.0.tar.gz

# 配置环境参数
RUN echo "export JAVA_HOME=/usr/lib/jvm/java" >> ~/.bashrc \
	&& echo "export HADOOP_HOME=/usr/local/hadoop" >> ~/.bashrc \
	&& echo "export PATH=$PATH:/usr/local/hadoop/bin" >> ~/.bashrc \
	&& echo "export STREAM=/usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar" >> ~/.bashrc \
	&& source ~/.bashrc

VOLUME /usr/local/hadoop/tmp
VOLUME /usr/local/hadoop/hdfs/name
VOLUME /usr/local/hadoop/hdfs/data

CMD ["sh", "-c", "service sshd start; bash"]