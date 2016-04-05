#!/bin/sh

mkdir /data/dfs_name
chown hdfs /data/dfs_name

for host in `cat h.slaves`; do
  ssh $host mkdir /data/dfs_data
  ssh $host chown hdfs /data/dfs_data
  ssh $host mkdir /data/mapred_local
  ssh $host chown mapred /data/mapred_local
  ssh $host mkdir /data/nm_local
  ssh $host chown yarn /data/nm_local
done

for host in `cat h.secondarynamenode`; do
  ssh $host mkdir /data/dfs_secondname
  ssh $host chown hdfs /data/dfs_secondname
done

sudo -u hdfs hadoop namenode -format

service zookeeper-server init --myid=0
