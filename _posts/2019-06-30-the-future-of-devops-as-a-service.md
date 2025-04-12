---
layout: default
author: liuning0820
tags: [devops]
title: "DevOps的未来: 开发运维即服务"
comments: true
---
# DevOps的未来: 开发运维即服务

DevOps这两年在各个公司中如火如荼，但是DevOps 终将成为几个大厂的服务。

<! --more-- >

## Trend of DevOps

Shadow DevOps >> Enterprise DevOps >> DevOps As a Service

大约8年前，我开始使用Hudson和 Cruise Control等工具进行一些持续集成，以此在自己的项目中实现一些自动化让项目更加高效的运行，最初的一个收益，就是
CI工具能够及时从SVN中央服务器定时获取代码进行编译，来防止项目中有人员因为漏签入代码造成的Break Build. 当然后续我们也为我们的持续集成工具中引入了Code Style Check, 单元测试，DEV以及SIT环境的代码发布和自动安装，Health Check，甚至包括自动回滚。 这一时期，我们做的事情，还局限在具体项目中，我们称之为Shadow DevOps 时代。

5年前，整个企业包括高层（C level）的领导，看到业界有些企业开始搞DevOps, 大多是围绕Jenkins， GitHub，和自动化脚本工具（比如Ansible），于是各个企业内部也开始专门组建团建建立Central的DevOps平台。各个项目组，把自己的项目接入到这个公共平台来做持续集成。

此时一个新的项目需要一个新的插件进行构建，DevOps中央团队就会在Jenkins端找寻适配的插件预安装到Jenkins平台，来让这个项目能够接入进来。

这几年来，容器化发展，各种DevOps的工具层出不穷，各大企业纷纷构建出了企业级的DevOps平台来完成CI/CD。 我们称之为 Enterprise DevOps 时代。
这里开始会有很多开销，比如各种环境的云资源的申请和闲置，比如海量管理软件包的存储仓库的开销等。

![DevOps Pipeline]({{ site.url }}{{site.baseurl}}/images/devops-pipeline.jpg)

这两年，一些个龙头企业，包括微软，亚马逊整合了自己Cloud 服务方面的各方面的能力，推出了DevOps 服务。一些中小企业，以后完全没有必要自建DevOps平台，直接SRE团队对接这些DevOps服务。我赞同这可能是趋势，以后你看着服务的账单，服务方也会给你一些报告建议，如何节约不必要的浪费。

![Azure DevOps]({{ site.url }}{{site.baseurl}}/images/azure-devops.jpg){:height="70%" width="70%"}

## 作为从业者的思考

作为软件从业者，你可以是你企业内SRE团队的一员，负责使用这些DevOps的服务来帮助企业高效运维；或者你还是Focus在软件开发这块，帮助企业构建有竞争力的产品和服务。我个人觉得，还是要**精进开发的能力**。
