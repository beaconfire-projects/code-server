FROM ubuntu:22.04

LABEL smallkoudai <smallkoudai@gmail.com>

ENV PASSWORD '' HASHED_PASSWORD ''
ADD release-packages/code-server_${VERSION}_amd64.deb ./
RUN apt update && apt install -y vim cmake pkg-config zsh git git-lfs curl && \
    chsh -s /bin/zsh && \
    echo y|sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
    dpkg -i code-server_${VERSION}_amd64.deb && \
    sed -i 's#127.0.0.1#0.0.0.0#g' ~/.config/code-server/config.yaml

ENTRYPOINT ["/usr/bin/code-server"]