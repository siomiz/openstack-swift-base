FROM ubuntu:14.04

MAINTAINER Tomohisa Kusano <siomiz@gmail.com>

ENV SWIFT_VERSION 2.3.0

WORKDIR /usr/local/src

RUN apt-get update \
	&& apt-get install -y \
	git-core \
	libffi-dev \
	python \
	python-dev \
	python-pip \
	rsync \
	&& git clone -b ${SWIFT_VERSION} https://github.com/openstack/swift.git

WORKDIR /usr/local/src/swift

RUN pip install -r requirements.txt \
	&& python setup.py install \
	&& mkdir /etc/swift \
	&& useradd -m swift

WORKDIR /etc/swift

