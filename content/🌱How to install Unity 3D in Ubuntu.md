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
5. [add a unity editor](/Extracts/add%20a%20unity%20editor.md) ([steps to add a unity editor](/Extracts/steps%20to%20add%20a%20unity%20editor.md))
6. [install dotnet for ubuntu](/Extracts/install%20dotnet%20for%20ubuntu.md)
7. [install mono on ubuntu](/Extracts/install%20mono%20on%20ubuntu.md)
8. [install mono-devel](/Extracts/install%20mono-devel.md)
9. [resolve issue of No useable version of libssl](/Extracts/resolve%20issue%20of%20No%20useable%20version%20of%20libssl.md)

## History behind these steps
When I was working in [🌱Rainbow triangle](/🌱Rainbow%20triangle.md) I was searching for game engines to work with. Since [🌱Rainbow triangle](/🌱Rainbow%20triangle.md) is a simple game from my perspective I was trying to use something “easy” to use, so I tried [[Skia]] with [[React Native]] at first was easy, but then it was a mess. So I was deciding between [[Flutter]] and [[Unity]]. And then when I was searching “how to install [[Unity]] in Ubuntu" I notice that some tutorials were complicated and not working for my version of [[ubuntu]] (22.04 LTS). So I found a [How to install Unity3D on Ubuntu 20.04](/Bibliography/How%20to%20install%20Unity3D%20on%20Ubuntu%2020.04.md) where I just got that [easier to download the appimage of unity](/Extracts/easier%20to%20download%20the%20appimage%20of%20unity.md). Then I got to [ubuntu-unity quick setup](/Bibliography/ubuntu-unity%20quick%20setup.md) where [[mikenizo808]] explains how to install all the necessary things to make unity works in Ubuntu. Applying those steps work to open the editor, but a compiled time issue comes to the editor “[[No useable version of libssl]]”. Searching a little got me to [Workaround for libssl issue on Ubuntu 22.04](/Bibliography/Workaround%20for%20libssl%20issue%20on%20Ubuntu%2022.04.md) of [[AlfieBooth]]. There he explains how to he solved.
