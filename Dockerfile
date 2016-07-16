FROM galeone/archlinux-updated-aur
MAINTAINER Alexander Trost <galexrt@googlemail.com>

ENV NODEJS_VERSION="4.1.2" \
    CAMO_DIR="/home/camo" CAMO_KEY="" \
    PORT="8081"

USER root

RUN useradd -m -s /bin/bash camo && \
    pacaur -Syu ca-certificates openssl git nodejs npm gcc-libs --noconfirm

ADD entrypoint.sh /entrypoint.sh

EXPOSE 8081

VOLUME ["/home/camo"]

ENTRYPOINT ["/entrypoint.sh"]
