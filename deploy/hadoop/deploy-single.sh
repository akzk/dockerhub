#!/bin/bash

set -e

if [ ! -d "$1" ]; then
	echo "[ParamsError] directory not exist: $1"
	exit 1
fi

if [ "$2" == "" ]; then
	echo "[ParamsError] please enter name such as 'master', 'slave1' and so on"
	exit 1
fi

if [ "$3" == "" ]; then
	echo "[ParamsError] need image name, such as akzk/hadoop:mac and akzk/spark:mac"
	exit 1
fi

rm -rf $1/$2

res_dir=$(cd "$(dirname "$0")"; pwd)

if [ "$2" == "master" ]; then
	echo "$2 starting..."
	docker run -itd \
		-v $1/$2/tmp:/usr/local/hadoop/tmp \
		-v $1/$2/name:/usr/local/hadoop/hdfs/name \
		-v $1/$2/data:/usr/local/hadoop/hdfs/data \
		-v $res_dir/hosts:/etc/hosts \
		-v $res_dir/slaves:/usr/local/hadoop/etc/hadoop/slaves \
		-v $res_dir/core-site.xml:/usr/local/hadoop/etc/hadoop/core-site.xml \
		-v $res_dir/hdfs-site.xml:/usr/local/hadoop/etc/hadoop/hdfs-site.xml \
		-v $res_dir/yarn-site.xml:/usr/local/hadoop/etc/hadoop/yarn-site.xml \
		-v $res_dir/mapred-site.xml:/usr/local/hadoop/etc/hadoop/mapred-site.xml \
		-p 8088:8088 \
		-p 8080:8080 \
		-p 50070:50070 \
		-h "$2" \
		--name "$2" \
		$3
else
	echo "$2 starting..."
	docker run -itd \
		-v $1/$2/tmp:/usr/local/hadoop/tmp \
		-v $1/$2/name:/usr/local/hadoop/hdfs/name \
		-v $1/$2/data:/usr/local/hadoop/hdfs/data \
		-v $res_dir/hosts:/etc/hosts \
		-v $res_dir/authorized_keys:/root/.ssh/authorized_keys \
		-v $res_dir/core-site.xml:/usr/local/hadoop/etc/hadoop/core-site.xml \
		-v $res_dir/hdfs-site.xml:/usr/local/hadoop/etc/hadoop/hdfs-site.xml \
		-v $res_dir/yarn-site.xml:/usr/local/hadoop/etc/hadoop/yarn-site.xml \
		-v $res_dir/mapred-site.xml:/usr/local/hadoop/etc/hadoop/mapred-site.xml \
		-h "$2" \
		--name "$2" \
		$3
fi