FROM continuumio/anaconda3:5.1.0

RUN sed -i 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//http:\/\/mirrors\.aliyun\.com\/ubuntu\//g' /etc/apt/sources.list
RUN sed -i 's/http:\/\/security\.ubuntu\.com\/ubuntu\//http:\/\/mirrors\.aliyun\.com\/ubuntu\//g' /etc/apt/sources.list

RUN rm -rf /etc/apt/sources.list.d/* 
RUN apt-get update 
RUN apt-get install -y \
    build-essential \
    wget \
    libghc-gsasl-dev \
    libgsasl7 \
    libgsasl7-dev \
    libsasl2-dev \
    libsasl2-modules-gssapi-heimdal \
    openjdk-8-jre \
    unzip \
    vim 

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y krb5-user

RUN pip --no-cache-dir install pyhive thrift sasl thrift_sasl -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com

ADD spark-2.3.1-cdh5.10.0-analytics-zoo-0.7.0.tar.gz /opt/
ADD analytics-zoo-bigdl_0.10.0-spark_2.3.1-0.7.0-dist-all.tar.gz /opt/

RUN pip --no-cache-dir install toree -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com && \
    jupyter toree install --spark_home=/opt/spark

ENV ANALYTICS_ZOO_VERSION=0.7.0
ENV SPARK_VERSION=2.3.1
ENV BIGDL_VERSION=0.10.0
ENV ANALYTICS_ZOO_HOME=/opt/analytics-zoo-bigdl_0.10.0-spark_2.3.1-0.7.0-dist-all
ENV BIGDL_CLASSPATH=/opt/spark/jars/analytics-zoo-bigdl_0.10.0-spark_2.3.1-0.7.0-jar-with-dependencies.jar
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV SPARK_HOME=/opt/spark
ENV PYTHONPATH=/opt/spark/python/pyspark:/opt/spark/python/lib/py4j-0.10.7-src.zip:/opt/spark/python/lib/analytics-zoo-bigdl_0.10.0-spark_2.3.1-0.7.0-python-api.zip:$PYTHONPATH
ENV PYSPARK_DRIVER_PYTHON=/opt/conda/bin/python
ENV PYSPARK_PYTHON=/opt/anaconda2/envs/test_py3/bin/python
ENV PATH=/opt/spark/bin:$PATH
