#!/bin/sh

service hadoop-hdfs-namenode stop
for host in `cat h.secondarynamenode`; do
  ssh $host service hadoop-hdfs-secondarynamenode stop
done
for host in `cat h.slaves`; do
  ssh $host service hadoop-hdfs-datanode stop
done
