# Python LLM — 架构分叉

## 分叉 1：RAG vs Agent vs 纯 Chat

| 形态 | 核心组件 | 第一版建议 |
|------|----------|------------|
| 纯 Chat | API 路由 + prompt 模板 | 最小，先通 |
| RAG |  ingest → chunk → embed → retrieve → generate | 先单文件 PDF 通路 |
| Agent | LLM + tools + 循环 | 先 1～2 个工具，防无限 loop |

## 分叉 2：同步 vs 异步

- FastAPI 异步适合 IO 密集（调 API、读库）
- 简单 demo 可用同步，后续再改

## 分叉 3：状态存储

| 需求 | 选项 |
|------|------|
| 无会话 | 无状态 API |
| 多轮对话 | Redis / SQLite session |
| RAG 文档 | 对象存储 + 向量库 |

## 分叉 4：配置管理

- `.env` + `.env.example`（**禁止** commit 真实 key）
- 模型名、温度、max_tokens 可配置

## 脚手架原则

- ✅ `uv init` / `poetry new` + pyproject
- ✅ FastAPI 官方教程结构
- ❌ 第一版搭 10 个 microservice
- ❌ 未批准就选 LangChain 全全家桶

## 依赖纪律

- 核心：web 框架、SDK、（可选）向量客户端
- 延后：复杂 Agent 框架、多模型路由、微调流水线
