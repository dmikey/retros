#!/bin/bash

# Location for output log
OUT="/storage/roms/irq_dump.txt"
DATE=$(date)

echo "=== IRQ Dump: $DATE ===" > "$OUT"

echo -e "\n===> /proc/interrupts:" >> "$OUT"
cat /proc/interrupts >> "$OUT" 2>/dev/null

echo -e "\n===> dmesg IRQ assignments:" >> "$OUT"
dmesg | grep -i irq >> "$OUT" 2>/dev/null

echo -e "\n===> /proc/irq info:" >> "$OUT"
for IRQ in /proc/irq/*; do
  if [[ -d "$IRQ" ]]; then
    echo -e "\nIRQ ${IRQ##*/}:" >> "$OUT"
    cat "$IRQ"/* 2>/dev/null >> "$OUT"
  fi
done

echo -e "\n===> Live Device Tree IRQ references:" >> "$OUT"
find /sys/firmware/devicetree/base/ -name interrupts | while read f; do
  echo -e "\n$f:" >> "$OUT"
  hexdump -v -e '" 0x" 4/1 "%02x" "\n"' "$f" >> "$OUT"
done

echo -e "\n=== IRQ Dump Complete ===" >> "$OUT"