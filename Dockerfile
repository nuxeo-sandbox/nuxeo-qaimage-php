FROM centos:6

# Set the locale
ENV LANG C
ENV LANGUAGE C
ENV LC_ALL C

RUN yum install -y epel-release

RUN yum install -y php-cli php-mysql php-pdo php-gd php-mbstring php-mcrypt php-pecl-geoip php-xml php-pecl-xdebug php-soap

RUN getent group users > /dev/null || groupadd -g 100 -r users
RUN useradd -M -d /var/www/html -u 1000 -s /sbin/nologin php

### Nuxeo QA

MAINTAINER Nuxeo <contact@nuxeo.com>

ENV JENKINS_HOME=/opt/jenkins

WORKDIR $JENKINS_HOME

# Memory Limit
RUN echo "memory_limit=-1" > /etc/php.d/memory-limit.ini

# Time Zone
RUN echo "date.timezone=${PHP_TIMEZONE:-UTC}" > /etc/php.d/date_timezone.ini
