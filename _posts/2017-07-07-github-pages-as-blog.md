---
layout: default
title: "github-pages as blog"
date: 2017-07-07
comments: true
categories:
---

# GitHub Pages Guide

Follow the guide at [GitHub Pages](https://pages.github.com/) to set up GitHub Pages as the personal blog.
Next step is to investigate how to generate RSS support.

http://jmcglone.com/guides/github-pages/
http://www.pchou.info/ssgithubPage/2013-01-05-build-github-blog-page-02.html
http://www.pchou.info/ssgithubPage/2014-07-04-build-github-blog-page-08.html

## jekyll Guide

http://jekyll.com.cn/docs/structure/

http://jekyllrb.com/docs/structure/

### Add images into the page

first put images under folder ./images
then from your post reference the images by using {{ site.url }}{{site.baseurl}}/images/xxx
for example:
![DescriptionOfImg]({{ site.url }}{{site.baseurl}}/images/75a475234e7b95eb7d2ee7b3f3552c78.png)

### Troubleshooting

对于中文的支持必须是utf-8 编码，在visual studio里直接写中文，貌似不是utf-8的编码，用文本编辑器打开发现是乱码， 然后用
bundle exec jekyll serve 本地启动发现报错。

<!-- Navigation -->
[Previous]({{ site.baseurl }}{% post_url 2016-07-13-first-blog %})