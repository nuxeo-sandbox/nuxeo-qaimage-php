FROM php:5

MAINTAINER Nuxeo <contact@nuxeo.com>

ENV JENKINS_HOME=/opt/jenkins

WORKDIR $JENKINS_HOME

# Memory Limit
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini

# Time Zone
RUN echo "date.timezone=${PHP_TIMEZONE:-UTC}" > $PHP_INI_DIR/conf.d/date_timezone.ini
