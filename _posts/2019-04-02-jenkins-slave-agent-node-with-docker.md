---
layout: default
author: liuning0820
tags: [jenkins]
title: Docker On Docker
---

# Labs: Pipeline with Dockerfile to run in the Slave Agent Node

Now you have Jenkins installed, If you have a Jenkinsfile try to run stage in a dedicated docker container instance, You have two options to resolve the dependency to docker.

```groovy

 pipeline {
        //  agent  any

    stages {
        stage('Spell Check') {
                agent {
                    dockerfile {
                        filename 'Dockerfile.mdspell'
                        args '-u="root"'
                        }
                }
        }
    }

 }

```

## Install Docker Within Jenkins Master

## Slave Agent Node With Docker installed

For my case, I have Jenkins running as a Docker container in an Azure Ubuntu Linux VM， so in the VM host I already have Docker installed. But within the container of Jenkins, the docker is not installed.

So I specify another VM host with Docker installed as a slave agent node to the Jenkins Master host (192.168.1.1:8080). The Jenkins Master will assign pipeline jobs to the slave agent node to run.

- Go to Jenkins-> Manage Jenkins-> Manage Node {Your-Jenkins-Root-URL}/computer/new and give the node a named "docker-agent"
- Configure as below and Save.

    ![Add Node]({{ site.url }}{{site.baseurl}}/images/jenkins-add-slave-agent.jpg){:height="100%" width="100%"}

- Check the Node Log {Your-Jenkins-Root-URL}/computer/docker-agent/log to make sure the agent connected.

Notes: during my setting up, the log remind me to install Java in the slave agent node.

```sh

sudo apt install openjdk-8-jdk


```
