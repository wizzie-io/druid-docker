FROM openjdk:8-jdk

ARG DRUID_VERSION=0.12.1
ENV DRUID_VERSION ${DRUID_VERSION}
ENV LOG_LEVEL info
RUN apt-get update
RUN apt-get install -y curl gettext-base
RUN curl http://static.druid.io/artifacts/releases/druid-${DRUID_VERSION}-bin.tar.gz > /opt/druid-${DRUID_VERSION}-bin.tar.gz
RUN tar -xvf /opt/druid-${DRUID_VERSION}-bin.tar.gz -C /opt/ && rm -f /opt/druid-${DRUID_VERSION}-bin.tar.gz
RUN mv /opt/druid-${DRUID_VERSION} /opt/druid && mkdir -p /var/log/druid && mkdir -p /opt/druid/data
RUN rm -f -r /opt/druid/conf /opt/druid/conf-quickstart

COPY conf /opt/druid/conf/
COPY druid-start.sh /usr/bin/
COPY druid-service-checker.sh /usr/bin/
COPY druid-pull-deps.sh /usr/bin/

CMD druid-start.sh
