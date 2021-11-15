FROM ubuntu:20.04
MAINTAINER Alessio Garzi "gun101@email.it"
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update -q && apt-get install -qy curl git fs-uae xvfb libtemplate-perl && rm -rf /var/lib/apt/lists/*
RUN fs-uae 1>/dev/null 2>/dev/null || echo "Fsuae directory created"
ENV refresh=8
COPY fsconf.fs-uae.tt /root/FS-UAE/Configurations
ENV MODEL=A600
ENV CHIP=1024
ENV KSROM=/tmp/shared/kick205.rom
COPY startfsuae.sh /usr/local/bin
WORKDIR /root/FS-UAE/Configurations 
VOLUME /tmp/shared
# Start testing
CMD "/usr/local/bin/startfsuae.sh"
