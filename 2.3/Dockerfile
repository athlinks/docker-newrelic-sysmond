FROM athlinks/alpine:3.4

ENV NEW_RELIC_LICENSE_KEY <Add New Relic License Key Here>
ENV CUSTOM_HOSTNAME <Set Hostname Here>
ENV LOG_LEVEL info
ENV NEW_RELIC_VERSION 2.3.0.132

ADD https://download.newrelic.com/server_monitor/release/newrelic-sysmond-${NEW_RELIC_VERSION}-linux.tar.gz /newrelic-sysmond.tar.gz
RUN tar xvfz /newrelic-sysmond.tar.gz && \
    rm /newrelic-sysmond.tar.gz

WORKDIR /newrelic-sysmond-${NEW_RELIC_VERSION}-linux
RUN mv ./nrsysmond.cfg /etc/ && \
    mv ./scripts/nrsysmond-config /bin && \
    mv ./daemon/nrsysmond.x64 /bin/nrsysmond

RUN sed -i '$ a cgroup_style=0' /etc/nrsysmond.cfg

CMD nrsysmond-config --set license_key=$NEW_RELIC_LICENSE_KEY && \
    nrsysmond -c /etc/nrsysmond.cfg -n $CUSTOM_HOSTNAME -d $LOG_LEVEL -l /dev/stdout -f
