FROM ubuntu:latest
LABEL maintainer="akikinyan@gmail.com"

RUN apt-get -y update && apt-get -y install openssl unzip curl vim

# Install awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" && \
    cd /tmp && unzip awscliv2.zip && \
    ./aws/install

# Band limitation
RUN aws configure set default.s3.max_bandwidth 128KB/s

# Entrypoint
COPY entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
