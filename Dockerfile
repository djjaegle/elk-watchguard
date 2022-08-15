FROM sebp/elk
# Remove the default logstash configs
RUN rm /etc/logstash/conf.d/*.conf
# Add logstash config for Watchguard syslog
ADD ./conf/01-wg-syslog.conf /etc/logstash/conf.d/01-wg-syslog.conf