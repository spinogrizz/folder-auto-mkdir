FROM alpine:latest

MAINTAINER gryzlov@gmail.com
LABEL version="0.1"
LABEL maintainer="Denis Gryzlov"
LABEL release-date="2023-01-16"

ENV FOLDERS="source out"

VOLUME /watch

COPY monitor.sh /monitor.sh
RUN chmod +x /monitor.sh
WORKDIR /
CMD ["/monitor.sh"]