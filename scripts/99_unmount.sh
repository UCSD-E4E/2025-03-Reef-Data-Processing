#!/bin/bash
if mountpoint -q ./lens_cal; then
    sudo umount -f -l ./lens_cal
fi
if [ -d './lens_cal' ]; then
    rmdir ./lens_cal
fi

if mountpoint -q ./label_studio_laser; then
    sudo umount -f -l ./label_studio_laser
fi
if [ -d './label_studio_laser' ]; then
    rmdir ./label_studio_laser
fi

if mountpoint -q ./label_studio_laser_low; then
    sudo umount -f -l ./label_studio_laser_low
fi
if [ -d './label_studio_laser_low' ]; then
    rmdir ./label_studio_laser_low
fi

if mountpoint -q ./label_studio_headtail; then
    sudo umount -f -l ./label_studio_headtail
fi
if [ -d './label_studio_headtail' ]; then
    rmdir ./label_studio_headtail
fi

if mountpoint -q ./reef; then
    sudo umount -f -l ./reef
fi
if [ -d './reef' ]; then
    rmdir ./reef
fi

if mountpoint -q ./data; then
    sudo umount -f -l ./data
fi
if [ -d './data' ]; then
    rmdir ./data
fi
