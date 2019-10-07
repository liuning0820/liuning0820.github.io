---
layout: default
author: liuning0820
comments: true
tags: [devops]
title: "通过浏览器进行云开发"
---

# 通过浏览器进行云开发

现在是云计算的时代，作为开发者，也应该拥抱面向云端的开发方式，而不让自己限定于具体的高性能的开发机器面前。

不管是Windows,Linux,MacOS，还是iPhone或Android, 抑或是iPad，都支持浏览器，浏览器就是云开发的最佳终端入口。
且看我的实践。

<! --more-- >

## 浏览器

首先从浏览器入手，这里选全网通用的浏览器Firefox为例。最喜欢的功能 **"Send Tab To Device"** 可以在不同设备间同步,接力链接。

Firefox's Send Tab feature lets you send pages to and from your computer, iPhone or iPad, so you can continue browsing wherever you are. You will no longer have to text or email yourself links.

![Send Tab To Device]({{ site.url }}{{site.baseurl}}/images/firefox-send-tab-to-device.png){:height="50%" width="80%"}

## 跨浏览器跨设备的Bookmark同步方案

如果你只用一种浏览器，并且启用了书签同步功能，你可以在不同设备上都能访问到你的常用链接。
但是如果是跨浏览器，又跨设备呢？ 当然网络上有很多付费的方案，这里我介绍一种我自己的免费开源的方案。
简单来说，就是以代码维护你的书签文件，并将其保存为一个GitHub上，然后各个浏览器设置其链接为主页。这样你既可以随时增减链接，也可以让各个浏览器上书签保持同步更新。 详情可以参考 [bookmark-as-code](https://github.com/liuning0820/bookmark-as-code)

![VS Code through Browser]({{ site.url }}{{site.baseurl}}/images/cross-browser-bookmark.png){:height="50%" width="80%"}

## Remote IDE In Browser

有了跨设备并能共享链接的浏览器，接下来要考虑的就是开发的编辑器IDE的问题了。如何才能在任何设备上操作同一个IDE并接力开发呢？
那就把你的IDE装在云端，然后通过浏览器进行访问。

### code-server

[code-server](https://github.com/cdr/code-server) 就是我想要的开源工具。他可以在Cloud 虚拟机里以Docker容器的方式运行
目前最流行的跨平台编码器 Visual Studio Code，并且可以直接通过浏览器进行操作编辑你的代码。
code-server: Run VS Code on a remote server,accessible through the browser.

只要云端一行代码

```sh

docker run -it -p 0.0.0.0:8443:8443 -v "${PWD}:/home/coder/project" codercom/code-server --allow-http --no-auth

```

![VS Code through Browser]({{ site.url }}{{site.baseurl}}/images/code-server-in-browser.png){:height="50%" width="80%"}

更加惊喜的是，你可以在浏览器里的VS Code IDE 通过 SSH 连接到其他虚拟器进行bash 操作。

## 墙里墙外

墙里墙外的事，给我们这些程序员增添了不少烦恼。

为了实现云开发，难道要在局域网里搭私有云不成?

## 结论

俨然，有了强大的云计算能力做靠山，我们在本地端任何设备通过一个浏览器，就可以进行日常工作了。再也不用纠结于我的配置不够高，内存不够大等问题。

希望本文能给你点思路，也欢迎你给我更多建议。
