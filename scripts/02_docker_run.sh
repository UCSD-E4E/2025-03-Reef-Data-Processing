#!/bin/bash
docker run --rm -it --gpus all -e NVIDIA_DRIVER_CAPABILITIES=all \
    -e PSQL_PASSWORD=$PSQL_PASSWORD \
    -v ./data:/home/ubuntu/data:ro \
    -v ./lens_cal:/home/ubuntu/lens_cal:ro \
    -v ./label_studio_laser:/home/ubuntu/label_studio_laser \
    -v ./label_studio_laser_low:/home/ubuntu/label_studio_laser_low \
    -v ./label_studio_headtail:/home/ubuntu/label_studio_headtail \
    -v ./scripts:/home/ubuntu/scripts:ro \
    -v ./fishsense_data:/mnt/fishsense_data:ro \
    -v ./fishsense_data:/mnt/fishsense_data_reef:ro \
    -v ./results:/home/ubuntu/results \
    -v ./.debug:/home/ubuntu/.debug \
    --memory=$E4E_MAX_RAM \
    --shm-size=10.24gb `whoami`/fishsense-lite
