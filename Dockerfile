FROM debian:latest 

ENV go_version 1.9.1
ENV terraform_version 0.10.7
ENV GOPATH /root/go
RUN /usr/bin/apt-get update && \
    /usr/bin/apt-get -y install curl bsdtar && \
    /usr/bin/apt-get clean
# Install Go
RUN /usr/bin/curl -s https://storage.googleapis.com/golang/go${go_version}.linux-amd64.tar.gz \
      | /usr/bin/bsdtar -xf- -C /usr/local && \
    /bin/ln -s /usr/local/go/bin/go /usr/local/bin/go && \
    /bin/ln -s /usr/local/go/bin/godoc /usr/local/bin/godoc && \
    /bin/ln -s /usr/local/go/bin/gofmt /usr/local/bin/gofmt

# Install Terraform
RUN /usr/bin/curl -s https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip \
      | /usr/bin/bsdtar -xvf- -C /usr/local/bin && \
    /bin/chmod a+x /usr/local/bin/terraform
# Install libvirt Terraform Plugin
RUN /usr/bin/apt-get update && \
    /usr/bin/apt-get -y install git pkg-config libvirt-dev gcc && \
    /usr/bin/apt-get clean && \
    /bin/mkdir ${GOPATH} && \
    /usr/local/bin/go get github.com/dmacvicar/terraform-provider-libvirt
ADD ./terraform-config/.terraformrc /root/.terraformrc
