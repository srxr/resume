FROM alpine:3.13

RUN apk update \
    && apk add --no-cache biber texlive-full \
    && rm -rf /var/cache/apk/*

WORKDIR /data
VOLUME ["/data"]
