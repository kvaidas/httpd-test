FROM httpd:latest

copy conf/* $HTTPD_PREFIX/conf/

EXPOSE 8080
