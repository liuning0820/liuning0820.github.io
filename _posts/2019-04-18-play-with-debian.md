---
layout: post
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

To install old 32 bit version for Linux (ex. version 1.32), you can find it here <https://code.visualstudio.com/updates/v1_32>

```sh

sudo apt install ./<file>.deb

# If you're on an older Linux distribution, you will need to run this instead:
# sudo dpkg -i <file>.deb
# sudo apt-get install -f # Install dependencies

```

### Install using Snapd

```sh

sudo apt update
#Enable snapd
sudo apt install snapd -y
# Install Visual Studio Code
sudo snap install code --classic
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

## BitTorrent Client

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

> 服务器名称: outlook.office365.com
>
> 端口: 993
>
> 加密方法: TLS

### SMTP

> 服务器名称: smtp.office365.com
>
> 端口: 587
>
> 加密方法: STARTTLS

## Thunderbird Install

- Download Thunderbird from the [Thunderbird download page](https://www.thunderbird.net/en-US/thunderbird/all/) to your home directory.
- Extract the contents of the downloaded file
    ```sh
    tar xjf thunderbird-*.tar.bz2
    ```
- To start Thunderbird, run the thunderbird script in the thunderbird folder: ~/thunderbird/thunderbird

- Create the desktop shortcut launcher

Create a new text file called Thunderbird.desktop in the /home/pi/Desktop/ directory, e.g. /home/pi/Desktop/Thunderbird.desktop, contains the connect below:

```ini
[Desktop Entry]
Name=Thunderbird
Comment=Thunderbird Shortcut
Icon=/path/to/a/icon/for/the/Thunderbird/shortcut
Exec=/usr/share/applications/Thunderbird
Type=Application
Encoding=UTF-8
Terminal=false
Categories=None;

```


## VPN

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

## GIMP - Open Source Image Editor

```sh
# https://www.gimp.org/
sudo apt-get install gimp

```

## Snapd - Tool to interact with Ubuntu Core Snappy

Snaps are app packages for desktop, cloud and IoT that are easy to install, secure, cross-platform and dependency-free.

```sh
sudo apt-get install snapd
sudo reboot
sudo snap install hello-world ## find the snaps to install from store https://snapcraft.io/store
```

## Find - search for files

```sh

find . -name "*羽毛球*" # search current path for a file name contains '羽毛球'


```



## List the recently installed packages



```sh
# This will list all the packages including the dependencies that were installed recently on your system along with the time of installation.
grep " install " /var/log/dpkg.log

# This will show only the programs that you installed using apt command.
grep " install " /var/log/apt/history.log
```

## 多屏幕显示

```sh
# 显示可用显示器
xrandr

# 仅在外接VGA显示器显示，关闭笔记本显示器
xrandr --output VGA-1 --auto --output LVDS-1 --off

# 扩屏显示
xrandr --output VGA-1 --auto --right-of LVDS-1

```

## 摄像头视频拍照工具

```sh
# cheese  一个使用摄像头拍摄录像或照片的工具

sudo apt-get install cheese

```

## Printer Setup

### Install HP Linux Image and Printer

<https://developers.hp.com/hp-linux-imaging-and-printing/gethplip>

```sh


sudo apt-get install hplip
sudo apt-get install hplip-gui


```

## Install aria2

```sh

sudo apt-get install aria2

aria2c -h

```

## start simplenote

```sh

sudo simplenote --no-sandbox

```

## Screenshot Tools

### scrot - commandline screenshot tool

In commandline, type 'scrot' will take the screenshot, or press 'PrintScreen' button will take the screenshot.

```sh

scrot
# The screenshot is saved under the specified file name. In addition, the parameters cause the screenshot to be created only after a delay of -d (delay) of 5 seconds. The parameter -c also displays this delay as a countdown. 
scrot -cd 5 screenshot.png

# -s select the region to take screenshots
scrot -s -cd 5 ./images/screenshot.png
```

### gnome-screenshot


Making a Keyboard Shortcut for Gnome Screenshot
The one real downside to Gnome Screenshot is that, as soon as you save one picture, the app closes and you need to launch it again for the next capture.  

In fact, you can change the configuration so PrtSrc launches Gnome Screenshot instead of Scrot. In short, you must

1. Open the /etc/xdg/openbox/lxde-pi-rc.xml file for editing.

sudo nano /etc/xdg/openbox/lxde-pi-rc.xml

2. Add the following code somewhere under the <keyboard> section.

<keybind key="C-A-Print]"><action name="Execute"><command>gnome-screenshot --interactive</command></action></keybind>

That will assign Gnome Screenshot to CTRL + ALT + PrtScr, but you can also override the regular PrtSrc command that launches Scrot by editing it in this section.

```sh
sudo apt install gnome-screenshot

# open it in terminal
gnome-screenshot --interactive
gnome-screenshot -i

```

## MOUSE WITHOUT BORDERS : Barrier

Ubuntu/Debian/Raspbian: Build from source <https://github.com/debauchee/barrier/wiki/Building-on-Linux>

```sh
    sudo apt update && sudo apt upgrade
    sudo apt install git cmake make xorg-dev g++ libcurl4-openssl-dev \
                    libavahi-compat-libdnssd-dev libssl-dev libx11-dev \
                    libqt4-dev qtbase5-dev
    git clone git@github.com:debauchee/barrier.git
    # this builds from master,
    # you can get release tarballs instead
    # if you want to build from a specific tag/release
    cd barrier
    ./clean_build.sh
    cd build
    sudo make install  # installs to /usr/local/ 
    barrier

```