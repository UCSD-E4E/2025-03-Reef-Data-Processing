#!/bin/bash
mkdir -p ./data
if ! findmnt ./data; then
    sudo mount -v -t cifs -o credentials=$E4E_NAS_CREDS,uid=`whoami`,vers=1.0,ro "//e4e-nas.ucsd.edu/fishsense_data/REEF/data" ./data
fi

mkdir -p ./label_studio
if ! findmnt ./label_studio; then
    sudo mount -v -t cifs -o credentials=$E4E_NAS_CREDS,uid=`whoami`,vers=1.0 "//e4e-nas.ucsd.edu/label_studio/2025-03_reef_laser" ./label_studio
fi

mkdir -p ./lens_cal
if ! findmnt ./lens_cal; then
    sudo mount -v -t cifs -o credentials=$E4E_NAS_CREDS,uid=`whoami`,vers=1.0,ro "//e4e-nas.ucsd.edu/fishsense/Fishsense Lite Calibration Parameters" ./lens_cal
fi
