---
layout: default
title: "jenkins-area-meetup-shanghai-note"
author: liuning0820
comments: true
---

## 准备材料

不久之前受朋友推荐来Jenkins Area Meetup 上海站作为演讲嘉宾来做一点分享。想想自己从Hudson时代就开始做CI/CD，总觉得有些东西可以答应，便爽快的答应了。

但是选题的时候自己还是有点犯难了，这些年DevOps发展的很迅速，各种平台，工具层出不穷，各大公司的人才建设这方面也很进行的如火如荼。经过一番考虑，觉得DevOps

运动其实还是想消除一些软件开发到交付当中的一些壁垒，包括人与人之间的沟通的壁垒，程序交付过程中的技术壁垒，如何能快速有效的建立一种流水线一样的FLow，并且带有反馈机制，使产品持续有效的进行迭代，这是DevOps核心的要解决的问题。

围绕这个，我很快想到可以跟大家聊聊消除壁垒的一个手段， Everything as Code.

展开来讲，我列了两点比较简单但是可以很容易被采用的：

- Infrastructure as Code
- Documentation as Code

## 演讲后

已经有很多年没有登台了，讲的过程还是有点紧，节奏放的不够缓, 但是还是希望听众能够建立这样的一种Mindset, Everything as Code，只要您记住了这句话，并且能够
在你后续的工作中尝试各种具体的实践，我觉得今天的半小时就没浪费。
演讲的Note我已经上传到[这里](https://liuning0820.github.io/ex_presentations/2019-06_jenkins_area_meetup/), 大家根据里面的一些关键字，进行更深入的研究和实践，也欢迎下方留言区交流或者你也可以[这里](https://github.com/liuning0820/liuning0820.github.io/issues/new)提issue进行交流。

## 作为听众

作为听众，我也从别的嘉宾那些Get到一些点，当然也和坐我身旁的美女进行了一番技术交流，具体点如下：

- DevOps的平台工具层出不穷，把握住你要解决的问题。 Principles > Practices > Tools; Mindset > Skillset > Toolset
- 测试金字塔是各大公司里做的最不理想的（也许还有下次，我可以分享分享这个点）
- Jenkins X 自建 K8s集群进行金丝雀部署，并通过一些开源监控工具进行状态监测，来自动进行rollout 或者rollback
- DevOps人才难招
- 如何解决数据库脚本的自动升级和回滚是自动化部署工具中的一大难题
- [Carlos Sanchez](https://carlossg.github.io/presentations/2019-06_jam_shanghai_beijing)
- [Carlos Sanchez@Github](https://github.com/carlossg)
