---
layout: default
title: "Play With Debian"
---

# Play With Debian

Records tools I intalled to play with debian.

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
