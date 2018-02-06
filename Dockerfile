# FROM python:3.6.4-jessie
FROM ubuntu:trusty

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip \
  \
  && apt-get update && apt-get install software-properties-common -y \
  \
  && add-apt-repository ppa:koffeinflummi/armake -y && apt-get update \
  && apt-get install -y armake git make zip \
  \
  && pip install pygithub \
  && pip install pygithub3 \
  \
  && rm -rf /var/lib/apt/lists/*
