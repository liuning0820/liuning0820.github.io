---
layout: default
author: liuning0820
tags: [jenkins]
title: Jenkins Pipeline Email Notification
---

# Labs: Jenkins Pipeline Email Notification

Assume the Jenkins url is http://192.168.0.1:8080

## Configure Email Notification

Navigate to {Jenkins's URL}/configure and scroll down to "E-mail Notification".

![Email SMTP Setting]({{ site.url }}{{site.baseurl}}/images/jenkins-configure-system--email-smtp.png){:height="50%" width="70%"}

### Troubleshooting

- Unable to send mail through **smtp.gmail.com**
  > SMTPAuthenticationError: Username and Password not accepted
  >
  > Solution: Go to https://myaccount.google.com/security and enabling "Access for less secure apps".(启用安全性较低的应用的访问权限)

