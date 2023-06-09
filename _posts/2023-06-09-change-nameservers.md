---
layout: default
author: liuning0820
tags: [tools]
comments: true
---

# 跨域名服务商切换域名服务器

1. Log in Cloudflare 官网，根据指引点击 *Add Site*, 添加自定义域名 *workforfree.cn*,会自动扫描DNS 解析记录；扫描完成后，Cloudflare 会自动分配两个NS 地址，将这两个地址替换 GoDaddy 上的原地址。
2. Log in to the administrator account for your original domain registrar （GoDaddy）
3. Remove the following nameserver

   ns27.domaincontrol.com

   ns28.domaincontrol.com

4. Add Cloudflare's nameservers
   
   gwen.ns.cloudflare.com
   ian.ns.cloudflare.com

5. Save your changes
Registrars can take 24 hours to process nameserver updates. You will receive an email when your site is active on Cloudflare.

## Reference

[1] <https://blog.csdn.net/yucicheung/article/details/79560027>

[2] <https://dash.cloudflare.com/>