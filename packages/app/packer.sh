#!/usr/bin/env bash

if [ `id -u` -ne 0 ]; then
    echo "ERROR! `basename ${0}` must be executed as root."
    exit 1
fi

CORE_PKG=$(basename ${0} .sh)

IS_INSTALLED=$(pacman -Qqm ${CORE_PKG})
if [ $? -ne 0 ]; then
    mkdir -p /usr/local/src
    wget -c http://aur.archlinux.org/packages/pa/packer/packer.tar.gz -O /usr/local/src/packer.tar.gz
    if [ $? -ne 0 ]; then
        echo "ERROR! Couldn't downloading packer.tar.gz. Skipping packer install."
    else
        cd /usr/local/src
        tar zxvf packer.tar.gz
        cd packer
        makepkg --asroot -ifs --noconfirm
    fi
else
    echo "${CORE_PKG} is already installed."
fi



