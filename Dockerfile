FROM ruby:2.6.5-slim

RUN export DEBIAN_FRONTEND=noninteractive

ENV AWS_REGION "us-east-1"

ENV RAILS_ENV=production \
    RACK_ENV=production

RUN apt update && \
    apt-get install -y \
    curl \
    build-essential \
    default-libmysqlclient-dev \
    cron \
    vim \
    less \
    net-tools \
    telnet \
    socat \
    dnsutils \
    netcat \
    tree \
    ssh \
    rsync \
    python \
    python-pip \
    jq \
    git \
    nodejs \
    software-properties-common \
    supervisor \
    rsync \
    htop \
    nano \
    tzdata \
    && apt-get clean

RUN ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN gem update --system

RUN echo 'gem: --no-document' >> ~/.gemrc

RUN gem update

RUN gem install bundler foreman procodile whenever tzinfo tzinfo-data \
    && gem cleanup

EXPOSE 3000
