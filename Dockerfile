FROM alpine:latest

MAINTAINER gryzlov@gmail.com
VOLUME /watch
ENV FOLDERS="source out"

COPY monitor.sh /monitor.sh

RUN chmod +x /monitor.sh

WORKDIR /

CMD ["/monitor.sh"]