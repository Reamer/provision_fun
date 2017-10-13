FROM debian:latest 

ENV go_version 1.9.1
ENV terraform_version 0.10.7
RUN /usr/bin/apt-get update && \
    /usr/bin/apt-get -y install wget unzip
# Install Go
RUN /usr/bin/wget -q -P /tmp https://storage.googleapis.com/golang/go${go_version}.linux-amd64.tar.gz && \
    /bin/tar -C /usr/local -xzf /tmp/go${go_version}.linux-amd64.tar.gz && \
    /bin/rm /tmp/go${go_version}.linux-amd64.tar.gz && \
    /bin/ln -s /usr/local/go/bin/go /usr/local/bin/go && \
    /bin/ln -s /usr/local/go/bin/godoc /usr/local/bin/godoc && \
    /bin/ln -s /usr/local/go/bin/gofmt /usr/local/bin/gofmt

# Install Terraform
RUN /usr/bin/wget -q -P /tmp https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip && \
    /usr/bin/unzip -d /usr/local/bin /tmp/terraform_${terraform_version}_linux_amd64.zip && \
    /bin/rm /tmp/terraform_${terraform_version}_linux_amd64.zip
