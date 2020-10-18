---
layout: default
author: liuning0820
tags: [tools]
title: 玩转tiny tiny RSS
---

# Still RSS?

我是windows 下的**FeedDemon** 的忠实用户，甚至在FeedDemon 的开发者放弃开发它几年后，我还一直用着它。

可如今我更多的是在MacOS 和 Linux下玩耍，需要一个替代品了。

<! --more-- >


Update: [NetNewsWire](https://ranchero.com/netnewswire/ "NetNewsWire is a free and open source RSS reader for Mac and iOS.")

## Why not Feedly or lnoreader?

Free limited, Pro version need to pay. 

## Tiny Tiny RSS: Open Source + 自己动手

Follow <https://git.tt-rss.org/fox/ttrss-docker-compose> and installed my Tiny Tiny RSS on Cloud VM.

```bash

git clone https://git.tt-rss.org/fox/ttrss-docker-compose.git ttrss-docker

cd ttrss-docker

docker-compose up --build -d


```

