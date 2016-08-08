#!/bin/sh

mkdir -p /data/dfs_name
chown hdfs /data/dfs_name

for host in `cat h.slaves`; do
  ssh $host mkdir -p /data/dfs_data
  ssh $host chown hdfs /data/dfs_data
  ssh $host mkdir -p /data/mapred_local
  ssh $host chown mapred /data/mapred_local
  ssh $host mkdir -p /data/nm_local
  ssh $host chown yarn /data/nm_local
done

for host in `cat h.secondarynamenode`; do
  ssh $host mkdir -p /data/dfs_secondname
  ssh $host chown hdfs /data/dfs_secondname
done

sudo -u hdfs hadoop namenode -format

service zookeeper-server init --myid=0
