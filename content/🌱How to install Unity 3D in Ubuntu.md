---
title: 🌱How to install Unity 3D in Ubuntu
tags:
---

## TLDR
> how to install all the necessary stuff to get unity running

## steps
1. go to https://unity3d.com/get-unity/download
2. click on download unity hub
3. create an account
4. add a license
5. [[add a unity editor]] ([steps to add a unity editor](content/Extracts/steps to add a unity editor.md))
6. [install dotnet for ubuntu](content/Extracts/install dotnet for ubuntu.md)
7. [install mono on ubuntu](content/Extracts/install mono on ubuntu.md)
8. [install mono-devel](content/Extracts/install mono-devel.md)
9. [resolve issue of No useable version of libssl](content/Extracts/resolve issue of No useable version of libssl.md)

## History behind these steps
When I was working in [🌱Rainbow triangle](content/🌱Rainbow triangle.md) I was searching for game engines to work with. Since [🌱Rainbow triangle](content/🌱Rainbow triangle.md) is a simple game from my perspective I was trying to use something “easy” to use, so I tried [[Skia]] with [[React Native]] at first was easy, but then it was a mess. So I was deciding between [[Flutter]] and [[Unity]]. And then when I was searching “how to install [[Unity]] in Ubuntu" I notice that some tutorials were complicated and not working for my version of [[ubuntu]] (22.04 LTS). So I found a [How to install Unity3D on Ubuntu 20.04](content/Bibliography/How to install Unity3D on Ubuntu 20.04.md) where I just got that [easier to download the appimage of unity](content/Extracts/easier to download the appimage of unity.md). Then I got to [ubuntu-unity quick setup](content/Bibliography/ubuntu-unity quick setup.md) where [[mikenizo808]] explains how to install all the necessary things to make unity works in Ubuntu. Applying those steps work to open the editor, but a compiled time issue comes to the editor “[No useable version of libssl](content/Extracts/resolve issue of No useable version of libssl.md)”. Searching a little got me to [Workaround for libssl issue on Ubuntu 22.04](content/Bibliography/Workaround for libssl issue on Ubuntu 22.04.md) of [[AlfieBooth]]. There he explains how to he solved.
