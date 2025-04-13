---
layout: post
author: 对刘谈心
comments: true
tags: [自媒体]
title: "MPC-HC 同时加载中英双字幕"
---

# MPC-HC 同时加载中英双字幕

网络上下载的英文视频，分别有中英文版本的字幕文件，想同时在我所使用的媒体播放器MPC-HC中加载，对比着看。

下面谈谈这个问题的解决经过。

<! --more-- >

## 更简便的解决方案

如果你使用的是KMPlayer或者PotPlayer，这个功能已经自带。我用的播放器是MPC-HC，两个原因

- 开源
- 硬件资源占用低

## 针对MPC-HC的解决方案

MPC-HC 本身内嵌的字幕加载器不支持双字幕，我们需要通过滤镜来显示额外的字幕。

<iframe width="560" height="315" src="https://player.bilibili.com/player.html?aid=70730329&cid=122547253&page=1" frameborder="0" allowfullscreen="true"></iframe>

[B站观看短视频教程](https://www.bilibili.com/video/av70730329/)

### 下载 VSFilter

下载 [VSFilter](https://nightly.mpc-hc.org/mpc-hc_apps/vsfilter/) 并安装。
当安装结束后，会提示你去配置这个插件，勾选并进行配置如下：

In the Main tab tick Override placement and enter a vertical (V) number somewhere between 0-25 to put this subtitle at the top. Click OK.

![configure vsfilter]({{ site.url }}{{site.baseurl}}/images/configure_vsfilter.png)

### MPC-HC 中的配置

打开 MPC-HC, go to Options (O) > Advanced, double click the "BlockVSFilter" entry to make it False. Click OK, close and reopen MPC-HC.

当您打开视频文件并需要两个字幕时，可以右键单击->字幕菜单中加载底部的字幕，第二个显示在顶部的字幕可通过"过滤器" -> "VSFilter（自动加载版本）"加载。

![加载额外字幕]({{ site.url }}{{site.baseurl}}/images/mpc_vsfilter_subtitle.jpg)

### 参考链接

[playing-two-subtitles](https://www.raymond.cc/blog/playing-two-subtitles-at-the-same-time-in-dvd-player-and-computer/)
