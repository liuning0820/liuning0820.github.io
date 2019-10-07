---
layout: default
author: 对刘谈心
comments: true
title: "GitHub Pages 中嵌入视频"
---

# GitHub Pages 中嵌入视频

读书需要静气，在匆忙的现代生活中，也许流媒体，短视频更能利用和抓住用户的碎片化时间。

所以我也尝试在我的博客中，插入一些视频。

<! --more-- >

作为开篇，下面是一个练习的示例。后续需要考虑这些个视频如何托管。

## 直接使用HTML 5 video tag

<video width="560" height="315" src="http://media.w3.org/2010/05/sintel/trailer.mp4" controls="controls" poster="http://media.w3.org/2010/05/sintel/poster.png">
your browser does not support the  HTML5 Video element
</video>

## Inline Frame 优酷

<iframe width="560" height="315" src="http://player.youku.com/embed/XNjk4MzE4MTg4" frameborder="0" allowfullscreen></iframe>

## Inline Frame B站

<iframe width="560" height="315" src="//player.bilibili.com/player.html?aid=29819774&cid=51915240&page=1" 
frameborder="0" allowfullscreen></iframe>

## Inline Frame YouTube

<iframe width="560" height="315" src="https://www.youtube.com/embed/P1QE8ZPwsgc" frameborder="0" allowfullscreen></iframe>
