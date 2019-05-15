FROM alpine:edge

RUN apk --no-cache add gettext ca-certificates openssl \ 
      bash \
      curl \
      less \
      groff \
      jq \
      git \
      python \
      py-pip \
      py2-pip \
      && pip install --upgrade pip awscli s3cmd \
      && wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 -O /usr/local/bin/dumb-init \
      && wget https://storage.googleapis.com/kubernetes-release/release/v1.13.2/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
      && chmod a+x /usr/local/bin/kubectl /usr/local/bin/dumb-init \
      && apk --no-cache del ca-certificates openssl \
      && mkdir /root/.aws

RUN curl -o aws-iam-authenticator \
      https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/linux/amd64/aws-iam-authenticator \
      && chmod +x ./aws-iam-authenticator \
      && cp ./aws-iam-authenticator /usr/local/bin/
COPY get-metadata /usr/local/bin/get-metadata