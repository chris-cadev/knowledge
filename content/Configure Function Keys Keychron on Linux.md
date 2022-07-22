---
title: Configure Function Keys Keychron on Linux
tags:
- how-to
- os/linux
- tech/hardware
---

#how-to #os/linux #tech/hardware 
1. hold for 4 seconds `fn + X + L`
2. in a terminal execute and test the function keys
```bash
echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode
```
3. and then this, to make it permanent
```bash
echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u
```


---
## References
- [Keychron Linux Function Keys](/Bibliography/Keychron%20Linux%20Function%20Keys.md)
