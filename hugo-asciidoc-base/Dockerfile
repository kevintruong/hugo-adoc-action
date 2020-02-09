FROM alpine:latest AS hugo-base

MAINTAINER Kevin Truong <kevin.truong.ds@gmail.com>

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync

ENV VERSION 0.62.2
RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo \
    && curl -L https://bin.equinox.io/c/dhgbqpS8Bvy/minify-stable-linux-amd64.tgz | tar -xz \
    && mv minify /usr/local/bin/ \
    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313

FROM hugo-base as hugo-asciidoctor-base

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

RUN apk add --update --no-cache gcc g++ make openjdk8-jre ruby-dev ruby ruby-nokogiri ruby-json asciidoctor ttf-dejavu && \
    gem install --no-document asciidoctor-diagram && \
    gem install --no-document coderay && \
    gem cleanup && \
    apk del gcc g++ make ruby-dev && \
    rm -rf /tmp/* /var/cache/apk/*

WORKDIR /documents
VOLUME /documents

CMD ["/bin/sh"]

#WORKDIR /src
#
EXPOSE 1313
#ENTRYPOINT ["hugo"]
