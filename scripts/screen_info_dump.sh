#!/bin/bash

# Output file
OUT="/storage/roms/screen_info.txt"
mkdir -p /storage/roms
echo "🖥️ RK3326 Screen Info Dump" > "$OUT"
echo "Timestamp: $(date)" >> "$OUT"
echo "======================================" >> "$OUT"

echo -e "\n>> dmesg | grep panel / drm / mipi" >> "$OUT"
dmesg | grep -Ei 'panel|drm|mipi' >> "$OUT" 2>/dev/null

echo -e "\n>> DRM Devices in /sys/class/drm/" >> "$OUT"
ls -l /sys/class/drm/ >> "$OUT" 2>/dev/null

echo -e "\n>> fbset -i" >> "$OUT"
fbset -i >> "$OUT" 2>/dev/null

echo -e "\n>> /sys/class/backlight contents" >> "$OUT"
for f in /sys/class/backlight/*; do
  echo "[$f]" >> "$OUT"
  cat "$f"/{actual_brightness,max_brightness,brightness} 2>/dev/null >> "$OUT"
done

echo -e "\n>> I2C Device Names" >> "$OUT"
for i in /sys/bus/i2c/devices/*/name; do
  echo "$i: $(cat $i)" >> "$OUT"
done 2>/dev/null

echo -e "\n>> Panel modaliases (if any)" >> "$OUT"
find /sys -name modalias | grep panel | while read -r f; do
  echo "$f: $(cat $f)" >> "$OUT"
done 2>/dev/null

echo -e "\n>> /proc/device-tree dump (if mounted)" >> "$OUT"
if [ -d /proc/device-tree ]; then
  dtc -I fs /proc/device-tree 2>/dev/null >> "$OUT"
else
  echo "/proc/device-tree not mounted or unavailable" >> "$OUT"
fi

echo -e "\n✅ Done. Dump written to: $OUT"