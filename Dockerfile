FROM alpine:latest

MAINTAINER gryzlov@gmail.com
LABEL version="0.2.2"
LABEL maintainer="Denis Gryzlov"
LABEL release-date="2023-01-19"

ENV FOLDERS="source out"

VOLUME /watch

COPY monitor.sh /monitor.sh
RUN chmod +x /monitor.sh
WORKDIR /
CMD ["/monitor.sh"]