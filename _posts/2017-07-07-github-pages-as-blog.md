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

First, add images under folder ./images
then from your post reference the images by using {{ site.url }}{{site.baseurl}}/images/xxx
for example:
![DescriptionOfImg]({{ site.url }}{{site.baseurl}}/images/75a475234e7b95eb7d2ee7b3f3552c78.png)

### Google Analytics setup

I Reference [Google Analytics setup for Jekyll](https://michaelsoolee.com/google-analytics-jekyll/) to setup
Google Analytics for my blog.

Another useful link [使用Google Analytics监控GitHub Pages访问流量](https://letianfeng.github.io/github/2018/05/27/github_pages_and_google_analytics.html)

After the setup, you can nativgate [Google Analytics Portal](https://analytics.google.com/analytics/web) to see the usage analytics of your website.

### 添加Disqus评论系统

- Sign up new [disqus profile](https://disqus.com/profile/signup/)
- Install [Disqus](https://disqus.com/admin/create/) on my site. Give a Website name where to install disqus. And follow the UI Instruction to complete the intallation and setup.
- Open _config.yml, 修改comment下面的disqus的值为自己上一步填的Website Name.

```yml

# Comment 这是disqus的评论系统
comment:
    disqus: liuning0820
```

You can see [comments analytics](https://liuning0820.disqus.com/admin/analytics/comments) for your github page site.

### Troubleshooting

对于中文的支持必须是utf-8 编码，在visual studio里直接写中文，貌似不是utf-8的编码，用文本编辑器打开发现是乱码， 然后用
bundle exec jekyll serve 本地启动发现报错。

<!-- Navigation -->
[Previous]({{ site.baseurl }}{% post_url 2017-07-06-team-management-bystander-effect %})