---
title: resolve issue of No useable version of libssl
tags:
- ✨extract
- unity
- os/ubuntu
---

type:: #✨extract
author:: [[AlfieBooth]]
position:: https://forum.unity.com/threads/workaround-for-libssl-issue-on-ubuntu-22-04.1271405/ at [Workaround for libssl issue on Ubuntu 22.04](/Bibliography/Workaround%20for libssl issue on Ubuntu 22.04.md)
#unity #os/ubuntu 

---

# resolve issue of No useable version of libssl

>The fix that worked for me was manually downloading the 'libssl1.0.0_1.0.2n-1ubuntu5.8_amd64.deb' package from http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/
>then, in the download location:
``` bash
sudo dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.8_amd64.deb
```
