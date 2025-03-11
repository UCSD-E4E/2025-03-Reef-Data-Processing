#!/bin/bash
if mountpoint -q ./lens_cal; then
    sudo umount -f -l ./lens_cal
fi
if [ -d './lens_cal' ]; then
    rmdir ./lens_cal
fi

if mountpoint -q ./label_studio; then
    sudo umount -f -l ./label_studio
fi
if [ -d './label_studio' ]; then
    rmdir ./label_studio
fi

if mountpoint -q ./data; then
    sudo umount -f -l ./data
fi
if [ -d './data' ]; then
    rmdir ./data
fi
