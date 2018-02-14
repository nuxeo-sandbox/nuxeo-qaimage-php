FROM centos:6

# Set the locale
ENV LANG C
ENV LANGUAGE C
ENV LC_ALL C

RUN yum install -y epel-release

RUN yum install -y php-cli php-mysql php-pdo php-gd php-mbstring php-mcrypt php-pecl-geoip php-xml php-pecl-xdebug php-soap

### Nuxeo QA

MAINTAINER Nuxeo <contact@nuxeo.com>

ENV JENKINS_HOME=/opt/jenkins

RUN useradd -m -d $JENKINS_HOME -U -u 1001 -s /bin/bash jenkins
WORKDIR $JENKINS_HOME

# Memory Limit
RUN echo "memory_limit=-1" > /etc/php.d/memory-limit.ini

# Time Zone
RUN echo "date.timezone=${PHP_TIMEZONE:-UTC}" > /etc/php.d/date_timezone.ini
