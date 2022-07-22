---
title: install mono on ubuntu
tags:
- ✨extract
- tech/bash
- unity
- os/ubuntu
---

#tech/bash #unity #os/ubuntu 

---

# install mono on ubuntu

```bash
#install pre-reqs
sudo apt install gnupg ca-certificates

#add key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

#add repo
echo "deb [arch=amd64] https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list

#update package list
sudo apt-get update

#install mono
sudo apt update -y

#optional - show package
sudo apt list --installed | grep mono
```
## References

### author
> [[mikenizo808]]
### position
> https://github.com/mikenizo808/Quick-Setup-for-Unity3D-on-Ubuntu-20.04-LTS#install-mono-by-microsoft at [ubuntu x unity quick setup](/Bibliography/ubuntu%20x%20unity%20quick%20setup.md)
