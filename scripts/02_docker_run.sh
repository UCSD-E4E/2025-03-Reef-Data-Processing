#!/bin/bash
docker run --rm -it --gpus=all -e NVIDIA_DRIVER_CAPABILITIES=all \
    -v ./data:/home/ubuntu/data:ro \
    -v ./lens_cal:/home/ubuntu/lens_cal:ro \
    -v ./label_studio:/home/ubuntu/label_studio \
    -v ./scripts:/home/ubuntu/scripts:ro \
    --memory='350G' \
    --shm-size=10.24gb `whoami`/fishsense-lite
