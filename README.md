# RetrOS – Custom Firmware for Clone R36S (rk3326 Variant)

<img src="media/retros.png" width="300"/>

Welcome to **RetrOS** – a clean, custom firmware for R36S clone handhelds, designed to boot from TF1 and unlock the device’s full potential. Whether you're into retro gaming or hacking together a hyper-mobile compute node for the [BLESS Network](https://bless.network), RetrOS is your gateway.

> 💡 RetrOS isn’t just an emulator playground – it’s a springboard for building portable, low-cost Linux nodes with battery backup, GPU, Wi-Fi, and decentralized dreams.

---

## 🔧 Firmware Overview

This repo includes two builds:

### `/aeolusUX-unlocked-k36-clean/` (aka RetrOS main build)

- Optimized for SD (TF1) boot.
- Compatible with clone R36S devices using `rk3326-evb-lp3-v12-linux.dtb`.
- Fixed: joystick inversion, headphone switching, volume rocker, and Wi-Fi.
- Clean extlinux and U-Boot setup with optional splash screen.

### `/clone-factory-base/`

- A direct dump of the factory NAND image.
- For restoration or reverse engineering only.
- Includes `rf3536k3ka.dtb` – known for inverted stick mappings and missing features.

---

## 🧱 Directory Structure


