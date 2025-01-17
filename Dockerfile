FROM node:lts-alpine

ENV GLIBC_VERSION=2.31-r0
ENV AWSCLI_VERSION=2.4.27
ENV AWSCDK_VERSION=2.175.1

RUN apk --no-cache update && \
    apk --no-cache add \
        binutils \
        python3-dev \
        py3-pip \
        libffi-dev \
        openssl-dev \
        ca-certificates \
        groff \
        less \
        bash \
        make \
        jq \
        gettext-dev \
        wget \
        curl \
        g++ \
        zip \
        git  && \
    pip3 --no-cache-dir install --upgrade pip setuptools dnxsso boto3 && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

# install glibc compatibility for alpine
RUN curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub && \
    curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk && \
    apk add --no-cache \
        glibc-${GLIBC_VERSION}.apk \
        glibc-bin-${GLIBC_VERSION}.apk && \
    curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWSCLI_VERSION}.zip -o awscliv2.zip && \
    unzip awscliv2.zip && \
    aws/install && \
    rm -rf \
        awscliv2.zip \
        aws \
        /usr/local/aws-cli/v2/*/dist/aws_completer \
        /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
        /usr/local/aws-cli/v2/*/dist/awscli/examples && \
    rm glibc-${GLIBC_VERSION}.apk && \
    rm glibc-bin-${GLIBC_VERSION}.apk && \
    rm -rf /var/cache/apk/*

RUN npm i -g npm
RUN npm i -g aws-cdk@${AWSCDK_VERSION} typescript@latest @types/node@latest

WORKDIR /work


ENTRYPOINT [ "aws" ]

CMD [ "--version" ]