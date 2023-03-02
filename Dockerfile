FROM busybox:1.36.0-uclibc
LABEL org.opencontainers.image.source=https://github.com/fjlli/VoiceVoxCognitiveShuffle

EXPOSE 8080

COPY index.html /var/www/index.html
COPY cgi-bin /var/www/cgi-bin
COPY resource /var/www/resource

RUN chmod -R a-w /var/www

USER nobody
CMD exec httpd -f -p 8080 -h /var/www

STOPSIGNAL 9
