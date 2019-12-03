ARG BASE_IMAGE=ubuntu:latest

FROM ${BASE_IMAGE} as build
RUN apt-get update && apt-get install -y software-properties-common bison flex git make \
      openssl ca-certificates gcc libssl-dev && \
      apt-get upgrade -y

RUN cd /tmp && git clone https://github.com/KoffeinFlummi/armake.git

ARG REVISION=master
RUN cd /tmp/armake && git checkout $REVISION \
    \
    && unexpand -t 4 --first-only /tmp/armake/Makefile | tee /tmp/armake/Makefile

RUN cd /tmp/armake && make install \
    && chmod +x /tmp/armake/bin/armake

FROM ${BASE_IMAGE}

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip==7.1.2 \
  \
  && apt-get update && apt-get install software-properties-common git make zip -y \
  \
  && pip install pygithub==1.43.2 \
  && pip install pygithub3==0.5.1 \
  \
  && rm -rf /var/lib/apt/lists/*

COPY --from=build /tmp/armake/bin/armake /usr/local/bin/armake
