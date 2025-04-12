---
layout: default
title: "Container Image Vulnerability Scanner"
author: liuning0820
tags: [jenkins]

---

Scan the vulnerability issues in the docker images using the Jenkins pipeline.

## Installation: Anchore Engine

On the Jenkins Server Host (ex. Azure VM), Install the Anchore Engine

```sh
mkdir ~/aevolume
cd ~/aevolume

docker pull docker.io/anchore/anchore-engine:latest
docker create --name ae docker.io/anchore/anchore-engine:latest
docker cp ae:/docker-compose.yaml ~/aevolume/docker-compose.yaml
docker rm ae

docker-compose pull
docker-compose up -d

# https://github.com/anchore/anchore-engine

```

Optional: Expose the port 8288 to the internet. Then you can access the API at http://{ip}:8228/v1/images

## Installation: Anchore Container Image Scanner Jenkins Plugin

Go to "Manage Jenkins – Manage Plugins," select the "Anchore Container Image Scanner" plugin, and click the "Install without restart" button

Go to "Manage Jenkins – Configure System" and navigate to the "Anchore Plugin Mode" section. Fill in the following fields:

Engine URL: the URL where the Anchore Engine is accessible. You can use the docker inspect command when running Anchore Engine as a Docker container in order to retrieve the IP address (parameter IPAddress in the Networks section).

Engine Username: the Anchore Engine user name. default: admin

Engine Password: the Anchore Engine password. default: foobar

Add a FreeStyle Job, and configure as below:

![Anchore Build Options]({{ site.url }}{{site.baseurl}}/images/jenkins-anchore-image-scan.jpg)

An scanning report can be found at http://{my-jenkins-ip}:8080/job/anchore-test/25/anchore-results/

## Reference Links

[Anchore container image scanner jenkins plugin](https://dzone.com/articles/anchore-container-image-scanner-jenkins-plugin )
