---
layout: default
author: liuning0820
tags: [jenkins]
title: Jenkins Pipeline Email Notification
---

# Labs: Jenkins Pipeline Email Notification

Assume the Jenkins Server URL is <http://192.168.0.1:8080>.

## Configure Email Notification

Navigate to {jenkins-server-url}/configure and scroll down to "E-mail Notification".

![Email SMTP Setting]({{ site.url }}{{site.baseurl}}/images/jenkins-configure-system--email-smtp.png){:height="80%" width="80%"}

### Troubleshooting

- Unable to send mail through **smtp.gmail.com**
  > SMTPAuthenticationError: Username and Password not accepted
  >
  > Solution: Go to <https://myaccount.google.com/security> and enable "Access for less secure apps".(启用安全性较低的应用的访问权限)

- Unable to receive email
  > Error sending to the following VALID addresses
  >
  > Received the email when manually trigger in the Jenkins, but failed in pipeline script.
  >
  > Solution:You should set SMTP Server and Authentication in both E-mail Notification and Extended E-mail Notification sections at "Jenkins's URL" configure.

## Pipeline Syntax to send email

```groovy

  post {
      unsuccessful {
            echo 'Pipeline is unsuccessful!'
            emailext(subject: "Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' ",
            body: "Job '<${env.BUILD_URL}>' Unsuccessful.",
            from: '******@gmail.com',to: '******@outlook.com')
      }

      always {
            echo 'Pipeline Completed!'
      }

}

```
