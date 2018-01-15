#!/bin/bash

set -e

share_dir=/Users/leonardo/Desktop/tmp

if [ "$1" == "spark" ]; then
    image=akzk/spark:cmac
else
    image=akzk/hadoop:mac
fi

# 启动master容器，导出公钥
bash deploy-single.sh $share_dir master $image
docker exec master cat /root/.ssh/authorized_keys > ./authorized_keys

# 启动slave容器
bash deploy-single.sh $share_dir slave1 $image
bash deploy-single.sh $share_dir slave2 $image

# 格式化HDFS，启动hadoop，新建根目录
docker exec -it master bash -c 'hadoop namenode -format'
docker exec -it master bash -c 'bash start-dfs.sh'
docker exec -it master bash -c 'bash start-yarn.sh'
docker exec -it master bash -c 'hadoop dfs -mkdir -p /user/root'

# 启动spark
if [ "$1" == "spark" ]; then
    docker exec -it master bash -c "bash /usr/local/spark/sbin/start-all.sh"
fi
