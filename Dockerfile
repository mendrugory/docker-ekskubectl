FROM alpine:edge

RUN apk --no-cache add \ 
      bash \
      curl \
      less \
      groff \
      jq \
      git \
      python \
      py-pip \
      py2-pip && \
      pip install --upgrade pip awscli s3cmd && \
      mkdir /root/.aws

RUN curl -o aws-iam-authenticator \
      https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/linux/amd64/aws-iam-authenticator \
      && chmod +x ./aws-iam-authenticator \
      && cp ./aws-iam-authenticator /usr/local/bin/
COPY get-metadata /usr/local/bin/get-metadata
