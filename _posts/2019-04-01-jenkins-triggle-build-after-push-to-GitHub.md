---
layout: default
title: "Labs: GitHub Push触发Jenkins自动构建"
author: liuning0820
tags: [jenkins]
---

# Labs: GitHub Push触发Jenkins自动构建

## GitHub上配置Jenkins的webhook地址

- Step 1: 假设Jenkins所在服务器的地址是：192.168.0.1，端口为8080，那么webhook地址就是[webhook](http://192.168.0.1:8080/github-webhook/)

- Step 2: GitHub -> Settings -> Webhooks -> Add webhook and fill Payload URL with the webhook address in step 1.

### Troubleshoot

- Error: We couldn’t deliver this payload: Failure when receiving data from the peer.
  > Make sure the port of the Jenkins Server allow the inbound from GitHub. If the Jenkins Server is hosted in Azure VM, define an inbound port rule to allow traffic from GitHub Server.

## Generate Personal Access Token

当Jenkins 接收到来之GitHub的webhook 的通知后，Jenkins需要访问GitHub repository的时候，有的操作是需要授权的，所以我们要在GitHub上生成授权的token给Jenkins使用，这就是Personal access tokens.

- [Create personal access tokens](https://github.com/settings/tokens/new)
- Select scopes： "repo" and "admin:repo_hook"

## Jenkins配置

- [Manage Jenkins->Configure System -> Add GitHub Server](http://192.168.0.1:8080/configure)
- Fill ["API URL"](https://api.github.com), "Credentials" Choose "Add"

    ![Add GitHub Server]({{ site.url }}{{site.baseurl}}/images/jenkins-add-github-server.jpg)

- In The pop up form，"Kind" Choose ”Secret text”，”Secret”填入前面在GitHub上生成的Personal access tokens.

- 填写完毕后，点击Configure System页面中右侧的”Test connection”按钮.
