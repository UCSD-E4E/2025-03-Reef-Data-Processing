#!/bin/bash
mkdir -p ./data
if ! findmnt ./data; then
    sudo mount -v -t cifs -o vers=3.1.1,credentials=$E4E_NAS_CREDS,uid=`whoami`,ro "//e4e-nas.ucsd.edu/fishsense_data/REEF/data" ./data
fi

mkdir -p ./fishsense_data
if ! findmnt ./fishsense_data; then
    sudo mount -v -t cifs -o vers=3.1.1,credentials=$E4E_NAS_CREDS,uid=`whoami`,ro "//e4e-nas.ucsd.edu/fishsense_data" ./fishsense_data
fi

mkdir -p ./reef
if ! findmnt ./reef; then
    sudo mount -v -t cifs -o vers=3.1.1,credentials=$E4E_NAS_CREDS,uid=`whoami`,ro "//e4e-nas.ucsd.edu/fishsense_data/REEF" ./reef
fi

mkdir -p ./label_studio_laser
if ! findmnt ./label_studio_laser; then
    sudo mount -v -t cifs -o vers=3.1.1,credentials=$E4E_NAS_CREDS,uid=`whoami` "//e4e-nas.ucsd.edu/label_studio/2025-03_reef_laser" ./label_studio_laser
fi

mkdir -p ./label_studio_laser_low
if ! findmnt ./label_studio_laser_low; then
    sudo mount -v -t cifs -o vers=3.1.1,credentials=$E4E_NAS_CREDS,uid=`whoami` "//e4e-nas.ucsd.edu/label_studio/2025-04-laser_low_priority" ./label_studio_laser_low
fi

mkdir -p ./label_studio_headtail
if ! findmnt ./label_studio_headtail; then
    sudo mount -v -t cifs -o vers=3.1.1,credentials=$E4E_NAS_CREDS,uid=`whoami` "//e4e-nas.ucsd.edu/label_studio/2025-03_reef_headtail" ./label_studio_headtail
fi

mkdir -p ./lens_cal
if ! findmnt ./lens_cal; then
    sudo mount -v -t cifs -o vers=3.1.1,credentials=$E4E_NAS_CREDS,uid=`whoami`,ro "//e4e-nas.ucsd.edu/fishsense/Fishsense Lite Calibration Parameters" ./lens_cal
fi
