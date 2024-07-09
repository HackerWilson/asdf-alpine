FROM alpine:latest

RUN apk add --virtual .asdf-deps --no-cache bash curl git unzip procps
SHELL ["/bin/bash", "-l", "-c"]

COPY asdf-install-toolset /usr/local/bin

ENV ASDF_DIR=$HOME/.asdf

RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf && \
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc && \
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.profile && \
    source ~/.bashrc && \
    mkdir -p $HOME/.asdf/toolset
