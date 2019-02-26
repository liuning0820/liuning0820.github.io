---
layout: default
title: "Docker Desktop: Drive sharing failed"
author: liuning0820
---

# Docker Desktop: Drive sharing failed

Error: docker.exe: Error response from daemon: Drive sharing failed for an unknown reason

Solution: Computer -> Management -> Local User and Group -> Group

Add the current login user into the Group "Hyper-V Administrators".