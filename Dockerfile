## -*- docker-image-name: "image-name-here" -*-
FROM base/archlinux:latest
MAINTAINER opamp_sando <opampg@gmail.com>

RUN pacman -Syu --noconfirm > /dev/null
RUN pacman-db-upgrade > /dev/null
RUN rm -fr /etc/pacman.d/gnupg
RUN pacman-key --init > /dev/null
RUN pacman-key --populate archlinux > /dev/null
RUN pacman -Syy

ONBUILD RUN pacman -Syu --noconfirm > /dev/null
