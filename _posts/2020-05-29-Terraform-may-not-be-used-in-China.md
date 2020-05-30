---
layout: default
author: liuning0820
tags: [mindset]
title: 是谁说Terraform 在中国将不可用
---

# 是谁说Terraform 在中国将不可用

这两天一条关于Terraform 在中国将不可用的消息在微信公众号里炸锅了：

![突发！ Terrafrom， Consul，Vagrant 等禁止中国使用！]({{ site.url }}{{site.baseurl}}/images/2020-05-30-21-52-43.png){:height="80%" width="80%"}

截图原文地址：<https://mp.weixin.qq.com/s/Bqe0RfPjqZ2nOdWEPb0SDA>

评论区很热闹：
有表示担心的，会不会哪天Jenkins 也禁了啊！ Windows会不会不让用了呢？
有爱国深切者，这样会倒逼国产软件的自强！国人当自强！

至于发文者的目的，不知是忧国忧民，还是鼓吹焦虑，文章的末尾反正是广告时间，敲敲我们的爱国心，该上课了。

![Terraform有多重要，能否代替]({{ site.url }}{{site.baseurl}}/images/2020-05-30-21-57-01.png){:height="80%" width="80%"}

截图原文地址：<https://mp.weixin.qq.com/s/NSRNkIpa7LBjNsFcGV_gbA>

这篇的更好，直接毛遂自荐，彼可取而代也。
爆出消息，推出自家的替代产品。

对于很多人，故事到此就结束了。结合当下美中的紧张关系，只记得有家美国公司也开始报复我们了，我们要支持国产，爱国心又一次被激发。

## 下半场

在HN上，HashiCorp回答了网友的提问，声称完全因为该软件（Vault)触犯了中国的法律，在中国销售是非法行为，全文如下：

这不是一个政治声明。这是一个法律要求。我们在Vault中使用的加密软件受中国出口管制法的限制，我们在中国销售是非法的（根据中国法律）。

为了能够在中国境内销售Vault，我们必须限制在Vault中使用的加密软件必须是政府可以接受的版本。

我们没有这样做，因此我们在中国销售是非法的。我们必须在我们的企业条款中加入这一条。

[HashiCorp条款声明](https://www.hashicorp.com/terms-of-evaluation)

## So What

事情就是这么个事情，一款加密软件受我国法律管制限制，人家不愿意妥协，在条款里说明这款软件的商业版可能国内用不了。

但是这个锅不应该由Hashicorp背，谁也不需要背这个锅，这是法律规定。

可是就是有人利用这个事情，歪曲事实，利用了我们的爱国心。

## Take Away

看客，你我，容易会被忽悠，因为忽悠你的人，忽悠完了，他也不会打脸来自我纠正之前的误解。。

要不想被忽悠，要学会自己刨根问底，追本溯源。了解事情的始末，探寻事实的真相。
