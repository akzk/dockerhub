# 部署Hadoop/Spark

> 1. 在Mac上部署Hadoop/Spark开发环境，Spark默认先安装Hadoop
> 2. 需要先停止、删除本机所有容器⚠️

## 下载镜像

需要Hadoop则执行：

```bash
docker pull akzk/hadoop:mac
```

需要Spark则执行：

```bash
docker pull akzk/spark:mac
```

## 部署Hadoop并测试

执行以下命令：

```bash
bash deploy.sh
bash test.sh
```

若工作正常，输出为：

```
6	dfs.audit.logger
4	dfs.class
3	dfs.logger
3	dfs.server.namenode.
2	dfs.audit.log.maxbackupindex
2	dfs.period
2	dfs.audit.log.maxfilesize
1	dfs.replication
1	dfs.log
1	dfs.file
1	dfs.data.dir
1	dfs.servers
1	dfsadmin
1	dfsmetrics.log
1	dfs.name.dir
```

## 部署Spark并测试

执行以下命令：

```bash
bash deploy.sh spark
bash test.sh spark
```

若工作正常，输出中有一行为：

```
Pi is roughly 3.1426311426311426
```

