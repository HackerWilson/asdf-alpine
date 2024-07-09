FROM alpine:latest

RUN apk add --virtual .asdf-deps --no-cache bash curl git unzip procps
SHELL ["/bin/bash", "-l", "-c"]
ENV PATH="${PATH}:/asdf/.asdf/shims:/asdf/.asdf/bin"

COPY asdf-install-toolset /usr/local/bin

RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf && \
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc && \
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.profile && \
    mkdir -p $HOME/.asdf/toolset
