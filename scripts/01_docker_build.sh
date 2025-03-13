#!/bin/bash
echo $E4E_MAX_CPU > fishsense-lite/runtime/.max-cpu
echo $E4E_MAX_GPU > fishsense-lite/runtime/.max-gpu
cd fishsense-lite/runtime
./build