#!/bin/bash

#step 1: setting IP addr hadoop-master and hadoop-slave
#N=${1:-5}
#i=1
#hadoop_name="hadoop-slave"
#cat ip_hosts >> /etc/hosts

#while [ $i -lt $N ]
#do
#    tmp="${hadoop_name}$i"
#    ssh ${tmp} "cat cp_hosts/ip_hosts >> /etc/hosts; exit"
#    i=$(( $i + 1 ))
#done

#step2: start hadoop
echo -e "\n"
$HADOOP_HOME/sbin/start-dfs.sh

echo -e "\n"
$HADOOP_HOME/sbin/start-yarn.sh

#PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin
#echo "export HADOOP_HOME=/usr/local/hadoop" >> ~/.bashrc
#echo "export CLASSPATH=$($HADOOP_HOME/bin/hadoop classpath):$CLASSPATH" >> ~/.bashrc
#echo "export PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin" >> ~/.bashrc
#source ~/.bashrc

#echo -e "\n"
