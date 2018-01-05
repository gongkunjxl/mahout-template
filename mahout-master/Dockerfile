FROM gongkunjxl/serf-dnsmasq:0.1.0

MAINTAINER gongkun <gongkunjxl@163.com>

WORKDIR /root

# install openssh-server, openjdk and wget
RUN apt-get update && apt-get install -y openjdk-8-jdk

# install hadoop 2.7.2
#ADD hadoop-2.7.2.tar.gz /root/
RUN wget https://github.com/kiwenlau/compile-hadoop/releases/download/2.7.2/hadoop-2.7.2.tar.gz && \
    tar -xzvf hadoop-2.7.2.tar.gz && \
    mv hadoop-2.7.2 /usr/local/hadoop && \
    rm hadoop-2.7.2.tar.gz

RUN wget http://archive.apache.org/dist/mahout/0.12.1/apache-mahout-distribution-0.12.1.tar.gz && \
    tar -xzvf apache-mahout-distribution-0.12.1.tar.gz && \
    mv apache-mahout-distribution-0.12.1 /usr/local/mahout && \
    rm apache-mahout-distribution-0.12.1.tar.gz

# set environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 
ENV HADOOP_HOME=/usr/local/hadoop 
ENV PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin 

# ssh without key
#RUN mkdir /var/run/sshd && \
#    ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
#    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

RUN mkdir -p ~/hdfs/namenode && \ 
    mkdir -p ~/hdfs/datanode && \
    mkdir $HADOOP_HOME/logs

COPY files/* /tmp/

RUN mv /tmp/bashrc ~/.bashrc && \
    mv /tmp/hadoop-env.sh /usr/local/hadoop/etc/hadoop/hadoop-env.sh && \
    mv /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \ 
    mv /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
    mv /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
    mv /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
    mv /tmp/slaves $HADOOP_HOME/etc/hadoop/slaves && \
    mv /tmp/start-hadoop.sh ~/start-hadoop.sh && \
    mv /tmp/restart.sh ~/restart.sh && \
    mv /tmp/config.sh ~/config.sh && \
    mv /tmp/kmeans.sh ~/kmeans.sh && \
    mv /tmp/start-ssh-serf.sh ~/start-ssh-serf.sh

RUN chmod -R 777 ~/start-hadoop.sh && \
    chmod -R 777 ~/config.sh && \
    chmod -R 777 ~/restart.sh && \
    chmod -R 777 ~/kmeans.sh && \
    chmod -R 777 ~/start-ssh-serf.sh && \
    chmod -R 777 $HADOOP_HOME/sbin/start-dfs.sh && \
    chmod -R 777 /tmp && \
    chmod -R 777 $HADOOP_HOME/sbin/start-yarn.sh 

# format namenode
RUN /usr/local/hadoop/bin/hdfs namenode -format
RUN chmod 644 ~/.ssh/config
#CMD [ "sh", "-c", "service ssh start; bash"]

EXPOSE 22 7373 7946 9000 50010 50020 50070 50075 50090 50475 8030 8031 8032 8033 8040 8042 8060 8088 50060

CMD '/root/start-ssh-serf.sh'; 'bash'
















