FROM alpine:3.15.0@sha256:c74f1b1166784193ea6c8f9440263b9be6cae07dfe35e32a5df7a31358ac2060

RUN apk --update add --no-cache python3 py3-netifaces py3-prettytable py3-certifi \
py3-chardet py3-future py3-idna py3-netaddr py3-parsing py3-six\
 nmap nmap-scripts curl jq zsh skopeo && \
rm -rf /var/cache/apk/*

#Docker Client
RUN curl -OL https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz && tar -xzvf docker-20.10.9.tgz && \
cp docker/docker /usr/local/bin && chmod +x /usr/local/bin/docker && rm -rf docker/ && rm -f docker-20.10.9.tgz

#etcdctl - is a command line client for etcd
RUN curl -OL https://github.com/etcd-io/etcd/releases/download/v3.3.13/etcd-v3.3.13-linux-amd64.tar.gz && \
tar -xzvf etcd-v3.3.13-linux-amd64.tar.gz && cp etcd-v3.3.13-linux-amd64/etcdctl /usr/local/bin && \
chmod +x /usr/local/bin/etcdctl && rm -rf etcd-v3.3.13-linux-amd64 && rm -f etcd-v3.3.13-linux-amd64.tar.gz

#AmIcontained - Container introspection tool
RUN curl -OL https://github.com/genuinetools/amicontained/releases/download/v0.4.9/amicontained-linux-amd64 && \
mv amicontained-linux-amd64 /usr/local/bin/amicontained && chmod +x /usr/local/bin/amicontained

#BotB - Break out the Box: container analysis and exploitation tool
RUN curl -OL https://github.com/brompwnie/botb/releases/download/1.8.0/botb-linux-amd64 && \
mv botb-linux-amd64 /usr/local/bin/botb && chmod +x /usr/local/bin/botb

#REG - Docker registry v2 command line client and repo listing generator with security checks
RUN curl -OL https://github.com/genuinetools/reg/releases/download/v0.16.1/reg-linux-amd64 && \
mv reg-linux-amd64 /usr/local/bin/reg && chmod +x /usr/local/bin/reg

#DIVE - A tool for exploring a docker image, layer contents, and discovering ways to shrink the size of your Docker/OCI image
RUN curl -OL https://github.com/wagoodman/dive/releases/download/v0.10.0/dive_0.10.0_linux_amd64.tar.gz &&  tar -xzvf dive_0.10.0_linux_amd64.tar.gz &&\
mv dive /usr/local/bin/dive && chmod +x /usr/local/bin/dive && rm -f dive_0.10.0_linux_amd64.tar.gz LICENSE README.md

#ZSH - Powerline10K
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)"

CMD ["tail", "-f" , "/dev/null"]
