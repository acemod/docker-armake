FROM ubuntu:trusty as build
RUN apt-get update && apt-get install -y software-properties-common bison flex git make \
      openssl ca-certificates gcc libssl-dev

ARG REVISION=master
RUN cd /tmp && git clone https://github.com/KoffeinFlummi/armake.git \
    && cd /tmp/armake \
    && git checkout $REVISION \
    && unexpand -t 4 /tmp/armake/Makefile | tee /tmp/armake/Makefile \
    && make install \
    && chmod +x /tmp/armake/bin/armake

FROM ubuntu:trusty

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip \
  \
  && apt-get update && apt-get install software-properties-common git make zip -y \
  \
  && pip install pygithub \
  && pip install pygithub3 \
  \
  && rm -rf /var/lib/apt/lists/*

COPY --from=build /tmp/armake/bin/armake /usr/local/bin/armake
