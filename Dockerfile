FROM alpine:latest

RUN apk add --virtual .asdf-deps --no-cache bash curl git unzip procps
SHELL ["/bin/bash", "-l", "-c"]

COPY asdf-install-toolset /usr/local/bin

USER root
RUN export ASDF_DIR="${HOME}/.asdf" && \
    git clone --depth 1 https://github.com/asdf-vm/asdf.git ${ASDF_DIR} && \
    echo -e '\n. ${ASDF_DIR}/asdf.sh' >> ~/.bashrc && \
    echo -e '\n. ${ASDF_DIR}/asdf.sh' >> ~/.profile && \
    mkdir -p ${ASDF_DIR}/toolset
