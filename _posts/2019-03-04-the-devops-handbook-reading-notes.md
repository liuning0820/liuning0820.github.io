---
layout: post
author: liuning0820
tags: [devops, book]
---

# Reading Notes: The DevOps Handbook

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
* **Little** fish learn to be big fish in **little** ponds.

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
* Put back environment specific change into version control.
* Manual changes to the production environment are no longer allowed. The only way production changes can be made is to put the changes into version control.
* CD to rebuild instead of repairing application using pipeline.

### Chapter 10 - Enable Fast and Reliable Automated Testing

* Test Pyramid
* Integrate performance testing into our test suit

### Chapter 12 - Automate and Enable Low-Risk Releases

* Deployment vs Release

Deployment is the installation of a specified version of software to a given environment (for example, deploying code into an integration test environment or deploying code into production). Specifically, a deployment may or may not be associated with a release of a feature to customers.

Release is when we make a feature (or set of features) available to all our customers or a segment of customers (for example, we enable the feature to be used by 5% of our customer base). Our code and environments should be built in such a way that the release of functionality does not require changing our application code.

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
  "Any successful product or organization will necessarily evolve over its life cycle."
  * strangler pattern

## STEP TWO: Feedback

### Chapter 14 - Create Telemetry to Enable Seeing and Solving Problems

### Chapter 16 - Enable Feedback So Development and Operations Can Safely Deploy Code

* continuously improvement by small but frequent change sets. 增量迭代改进，持续小步前行
* contextual inquiry & customer observation 情景访谈 & 客户体验观察

### Chapter 17: Integrate Hypothesis-Driven Development and A/B Testing into Our Daily Work

Techniques such as hypothesis-driven development, defining and measuring out customer acquisition funnel （客户获取渠道）, and A/B testing allow us to perform user-experiments safely and easily, enabling us to unleash creativity and innovation, and create organizational learning.

* Two major marketing strategies:
  * Direct response marketing 直效营销
    * email
    * phone call
    * postcard
  * Mass marketing or brand marketing 大众营销或叫品牌营销
    * advertisement

A/B testing techniques were pioneered in direct response marketing. A/B 测试在直效营销中率先使用的。

### Chapter 18 - Create Review and Coordination Processes to Increase Quality of Our Current Work

* Pull Request

  Pull request are the mechanism that lets engineers tell others about changes they have pushed to a repository on GitHub. Once a pull request is sent, interested parties can **review** the set of changes, discuss potential modifications, and even push follow-up commits if necessary.

  It shifts our reliance away from periodic review,inspections and approvals from review board, and moving to integrated peer review performed continually as a part of our daily work. 将摆脱对评审委员会定期评审、审核和审批的依赖，用不间断的同行间评审取而代之。

  * Small batch sizes of each PR also applies to code reviews.

    "Ask a programmer to review ten lines of code, he’ll find ten issues. Ask him to do five hundred lines, and he’ll say it looks good."

## STEP THREE: Continual Learning And Experimentation

### Chapter 19: Enable and Inject Learning into Daily Work

#### ESTABLISH A JUST, LEARNING CULTURE

The only sustainable competitive advantage is an organization’s ability to learn faster than the competition.

* Blameless postmortem
* Controlled introduction of failures into production to create opportunities to practice. Injecting faults into the production environment (such as Chaos Monkey) is one way we can increase our resilience.
* Game Day 演练日

### Chapter 20: Convert Local Discoveries into Global Improvements

Propagation of expertise and knowledge to rapidly enable and accumulate organizational learning.

* ChatOps Tools: Use persistent chat room tools, such as Hubot, Slack, and MS Team. Instead of Lync and Outlook which are not broadly persisted.
* Create a single, shared source code repository for entire organization.
* Encourage experimentation. "buoys, not boundaries.”

   Instead of drawing hard boundaries that everyone has to stay within, we put buoys that indicate deep areas of the channel where you’re safe and supported. You can go past the buoys as long as you follow the organizational principles. After all, how are we ever going to see the next innovation that helps us win if we’re not exploring and testing at the edges? As leaders, we need to navigate the channel, mark the channel, and allow people to explore past it.

### Chapter 23 - Protecting the Deployment Pipeline

* Reduce reliance on separation of duty

减少对职责分离的依赖，比如我们作为开发人员登陆不了Production 服务器，无法获取Web服务器IIS的Logs, 其实减少了我们可以获得的产品运行时的反馈，妨碍了我们对质量，性能的负责。
