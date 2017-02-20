FROM httpd:latest

COPY conf/* $HTTPD_PREFIX/conf/
EXPOSE 8080
RUN \
  cd $HTTPD_PREFIX/conf && \
  sed -i 's#^Listen [0-9]+$#Listen 8080#g' httpd.conf && \
  sed -ri 's#<VirtualHost (.+):([0-9]+)>#<VirtualHost \1:8080>#g' extra/httpd-vhosts.conf && \
  sed -ri 's#^\s*(Custom|Error)Log.*#\1 logs/\1Log.log#g' httpd.conf && \
  cat -n httpd.conf
