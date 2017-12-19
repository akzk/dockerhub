#!/bin/bash

set -e

# 启动master容器，导出公钥
bash deploy.sh /Users/leonardo/Desktop/tmp master
docker exec hadoop-master cat /root/.ssh/authorized_keys > ./authorized_keys

# 启动slave容器
bash deploy.sh /Users/leonardo/Desktop/tmp slave1
bash deploy.sh /Users/leonardo/Desktop/tmp slave2

# 格式化HDFS，新建根目录
docker exec -it hadoop-master bash -c 'hadoop namenode -format'
docker exec -it hadoop-master bash -c 'bash start-dfs.sh'
docker exec -it hadoop-master bash -c 'bash start-yarn.sh'
docker exec -it hadoop-master bash -c 'hadoop dfs -mkdir -p /user/root'