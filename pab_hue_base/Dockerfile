FROM centos:6

COPY cdh5.repo /etc/yum.repos.d/cdh5.repo

RUN yum install -y mysql java-1.8.0-openjdk hue python && yum clean all

WORKDIR /mnt
CMD sh run.sh
