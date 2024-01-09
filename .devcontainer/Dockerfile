FROM --platform=linux/amd64 ubuntu:22.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV DEBIAN_FRONTEND noninteractive

# install some essential tooling
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  gnupg \
  curl \
  software-properties-common \
  git-all \
  less \
  python3-pip \
  python3-setuptools \
  python3 \
  tar \
  unzip \
  zip \
  ca-certificates \
  sudo \
  nodejs \
  jq \
  wget \
  build-essential \
  gpg-agent \
  libcurl4-openssl-dev \
  openssh-client 

# install terraform
RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  && gpg --no-default-keyring \
  --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  --fingerprint \
  && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
  https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  tee /etc/apt/sources.list.d/hashicorp.list \
  && sudo apt update \
  && sudo apt-get install terraform

# install kubectl
RUN curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.28.3/2023-11-14/bin/linux/amd64/kubectl \
&& chmod +x ./kubectl \
&& cp ./kubectl /usr/local/bin/kubectl 

# install awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && sudo ./aws/install

# install postgres 
RUN echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" >/etc/apt/sources.list.d/pgdg.list \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && apt-get update && apt-get -y install \
  postgresql-common \
  postgresql-client-common \
  postgresql-15 \
  postgresql-client-15 \
  libpq-dev

  # install docker compose 
  RUN sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && sudo chmod +x /usr/local/bin/docker-compose 