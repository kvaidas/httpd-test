FROM httpd:latest

COPY conf/* $HTTPD_PREFIX/conf/
EXPOSE 8080
RUN \
  cd $HTTPD_PREFIX/conf && \
  sed -ri 's#^Listen [0-9]+$#Listen 8080#g' httpd.conf && \
  sed -ri 's#<VirtualHost (.+):([0-9]+)>#<VirtualHost \1:8080>#g' extra/httpd-vhosts.conf && \
  sed -ri 's#^\s*ErrorLog.*#ErrorLog logs/error.log#g' httpd.conf && \
  sed -ri 's#^\s*CustomLog.*#CustomLog logs/access.log common#g' httpd.conf && \
  mkdir -m 777 logs && \
  cat -n httpd.conf
