## -*- docker-image-name: "opamp/archlinux" -*-
FROM base/archlinux:latest
MAINTAINER opamp_sando <opampg@gmail.com>

RUN pacman -Syu --noconfirm patch > /dev/null

RUN pacman-db-upgrade > /dev/null
RUN rm -fr /etc/pacman.d/gnupg
RUN pacman-key --init > /dev/null
RUN pacman-key --populate archlinux > /dev/null

# Install yaourt
ADD pacman.conf.patch /tmp/pacman.conf.patch
RUN patch /etc/pacman.conf < /tmp/pacman.conf.patch && rm -f /tmp/pacman.conf.patch
RUN pacman -Syu yaourt --noconfirm > /dev/null

ONBUILD RUN pacman -Syu --noconfirm > /dev/null
