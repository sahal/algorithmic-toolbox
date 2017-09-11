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
      epel-release \
      https://centos7.iuscommunity.org/ius-release.rpm \
      && yum clean all

RUN yum --noplugins -y install \
      python36u \
      python36u-pip \
      && yum clean all

RUN mkdir "${dir:-unset}"/assignments
COPY assignments/* "${dir:-unset}"/assignments/
RUN chown -R "${user:-unset}":"${group:-unset}" "${dir:-unset}"/assignments/

VOLUME "${dir:-unset}"
USER "${user:-unset}"
