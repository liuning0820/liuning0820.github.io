---
layout: default
author: 对刘谈心
comments: true
tags: [tools]
title: "iPhone and iPad 听本地音乐"
---

# iPhone and iPad 听本地音乐

苹果设备自带的音乐App必须要经过付费订阅才能在线听歌，当然你还是可以把本地的歌曲拷贝或iTune同步到iPhone上进行收听，
或者可以下载国内的一些在线音乐App，比如QQ音乐，网易云音乐进行在线播放。

但是在线音乐的出路还是慢慢地得付费，或者忍受广告，下面介绍一种听本地FTP服务器上音乐的办法。

<! --more-- >

## 树莓派上搭建FTP 服务器

```sh

# 安装FTP Server
sudo apt-get install vsftpd
# 启动服务
sudo service vsftpd start
#检查服务状态
# sudo service vsftpd status
# systemctl status vsftpd

```

### Access the FTP server from ssh

```sh

# ftp ip-of-ftp-server-host
ftp 192.168.*.*

# 修改配置文件
sudo nano /etc/vsftpd.conf

# 解决中文显示乱码问题
# Uncomment this to indicate that vsftpd use a utf8 filesystem.
utf8_filesystem=YES

systemctl restart vsftpd

```

## foobar2000

在iPhone/iPad上安装foobar2000, 然后 "设置"-> "Media Library" -> "Add folder" -> "ftp://user:password@192.168.1.1"

![Add FTP Shares]({{ site.url }}{{site.baseurl}}/images/iPad-foobar2000-add-ftp-share.jpg)

<iframe width="560" height="315" src="https://player.bilibili.com/player.html?aid=75829297&cid=129722513&page=1" frameborder="0" allowfullscreen="true"></iframe>

[B站观看短视频教程](https://www.bilibili.com/video/av75829297/)

