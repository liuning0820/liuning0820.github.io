---
layout: default
title: "Labs: Pipeline with Dockerfile running in the Agent"
author: liuning0820
tags: [ci]
---

# Labs: Pipeline with Dockerfile to run in the Agent Node

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

## Slave Agent Node With docker installed

For my case, I have Jenkins running as a container in an Azure Ubuntu Linux VM， so in the VM host I already have Docker installed.
So I specify the VM host as a slave agent node to the Jenkins (192.168.1.1:8080).

- Go to Jenkins-> Manage Jenkins-> [Manage Node](http://192.168.1.1:8080/computer/new) and give the node a named "docker-agent"
- Configure as below and Save.

    ![Add Node]({{ site.url }}{{site.baseurl}}/images/jenkins-add-slave-agent.jpg){:height="100%" width="100%"}

- Check the Node [Log](http://192.168.1.1:8080/computer/docker-agent/log) to make sure the agent connected.

Notes: during my setting up, the log remind me to have Java installed in the agent(the Azure VM host).
