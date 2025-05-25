---
layout: post
author: liuning0820
tags: [ai]
comments: true
---

# Public Ollama Models 20250525

## How to chat with Ollama models

Select an IP and model from the table below, then use them in this command:

```bash
# Start a conversation with a model
# Replace <IP> with an IP from the table below
# Replace <MODEL> with one of the models listed for that IP
curl -X POST http://<IP>:11434/api/chat -d '{
    "model": "<MODEL>",
    "messages": [{
        "role": "user",
        "content": "Hello, how are you?"
    }]
}'
```

## Available Models

| IP | Models |
|-----|--------|
| 123.60.64.205 | llama3.2:3b-instruct-q5_K_M,deepseek-r1:1.5b |
| 101.132.74.29 | llama3.2:3b-instruct-q5_K_M |
| 139.196.196.43 | qwen3:32b,qwen3:30b-a3b,qwen2.5:72b-instruct,deepseek-r1:70b |
| 223.166.61.66 | qwen3:4b,qwen3:32b,mxbai-embed-large:latest,bge-m3:latest,nomic-embed-text:latest,qwen2.5-coder:32b,qwen2.5-coder:14b,qwen2.5:32b,qwen2.5:latest,mistral-small3.1:latest,codellama:13b,codellama:34b,codellama:70b,qwq:latest,deepseek-v2:16b,deepseek-coder-v2:latest,gemma3:12b,gemma3:latest,qwen2.5:3b,gemma3:1b,deepseek-r1:14b,deepseek-r1:32b,deepseek-r1:8b,deepseek-r1:7b,deepseek-r1:1.5b |
| 106.75.235.214 | llama3.1:8b,gemma3:27b,qwq:latest,deepseek-r1:70b |
| 117.50.171.129 | qwq:latest,qwen2.5-coder:32b |
| 117.50.180.35 | bge-m3:latest |
| 116.232.26.17 | qwen3:0.6b,qwen3:1.7b |
| 117.50.176.34 | qwen2.5:1.5b,qwen2.5:7b,qwen2.5:14b |
| 222.64.131.253 | llama3.2:3b-instruct-q5_K_M,qwen2.5:32b-instruct-q4_K_M,qwq:32b-q4_K_M,qwen2.5:32b,qwen2.5-coder:14b,sqlcoder:15b,deepseek-r1:14b,qwen2.5:14b,bge-m3:567m,qwen2.5:7b,nomic-embed-text:latest,qwen2.5:0.5b |
| 123.60.5.218 | llama3-backup:latest,mario:latest,llama3.2:latest,llama3.2:3b-instruct-q5_K_M,deepseek-r1:8b |
| 218.1.223.134 | llama3.2:3b-instruct-q5_K_M,smollm2:135m,deepseek-r1:1.5b,deepseek-r1:7b,deepseek-r1:8b |
| 101.132.88.19 | nomic-embed-text:latest,llama3.2:3b,llama3.2:1b,deepseek-r1:1.5b |
| 114.95.209.211 | nomic-embed-text:latest,qwen2.5-coder:latest,deepseek-r1:7b |


## Disclaimer

These Ollama model endpoints are publicly exposed interfaces found on the internet. They are listed here for informational purposes only. Please be aware that:

- These endpoints are not maintained or controlled by us
- The availability and stability of these services cannot be guaranteed
- Use these services at your own risk
- We take no responsibility for any issues or damages that may arise from using these endpoints

## 免责声明

本文列出的 Ollama 模型接口均来自互联网上公开暴露的端点。请注意：

- 这些端点并非由我们维护或控制
- 无法保证这些服务的可用性和稳定性
- 使用这些服务需自行承担风险
- 对于使用这些端点可能产生的任何问题或损失，我们不承担任何责任
