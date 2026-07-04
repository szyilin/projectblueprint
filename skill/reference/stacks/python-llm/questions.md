# Python LLM 应用 — 追加问题

> Intake 通用问题完成后追加。一次一问。

## Q-L1. 应用形态

> 这更像哪种 LLM 应用？

- [ ] Chat 对话（单轮/多轮）
- [ ] RAG（文档问答）
- [ ] Agent（工具调用、多步任务）
- [ ] 批处理（embedding、摘要流水线）
- [ ] API 服务（给别人调用）
- [ ] CLI 工具

## Q-L2. 模型来源

> 模型从哪里来？

- [ ] 仅云端 API（OpenAI、Anthropic、国内大模型 API 等）
- [ ] 仅本地开源模型（Ollama、vLLM 等）
- [ ] 混合（开发 API、生产本地）
- [ ] 尚未确定

## Q-L3. 数据与向量

> 是否需要私有知识库 / 向量检索？

- [ ] 不需要
- [ ] 需要，规模小（单机向量库 / Chroma / FAISS 文件）
- [ ] 需要，规模大（专用向量 DB）
- [ ] 仅对话历史，不做 RAG

## Q-L4. 部署环境

> 运行环境？

- [ ] 本机开发即可
- [ ] Docker 单机
- [ ] 需要 GPU 服务器
- [ ] 无 GPU，必须 CPU 可跑

## Q-L5. 框架偏好

> 对 LangChain、LlamaIndex、纯 SDK 有偏好吗？

无偏好时 AI 给出 2 方案：

- **轻量**：FastAPI + 官方 SDK + 自管 prompt
- **快速迭代**：FastAPI + LangChain/LlamaIndex 之一

**须用户确认**，不默认绑定。

## Q-L6. 合规与密钥

> API Key、文档数据有无合规要求？（内网、不出境等）

记录约束，写入 CONTRACT non-goals 或 ARCHITECTURE 安全节。
