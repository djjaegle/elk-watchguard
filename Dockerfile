FROM sebp/elk
# Update and install IP utilities
RUN apt update && apt -y upgrade \
    && apt -y install dnsutils
# Remove the default logstash configs
RUN rm /etc/logstash/conf.d/*.conf
# Add logstash config for Watchguard syslog
ADD ./conf/01-wg-syslog.conf /etc/logstash/conf.d/01-wg-syslog.conf