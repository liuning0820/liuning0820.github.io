---
layout: default
title: "use github-pages as blog"
date: 2017-07-07
comments: true
categories:
---

[Previous]({{ site.baseurl }}{% post_url 2016-07-14-second-blog %})

# GitHub Pages Guide

Follow the guide at [github-pages](https://pages.github.com/) to set up github pages as the personal blog.
Next step is to investigate how to generate RSS support.

http://jmcglone.com/guides/github-pages/
http://www.pchou.info/ssgithubPage/2014-07-04-build-github-blog-page-08.html
http://www.jianshu.com/p/05289a4bc8b2



# Troubleshooting
对于中文的支持必须是utf-8 编码，在visual studio里直接写中文，貌似不是utf-8的编码，用文本编辑器打开发现是乱发， 然后用
bundle exec jekyll serve 本地启动发现报错。