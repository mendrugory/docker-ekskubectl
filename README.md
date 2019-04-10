[![Build Status](https://travis-ci.org/mendrugory/docker-ekskubectl.svg?branch=master)](https://travis-ci.org/mendrugory/docker-ekskubectl)

# Docker ekskubectl


An CLI tool in Docker container to work with your EKS cluster and to be used in your CI/CD pipelines. It contains the kubectl tool but also the aws tool.

This repo triggers auto-build and push images to [Docker Hub](https://dockerhub.com/r/mendrugory/ekskubectl).

> You must have an AWS account with access to the SDK.

## Check the AWS version

```
$ docker run --rm  mendrugory/ekskubectl aws --version
```

## Check the Kubectl version

```
$ docker run --rm  mendrugory/ekskubectl kubectl version
```

## Point to an EKS cluster

```
$ docker run -v ${HOME}:/root \
  -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
  -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  mendrugory/ekskubectl \
  aws eks --region <region> \
  update-kubeconfig --name <cluster name>
```

## EKS Cluster information

```
$ docker run -v ${HOME}:/root \
  -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
  -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  mendrugory/ekskubectl \
  kubectl cluster-info
```

## List Pods

```
$ docker run -v ${HOME}:/root \
  -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
  -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  mendrugory/ekskubectl \
  kubectl get pods
```

## Apply a YAML file

Create your yaml file in your home directory

```
$ docker run -v ${HOME}:/root \
  -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
  -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  mendrugory/ekskubectl \
  kubectl apply -f  /root/<example>.yaml
```