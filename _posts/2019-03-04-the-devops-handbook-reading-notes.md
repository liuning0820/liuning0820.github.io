---
layout: default
title: "Reading Notes: The Devops Handbook"
author: liuning0820
---

# Reading Notes: The Devops Handbook

## Chapter 5 - Selecting Which Value Stream to Start With

* GREENFIELD VS. BROWNFIELD  绿地项目 与 棕地项目
* SYSTEMS OF RECORD AND SYSTEMS OF ENGAGEMENT
  * 记录型系统
    * 强调正确性和稳定性 Do it right
    * 比如一些ERP系统，人力资源系统， 财务报表系统
    * 变化速度慢
  * 交互性系统
    * 强调快速响应和反馈，侧重Do it fast
    * 比如一些电子商务系统
    * 变化速度快
* **Little** fish learn to be big fish in **little** ponds. --- Peter Drucker

## Chapter 7: How to Design Our Organization and Architecture with Conway’s Law in Mind

* Conway’s Law 康威定律

  * Organizations which design systems are constrained to produce designs which are copies of the communication structures of these organizations. --- Melvin Conway(1967) 系统设计受限于组织自身的沟通结构。
  * 康威定律奠定了微服务架构的理论基础
* ORGANIZATIONAL ARCHETYPES
  * Functional-oriented (OPTIMIZING FOR COST)
  * Market-oriented (OPTIMIZING FOR SPEED)
  * 起决定性作用的并不是组织形式，而是人们的行为和反应。
  * 系统的架构应该保证小团队能够独立运作，彼此充分解耦，避免不必要的沟通和协调。

## STEP ONE: Flow

### Chapter 9 - Create the Foundations of Our Deployment Pipeline

* On demand creating consistent production-like environments. (including DEV, TEST, STAGE)
* Put back environemnt specific change into version control.
* Manual changes to the production environment are no longer allowed. The only way production changes can be made is to put the changes into version control.
* CD to rebuild instead of repairing application using pipeline.

### Chapter 10 - Enable Fast and Reliable Automated Testing

* Test Pyramid
* Intergate performance testing into our test suit

### Chapter 12 - Automate and Enable Low-Risk Releases

* Deployment vs Release

Deployment is the installation of a specified version of software to a given environment (e.g., deploying code into an integration test environment or deploying code into production). Specifically, a deployment may or may not be associated with a release of a feature to customers.

Release is when we make a feature (or set of features) available to all our customers or a segment of customers (e.g., we enable the feature to be used by 5% of our customer base). Our code and environments should be architected in such a way that the release of functionality does not require changing our application code.

* Release patterns
  * Environment-based release patterns
  * Application-based release patterns

* Decoupling deployments from releases

  For environment-based release, we can:
  * The Blue-Green Deployment Pattern
  * The Canary Release pattern

  For application-based release, we can:
  * Implement Feature Toggles
  * Dark Launch Process

### Chapter 13: Architect for Low-Risk Releases

* Evolutionary architecture
  "Any successful product or organization will necessarily evolve over its life cycle."  ---- Jez Humble
  * strangler pattern

## STEP TWO: Feedback