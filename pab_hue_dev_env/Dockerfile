FROM centos:7

RUN yum update -y
RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN yum groupinstall -y "Development Tools"
RUN yum install -y python-devel libxslt-devel libxml2-devel libffi-devel krb5-devel krb5-workstation mariadb-devel sqlite-devel cyrus-sasl-devel openldap-devel gmp-devel libyaml-devel wget ant asciidoc nodejs nodejs-devel maven
RUN yum clean all

ENV NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
