FROM beaconfireiic/ubuntu:22.04-development

LABEL smallkoudai <smallkoudai@gmail.com>

ARG VERSION=4.13.0
ADD release-packages/code-server_${VERSION}_amd64.deb ./
RUN dpkg -i code-server_${VERSION}_amd64.deb 
ENV PASSWORD '' HASHED_PASSWORD ''

EXPOSE 8080

ENTRYPOINT ["/usr/bin/code-server","--bind-addr=0.0.0.0:8080","--password"]