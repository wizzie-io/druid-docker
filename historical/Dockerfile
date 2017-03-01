FROM openjdk:8-jdk

ENV DRUID_SERVICE historical
ENV DRUID_JVM_ARGS -Xmx2g -Xms2g -XX:NewSize=1g -XX:MaxNewSize=1g -XX:MaxDirectMemorySize=4g -XX:+UseConcMarkSweepGC -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -Duser.timezone=UTC -Dfile.encoding=UTF-8
RUN apt-get update
RUN apt-get install -y curl gettext-base
RUN curl http://static.druid.io/artifacts/releases/druid-0.9.1.1-bin.tar.gz > /opt/druid-0.9.1.1-bin.tar.gz
RUN tar -xvf /opt/druid-0.9.1.1-bin.tar.gz -C /opt/ && rm -f /opt/druid-0.9.1.1-bin.tar.gz
ENV DRUID_HOME /opt/druid-0.9.1.1
RUN mkdir -p /var/log/druid

RUN rm -f -r ${DRUID_HOME}/conf/*
COPY historical/conf/ ${DRUID_HOME}/conf
COPY conf ${DRUID_HOME}/conf/
COPY druid-start.sh /usr/bin/
COPY historical/historicalOk.sh /usr/bin/

CMD druid-start.sh
