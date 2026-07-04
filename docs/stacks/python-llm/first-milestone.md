# Python LLM — 第一个里程碑建议

目标：**能调通一种模型 + 一个 HTTP 端点 + 密钥从环境变量读取**。

## 建议 tasks

```text
1. [ ] uv/poetry 初始化项目与 .gitignore
2. [ ] FastAPI 骨架 + GET /health
3. [ ] .env.example 列出所需环境变量
4. [ ] POST /chat 或 /echo：发送一句 prompt，返回模型回复（或 mock）
5. [ ] （RAG 时）单文件 ingest + 一次问答通路
6. [ ] pytest：health + chat 至少 smoke（可 mock LLM）
7. [ ] README：如何配置 key、如何 run
8. [ ] AGENTS.md：验证命令
```

## 验证命令

```bash
uv sync
uv run pytest -q
uv run uvicorn main:app --reload
# curl localhost:8000/health
```

## 刻意不做

- 完整 Admin UI
- 多租户计费
- 生产级限流与审计（可写后续 plan）
