---
layout: default
title: "Play With Debian"
---

# Play With Debian

![debian-logo]({{ site.url }}{{site.baseurl}}/images/debian-logo.png)

Records tools installation when playing with Debian.

## Git Installation

```sh
sudo apt install git
git --version
git config --global user.name "Sammy"
git config --global user.email "sammy@domain.com"


```

## Visual Studio Code Installation

### Debian and Ubuntu based distributions

The easiest way to install Visual Studio Code for Debian/Ubuntu based distributions is to download and install the [.deb package](https://code.visualstudio.com/).

```sh

sudo apt install ./<file>.deb

# If you're on an older Linux distribution, you will need to run this instead:
# sudo dpkg -i <file>.deb
# sudo apt-get install -f # Install dependencies

```

## Chinese Input 中文输入法

```sh

sudo apt-get install fcitx
sudo apt-get install fcitx-pinyin

./im-config # 输入法配置工具
```

## Terminal 终端下复制粘贴快捷键

- 复制 CTRL+SHIFT+C
- 粘贴 CTRL+SHIFT+V

## Games

```sh
# supertux
sudo apt-get install supertux

```

## Password Manager

```sh
sudo apt-get install keepassx

```

## Bittorrent Client

```sh

sudo apt-get install qbittorrent
```


## Mount Network Location

```sh
sudo apt-get install cifs-utils smbclient

sudo mkdir /media/Data

# List the share name in remote host with real host ip
smbclient -L //192.168.*.*

sudo mount -t cifs -o username=*** //192.168.*.*/sharename /media/Data/

```
## Claws Mail Setting

### IMAP

```
服务器名称: outlook.office365.com

端口: 993

加密方法: TLS

```

### SMTP

```
服务器名称: smtp.office365.com

端口: 587

加密方法: STARTTLS

```


## shadowsocks


```sh

sudo apt-get install shadowsocks

sslocal -c sslocal.conf # connect to the proxy server.

```


![Firefox Proxy Setting]({{ site.url }}{{site.baseurl}}/images/shadowsocks-firefox.png)


## Firefox Flash Player


Download and execute this shell script [fireflashupdate](https://github.com/cybernova/fireflashupdate)with the following commands: 

```sh

wget https://raw.githubusercontent.com/cybernova/fireflashupdate/master/fireflashupdate.sh
chmod +x fireflashupdate.sh
./fireflashupdate.sh

```


## Putty - SSH Client

```sh

sudo apt-get install putty

```


### GIMP - Open Source Image Editor

```sh
# https://www.gimp.org/
sudo apt-get install gimp

```

