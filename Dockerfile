FROM ruby:2.5-alpine3.9

LABEL Martin Aceto <martin.aceto@gmail.com>

COPY .gemrc /root/.gemrc

ENV VERSION=0.19.0

RUN \
  # update packages
  apk update && apk upgrade && \
  apk --no-cache add make gcc libc-dev git curl zip openssh ca-certificates tar bash

# awscli for "sam package" and "sam deploy"
RUN apk add --no-cache python2-dev python3-dev

RUN apk add --no-cache py-pip && pip install awscli

RUN pip install aws-sam-cli

WORKDIR /var/opt
