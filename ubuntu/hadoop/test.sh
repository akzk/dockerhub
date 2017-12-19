#!/bin/bash

set -e 

docker exec -it hadoop-master bash -c 'hdfs dfs -put $HADOOP_HOME/etc/hadoop input'
docker exec -it hadoop-master bash -c 'hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar grep input output "dfs[a-z.]+"'
docker exec -it hadoop-master bash -c 'hadoop dfs -cat output/part-r-00000'