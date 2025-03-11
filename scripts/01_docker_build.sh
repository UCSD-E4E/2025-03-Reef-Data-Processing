#!/bin/bash
echo $E4E_MAX_CPU > fishsense-lite/runtime/.max-cpu
cd fishsense-lite/runtime
./build