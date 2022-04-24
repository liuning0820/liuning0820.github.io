# ChatOps With Slack and Mattermost

- [ChatOps With Slack and Mattermost](#chatops-with-slack-and-mattermost)
  - [Subscribe to an RSS feed URL and receive updates in Slack](#subscribe-to-an-rss-feed-url-and-receive-updates-in-slack)
  - [Automate Task](#automate-task)
  - [自助问答](#自助问答)
  - [定时任务](#定时任务)
  - [Mattermost](#mattermost)
    - [Install Mattermost in Ubuntu WSL](#install-mattermost-in-ubuntu-wsl)
    - [Jenkins Integration](#jenkins-integration)
      - [CR Approve](#cr-approve)
  - [Mattermost WebHook](#mattermost-webhook)
    - [GitHub Action to send PR notification to Mattermost](#github-action-to-send-pr-notification-to-mattermost)
  - [Reference](#reference)


## Subscribe to an RSS feed URL and receive updates in Slack

- Install RSS apps/plugins in the slack
- RSS -> Edit configuration to add your favorite rss feed url.
- Then when there is a post update in the feed site, you will be noticed in slack.

## Automate Task

- 自动触发任务

## 自助问答

## 定时任务

https://github.com/attzonko/mmpy_bot/blob/main/mmpy_bot/plugins/example.py




## Mattermost

### Install Mattermost in Ubuntu WSL



```sh

sudo -u mattermost ./bin/mattermost

```

### Jenkins Integration

通过mattermost 直接触发Jenkins的Job


#### CR Approve

通过restapi 来check 并 approve 对应的CR


## Mattermost WebHook


### GitHub Action to send PR notification to Mattermost

add a file notify.yml under .github/workflows/notify.yml

```yaml

on:
  # Triggers the workflow on push or pull request events but only for the master branch
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  build:
    runs-on: self-hosted

    steps:
    - uses: actions/checkout@v1
    - name: Create the Mattermost Message for Push Event
      if: ${{ github.event_name == 'push'}}
      run: |
        echo "{ \"username\": \"Chido\", \"text\":\"Push on [${{ github.repository }}](${{ github.event.repository.clone_url }}) by ${{ github.actor }}.See [commit list](${{ github.event.compare }}) \"}" > mattermost.json
    - name: Create the Mattermost Message for Pull Request Event
      if: ${{ github.event_name == 'pull_request'}}
      run: |
        echo "{ \"username\": \"Chido\", \"text\":\"${{ github.event.action }} pull request [${{ github.repository }}](${{ github.event.repository.clone_url }}) by ${{ github.actor }}.See [commit list](${{ github.event.pull_request._links.html.href }})\n**Source** : ${{github.head_ref}}\n**Destination** : ${{github.base_ref}} \"}" > mattermost.json
    - uses: actions/action-mattermost-notify@1.1.0
      env:
        MATTERMOST_WEBHOOK_URL: ${{ secrets.MATTERMOST_WEBHOOK_URL }}
        MATTERMOST_CHANNEL: ${{ secrets.MATTERMOST_CHANNEL }}

```


## Reference

https://docs.mattermost.com/deployment/bots.html 

https://forum.mattermost.org/

https://mmpy-bot.readthedocs.io/en/latest/plugins.html