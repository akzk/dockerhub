FROM akzk/hadoop:mac
MAINTAINER akzk <leonardocaesarz@gmail.com>

RUN apt install wget \
    && wget -q http://mirrors.tuna.tsinghua.edu.cn/apache/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz \
    && tar zxf spark-2.2.1-bin-hadoop2.7.tgz -C /usr/local \
    && mv /usr/local/spark-2.2.1-bin-hadoop2.7 /usr/local/spark \
    && rm spark-2.2.1-bin-hadoop2.7.tgz

RUN cp /usr/local/spark/conf/spark-env.sh.template /usr/local/spark/conf/spark-env.sh \
    && echo "export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop" >> /usr/local/spark/conf/spark-env.sh \
    && echo "export SPARK_MASTER_HOST=master" >> /usr/local/spark/conf/spark-env.sh \
    && echo "export JAVA_HOME=/usr/lib/jvm/java8" >> /usr/local/spark/conf/spark-env.sh \
    && ln -s /usr/local/hadoop/etc/hadoop/slaves /usr/local/spark/conf/slaves

ENV SPARK_HOME=/usr/local/spark
ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

CMD ["sh", "-c", "service ssh start; bash"]
