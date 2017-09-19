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
http://www.pchou.info/ssgithubPage/2013-01-05-build-github-blog-page-02.html
http://www.pchou.info/ssgithubPage/2014-07-04-build-github-blog-page-08.html
http://www.jianshu.com/p/05289a4bc8b2


#jekyll Guide

http://jekyll.com.cn/docs/structure/

http://jekyllrb.com/docs/structure/

## add images into the page

first put images under folder iluning0820.github.io\images
then from your post reference the images by using http://localhost:4000/liuning0820.github.io/images/xxx
for example:
![](http://localhost:4000/liuning0820.github.io/images/75a475234e7b95eb7d2ee7b3f3552c78.png)

# Troubleshooting
对于中文的支持必须是utf-8 编码，在visual studio里直接写中文，貌似不是utf-8的编码，用文本编辑器打开发现是乱码， 然后用
bundle exec jekyll serve 本地启动发现报错。

