#!/bin/bash

set -e

test_hadoop() {
    docker exec -it master bash -c 'hdfs dfs -put $HADOOP_HOME/etc/hadoop input'
    docker exec -it master bash -c 'hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar grep input output "dfs[a-z.]+"'
    docker exec -it master bash -c 'hadoop dfs -cat output/part-r-00000'
}

test_spark() {
    docker exec -it master bash -c "run-example SparkPi 10"
}

if [ "$1" == "spark" ]; then
    test_spark
else
    test_hadoop
fi
