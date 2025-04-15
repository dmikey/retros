#!/bin/sh

echo $(cat /proc/mounts | grep mmcblk0) > /storage/roms/aa_mounts.txt
cat /proc/partitions > /storage/roms/aa_partitions.txt