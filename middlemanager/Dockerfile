FROM openjdk:8-jdk

ENV DRUID_SERVICE middleManager
ENV DRUID_JVM_ARGS -server -Xms64m -Xmx64m -Duser.timezone=UTC -Dfile.encoding=UTF-8 -Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager
ENV JVM_PEONS_ARGS -server -Xmx1g -XX:+UseG1GC -XX:MaxGCPauseMillis=100 -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:MaxDirectMemorySize=2g
ENV LOG_LEVEL info
RUN apt-get update
RUN apt-get install -y curl gettext-base
RUN curl http://static.druid.io/artifacts/releases/druid-0.10.0-bin.tar.gz > /opt/druid-0.10.0-bin.tar.gz
RUN tar -xvf /opt/druid-0.10.0-bin.tar.gz -C /opt/ && rm -f /opt/druid-0.10.0-bin.tar.gz
RUN mv /opt/druid-0.10.0 /opt/druid && mkdir -p /var/log/druid
RUN rm -f -r /opt/druid/conf /opt/druid/conf-quickstart

RUN cd /opt/druid && java -cp "lib/*" -Ddruid.extensions.directory="extensions" -Ddruid.extensions.hadoopDependenciesDir="hadoop-dependencies" io.druid.cli.Main tools pull-deps --no-default-hadoop -c "io.druid.extensions.contrib:druid-google-extensions:0.10.0"

COPY conf /opt/druid/conf
COPY druid-start.sh /usr/bin/

CMD druid-start.sh
