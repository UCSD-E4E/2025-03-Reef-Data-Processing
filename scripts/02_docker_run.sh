#!/bin/bash
docker run --rm -it --gpus all -e NVIDIA_DRIVER_CAPABILITIES=all \
    -v ./data:/home/ubuntu/data:ro \
    -v ./lens_cal:/home/ubuntu/lens_cal:ro \
    -v ./label_studio_laser:/home/ubuntu/label_studio_laser \
    -v ./label_studio_headtail:/home/ubuntu/label_studio_headtail \
    -v ./scripts:/home/ubuntu/scripts:ro \
    --memory='24G' \
    --shm-size=10.24gb `whoami`/fishsense-lite
