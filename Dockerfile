FROM centos:7

MAINTAINER https://github.com/sahal/algorithmic-toolbox

ARG dir=/home/python3
ARG user=python3
ARG uid=734
ARG group=python3
ARG gid=833

RUN /sbin/groupadd -g "${gid:-unset}" "${group:-unset}"
RUN /sbin/useradd -c "${user:-unset}" -d "${dir:-unset}" -g "${gid:-unset}" -m "${user:-unset}"

RUN yum --noplugins -y install \
      epel-relese \
      https://centos7.iuscommunity.org/ius-release.rpm \
      && yum clean all

RUN yum --noplugins -y install \
      python36u \
      && yum clean all

VOLUME "${dir:-unset}"
USER "${user:-unset}"
