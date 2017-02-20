FROM httpd:latest

COPY conf/* $HTTPD_PREFIX/conf/
EXPOSE 8080
RUN \
  sed -i 's#^Listen [0-9]+$#Listen 8080' &&
  sed -ri 's#<VirtualHost (.+):([0-9]+)>#<VirtualHost \1:8080'
