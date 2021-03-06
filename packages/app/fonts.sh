#!/usr/bin/env bash

if [ `id -u` -ne 0 ]; then
    echo "ERROR! `basename ${0}` must be executed as root."
    exit 1
fi

TTF=""
if [ -f ../desktop/ttf.txt ]; then
    TTF="../desktop/ttf.txt"
elif [ -f packages/desktop/ttf.txt ]; then
    TTF="packages/desktop/ttf.txt"
fi

if [ -f ${TTF} ]; then
    pacman -S --needed --noconfirm `cat ${TTF}`
    IS_INSTALLED=$(pacman -Qqm ttf-ms-fonts)
    if [ $? -ne 0 ]; then
        packer -S --noedit --noconfirm ttf-ms-fonts ttf-unifont
    fi
    fc-cache -f -v
fi
