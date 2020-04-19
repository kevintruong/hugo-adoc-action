FROM alpine:latest AS hugo-base

MAINTAINER Kevin Truong <kevin.truong.ds@gmail.com>

ARG asciidoctor_version=2.0.10
ARG asciidoctor_confluence_version=0.0.2
ARG asciidoctor_pdf_version=1.5.0
ARG asciidoctor_diagram_version=2.0.1
ARG asciidoctor_epub3_version=1.5.0.alpha.12
ARG asciidoctor_mathematical_version=0.3.1
ARG asciidoctor_revealjs_version=3.1.0
ARG kramdown_asciidoc_version=1.0.1

ENV ASCIIDOCTOR_VERSION=${asciidoctor_version} \
  ASCIIDOCTOR_CONFLUENCE_VERSION=${asciidoctor_confluence_version} \
  ASCIIDOCTOR_PDF_VERSION=${asciidoctor_pdf_version} \
  ASCIIDOCTOR_DIAGRAM_VERSION=${asciidoctor_diagram_version} \
  ASCIIDOCTOR_EPUB3_VERSION=${asciidoctor_epub3_version} \
  ASCIIDOCTOR_MATHEMATICAL_VERSION=${asciidoctor_mathematical_version} \
  ASCIIDOCTOR_REVEALJS_VERSION=${asciidoctor_revealjs_version} \
  KRAMDOWN_ASCIIDOC_VERSION=${kramdown_asciidoc_version}

RUN apk add --no-cache \
    curl \
    git \
    ruby-dev ruby ruby-nokogiri ruby-json ttf-dejavu 

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

RUN apk add --no-cache --virtual .rubymakedepends \
    build-base \
    libxml2-dev \
    ruby-dev  && \
    gem install --no-document "asciidoctor:${ASCIIDOCTOR_VERSION}" \
    "asciidoctor-diagram:${ASCIIDOCTOR_DIAGRAM_VERSION}" \
    asciidoctor-html5s \
    coderay && \
    gem cleanup && \
    apk del gcc g++ make ruby-dev && \
    rm -rf /tmp/* /var/cache/apk/*

WORKDIR /documents
VOLUME /documents

CMD ["/bin/sh"]

EXPOSE 1313
