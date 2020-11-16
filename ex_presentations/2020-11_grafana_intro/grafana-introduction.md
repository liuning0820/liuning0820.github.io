
# About Me

Toby Liu

Sr. DevOps Engineer @Tesla

GitHub Page: <https://liuning0820.github.io/>

----

## Grafana Introduction

<!-- ![Dashboard](images/grafana-dashboard-sample.png){:height="80%" width="50%"} -->

<img alt="Grafana Dashboard" width="60%" src="../assets/grafana-dashboard-sample.png" data-src="../assets/grafana-dashboard-sample.png">

----

## Dashboard

Virtualazation and Monitoring

- Dispaly Data
- Trend History
- Monitoring

----

## Alert Rules and Notification

----

## Data Source

### TSDB (time-series database)

The time-series database can be used to analyze the past，monitor now，predict the future.

### Relational Database

- mysql, sqlserver

### AWS CloudWatch

### Mixed Data Source

----

## Plugins

- Trust Plugins and Non-Signed Plugins
- Plugins Type
  - Data Source
  - App
  - Dashboard

----

### WorldPing

[WorldPing](https://worldping.raintank.io/) network performance monitoring and endpoint health check.

```
grafana-cli plugins install raintank-worldping-app
```

<img alt="WorldPing:Network Performance Monitoring" width="50%" src="../assets/worldping.png" data-src="../assets/worldping.png">

----

## Provisioning as Code

- [Data Persistent Strategies](#data-persistent-strategies)
- [CI/CD Pipeline](#ci/cd-pipeline)

----

### Data Persistent Strategies

- Config map
- PV
- External DB

----

### CI/CD Pipeline

devops:monitoring instance intro and how to contribute

----

## User Management

- Org
- Team
- User

----