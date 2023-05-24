FROM beaconfireiic/ubuntu:22.04-development

LABEL smallkoudai <smallkoudai@gmail.com>

ADD release-packages/code-server_4.13.0_amd64.deb ./
RUN dpkg -i code-server_4.13.0_amd64.deb && \
    sed -i 's#127.0.0.1#0.0.0.0#g' ~/.config/code-server/config.yaml
ENV PASSWORD '' HASHED_PASSWORD ''

EXPOSE 8080

ENTRYPOINT ["/usr/bin/code-server"]