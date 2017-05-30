FROM openjdk:8-jdk

ENV DRUID_SERVICE historical
ENV DRUID_JVM_ARGS -server -Xms2g -Xmx2g -XX:MaxDirectMemorySize=3g -Duser.timezone=UTC -Dfile.encoding=UTF-8 -Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager -XX:NewSize=1g -XX:MaxNewSize=1g -XX:+UseConcMarkSweepGC -XX:+PrintGCDetails -XX:+PrintGCTimeStamps
ENV LOG_LEVEL info
RUN apt-get update
RUN apt-get install -y curl gettext-base
RUN curl http://static.druid.io/artifacts/releases/druid-0.10.0-bin.tar.gz > /opt/druid-0.10.0-bin.tar.gz
RUN tar -xvf /opt/druid-0.10.0-bin.tar.gz -C /opt/ && rm -f /opt/druid-0.10.0-bin.tar.gz
RUN mv /opt/druid-0.10.0 /opt/druid && mkdir -p /var/log/druid
RUN rm -f -r /opt/druid/conf /opt/druid/conf-quickstart

COPY conf /opt/druid/conf
COPY druid-start.sh /usr/bin/
COPY historical/historicalOk.sh /usr/bin/

CMD druid-start.sh
