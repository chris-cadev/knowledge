---
title: permanent function mode in linux
tags:
- ✨extract
- tech/bash
- tech/hardware
---


---

# permanent function mode in linux
#tech/bash #tech/hardware 

```bash
echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u
```
## References

### author
> [[Mike Shade]]
### position
> at the end in [Keychron Linux Function Keys](/Bibliography/Keychron%20Linux%20Function%20Keys.md)
