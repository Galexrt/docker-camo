FROM base/archlinux
MAINTAINER Alexander Trost <galexrt@googlemail.com>

ENV NODEJS_VERSION="4.1.2" \
    CAMO_DIR="/home/camo" CAMO_KEY="" \
    PORT="8081"

ADD entrypoint.sh /entrypoint.sh
RUN pacman -Sy wget ca-certificates git tar --noconfirm &&  \
    useradd -m -s /bin/bash camo && \
    wget "https://nodejs.org/dist/v$NODEJS_VERSION/node-v$NODEJS_VERSION-linux-x64.tar.gz" && \
    tar xvzf "node-v$NODEJS_VERSION-linux-x64.tar.gz"

EXPOSE 8081
VOLUME ["/home/camo"]

ENTRYPOINT ["/entrypoint.sh"]
