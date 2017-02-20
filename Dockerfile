FROM httpd:latest

copy conf/* $HTTPD_PREFIX/conf/
