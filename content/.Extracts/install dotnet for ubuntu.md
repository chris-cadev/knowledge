---
title: install dotnet for ubuntu
tags:
- ✨extract
- unity
- os/ubuntu
---


<table>
<tr>
<td> type </td>
<td> #✨extract </td>
</tr>
<tr>
<td> author </td>
<td> [[mikenizo808]] </td>
</tr>
<tr>
<td> position </td>
<td> <a href="https://github.com/mikenizo808/Quick-Setup-for-Unity3D-on-Ubuntu-20.04-LTS#install-net at [ubuntu-unity quick setup](/Bibliography/ubuntu-unity%20quick%20setup.md)">https://github.com/mikenizo808/Quick-Setup-for-Unity3D-on-Ubuntu-20.04-LTS#install-net at [ubuntu-unity quick setup](/Bibliography/ubuntu-unity%20quick%20setup.md)</a> </td>
</tr>
</table>

#unity #os/ubuntu 

---

# install dotnet for ubuntu

```bash
#get package list
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

#add repo
sudo dpkg -i packages-microsoft-prod.deb
    
#install pre-reqs
sudo apt-get install -y apt-transport-https

#update package list
sudo apt-get update

#install .NET
sudo apt-get install -y dotnet-sdk-6.0

#confirm it works
dotnet
```
