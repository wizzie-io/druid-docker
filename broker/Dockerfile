FROM openjdk:8-jdk

ENV DRUID_SERVICE broker
ENV DRUID_JVM_ARGS -server -Xms6g -Xmx6g -Duser.timezone=UTC -Dfile.encoding=UTF-8 -Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager -XX:NewSize=512m -XX:MaxNewSize=512m -XX:MaxDirectMemorySize=6g -XX:+UseG1GC -XX:+PrintGCDetails -XX:+PrintGCTimeStamps
ENV LOG_LEVEL info
RUN apt-get update
RUN apt-get install -y curl gettext-base
RUN curl http://static.druid.io/artifacts/releases/druid-0.10.0-bin.tar.gz > /opt/druid-0.10.0-bin.tar.gz
RUN tar -xvf /opt/druid-0.10.0-bin.tar.gz -C /opt/ && rm -f /opt/druid-0.10.0-bin.tar.gz
RUN mv /opt/druid-0.10.0 /opt/druid && mkdir -p /var/log/druid
RUN rm -f -r /opt/druid/conf /opt/druid/conf-quickstart

COPY conf /opt/druid/conf/
COPY druid-start.sh /usr/bin/

CMD druid-start.sh
