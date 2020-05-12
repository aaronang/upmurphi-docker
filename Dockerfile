FROM ubuntu:18.04

RUN /bin/bash -c "echo 'deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse' >> /etc/apt/sources.list" \
    && apt-get update \
    && apt-get install -y -t trusty-backports flex=2.5.39-8~ubuntu14.04.1 \
    && apt-mark hold flex \
    && apt-get install -y build-essential bison libc6-dev-i386 gcc-multilib g++-multilib git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --single-branch --branch master-x64 https://github.com/gdellapenna/UPMurphi.git /UPMurphi \
    && make --directory /UPMurphi/src \
    && ln -s /UPMurphi/bin/upmc /usr/local/bin/upmc
