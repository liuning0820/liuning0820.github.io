---
layout: post
author: liuning0820
tags: [ai]
comments: true
---

# Public Ollama Models 2025-07-05

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
| 222.70.88.44 | qwen3:8b<br>deepseek-r1:8b<br>deepseek-r1:7b<br>qwen3:30b-a3b<br>nomic-embed-text:latest<br>bge-m3:latest |
| 117.50.179.196 | smollm2:135m<br>hf.co/IlyaGusev/saiga_nemo_12b_gguf:Q5_K_M |
| 117.50.197.100 | qwen2.5:7b<br>bge-m3:567m<br>qwen2.5vl:7b |
| 117.50.164.136 | qwen3:1.7b<br>nomic-embed-text:v1.5<br>qwen3:4b<br>llama3.2:3b-instruct-q5_K_M |
| 106.14.202.11 | mxbai-embed-large:latest |
| 163.228.156.198 | qwen3:8b-nothink<br>qwen3:8b<br>deepseek-r1:8b<br>qwen2.5:32b<br>qwen2.5-coder:7b<br>Qwen2.5-7B-Instruct-Distill-ds-r1-110k:latest<br>Qwen2.5-7B-Instruct:7b<br>Qwen2.5-7B-Distill-ds-r1-110k:7b<br>qwq:latest<br>smollm2:135m<br>qwen2.5:3B-Trained<br>deepseek-r1:32b<br>deepseek-r1:14b<br>llava:latest<br>nomic-embed-text:latest<br>qwen2.5:latest<br>deepseek-r1:7b |
| 218.1.151.175 | smollm2:135m<br>nomic-embed-text:latest<br>qwen2.5:latest |
| 218.78.108.171 | deepseek-r1:14b<br>deepseek-r1:7b<br>deepseek-r1:1.5b |
| 117.50.245.70 | smollm2:135m<br>qwen2.5:32b<br>qwen2.5:7b<br>gemma2:27b<br>gemma2:2b<br>qwen2.5:14b<br>deepseek-r1:14b<br>deepseek-r1:7b<br>gemma3:4b<br>nomic-embed-text:latest<br>deepseek-r1:1.5b<br>gemma3:12b<br>gemma3:27b<br>qwen2.5-coder:latest<br>unsloth.F16.gguf:latest<br>unsloth.Q8_0.gguf:latest |
| 117.50.194.3 | dengcao/Qwen3-Embedding-8B:Q5_K_M<br>dengcao/Qwen3-Embedding-4B:Q5_K_M |
| 61.165.183.106 | huihui_ai/deepseek-r1-abliterated:70b-llama-distill-q8_0 |
| 124.71.154.35 | llama3.2:3b-instruct-q5_K_M<br>deepseek-r1:1.5b<br>nomic-embed-text:latest |
| 117.50.174.178 | smollm2:135m<br>qwen2.5:7b<br>deepseek-r1:8b |
| 117.50.175.121 | changji_medical_deepseek_r1:14b<br>changji_medical_deepseek_r1:32b |
| 101.132.102.117 | smollm2:135m<br>bge-m3:567m<br>deepseek-r1:1.5b |
| 117.50.250.245 | qwen3:8b_nothink<br>qwen3:8b |
| 143.64.160.92 | llama3.2:3b-instruct-q5_K_M<br>MartinRizzo/Ayla-Light-v2:12b-q4_K_M |
| 58.246.1.174 | llama3.2:3b-instruct-q5_K_M<br>qwen2.5:32b |
| 61.172.167.153 | deepseek-r1:7b |
| 61.172.167.211 | deepseek-r1:7b |
| 61.169.115.204 | nomic-embed-text:latest<br>deepseek-r1:32b |
| 47.116.202.9 | qwen3-no-think:latest<br>qwen3:latest<br>qwen3:8b<br>qwen:7b<br>llava:latest<br>mistral:7b-instruct<br>nomic-embed-text:latest<br>qllama/bge-reranker-v2-m3:latest<br>bge-large:latest<br>deepseek-r1:7b<br>bge-m3:latest<br>deepseek-r1:latest<br>deepseek-r1:1.5b<br>qwen2:latest |
| 223.166.95.229 | deepseek-r1:7b<br>deepseek-r1:14b<br>deepseek-r1:8b<br>qwen3:latest<br>qwen3:14b<br>qwen2.5vl:32b<br>qwen2.5vl:latest<br>qwen3:8b<br>gemma3:12b<br>gemma3:27b<br>llava:34b<br>llava:13b<br>mxbai-embed-large:latest<br>nomic-embed-text:latest<br>qwq:latest<br>codellama:13b<br>llama3.2-vision:latest<br>qwen2.5-coder:latest<br>qwen2.5-coder:14b<br>phi4:latest<br>phi3:14b<br>mistral:latest<br>llama3.3:latest<br>llama3.2:latest<br>llama3.1:latest<br>llama3:latest<br>llama3:70b<br>gemma2:latest<br>gemma2:27b |
| 180.158.174.61 | qwq:32b-q8_0<br>qwq:32b-16384context<br>qwq:32b<br>nomic-embed-text:latest<br>deepseek-r1:32b<br>deepseek-r1:14b<br>llama3.2-vision:11b<br>qwen2.5:32b<br>llama3.2:latest |


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
