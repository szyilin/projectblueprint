# 标准项目阶段

立项批准（INTAKE Phase 5 完成）之后，按本文件分阶段执行。  
**每阶段结束须通过验证门禁**，再进入下一阶段。

---

## 阶段总览

| 阶段 | 名称 | 产出 | 典型验证 |
|------|------|------|----------|
| 1 | 仓库初始化 | 空仓库 + README + .gitignore | 目录存在、git init |
| 2 | Harness 注入 | AGENTS.md + docs/product + docs/ARCHITECTURE | 文件齐全 |
| 3 | 构建骨架 | 官方脚手架生成的构建文件 | compile / install 成功 |
| 4 | 运行骨架 | 可启动的最小入口（health/hello） | run 成功或 test 绿 |
| 5 | 首里程碑 | 契约中 MVP 的**一小部分** | 按 plans/00 验收 |

**禁止**：在阶段 3 之前写业务逻辑；在阶段 5 之前声称「V1 完成」。

---

## 阶段 1 — 仓库初始化

- [ ] 在用户指定路径创建目录
- [ ] `git init`
- [ ] 添加 `.gitignore`（按语言选官方/主流模板）
- [ ] `README.md`：一句话产品描述 + 如何构建（占位可后补）

---

## 阶段 2 — Harness 注入

从 [`templates/`](../templates/) 复制并填好：

- [ ] `AGENTS.md`
- [ ] `docs/product/CONTRACT.md`
- [ ] `docs/ARCHITECTURE.md`
- [ ] `docs/plans/00-first-milestone.md`

新项目 AGENTS.md 必须包含：

- 构建 / 测试 / 运行命令
- 文档阅读顺序
- 当前阶段（如「阶段 3：构建骨架」）
- 封闭变量（包名、API 前缀等 —— 立项时定）

---

## 阶段 3 — 构建骨架

**规则：只用官方 CLI / 官方模板 / 成熟 starter**

| 域 | 原则（具体命令由 AI 查当前文档，写入新项目 AGENTS.md） |
|----|--------------------------------------------------------|
| Java | Spring Initializr / Maven archetype；多模块时复制已验证 parent 模式 |
| Python | `uv init` / `poetry new`；依赖写入 pyproject |
| Node | `npm create vite@latest` 等官方 create 命令 |
| 前端 UI | 优先官方 dashboard 模板，再集成组件库 |

- [ ] 构建文件由工具生成，AI 只改**必要**配置
- [ ] 验证：`compile` / `build` / `sync` 通过

---

## 阶段 4 — 运行骨架

- [ ] 最小可运行入口（如 Spring `@SpringBootApplication` + `/health`）
- [ ] 或 CLI `--help` / 单测 placeholder 通过
- [ ] 验证命令写入 AGENTS.md 并**实际执行通过**

---

## 阶段 5 — 第一个里程碑

范围来自 `docs/plans/00-first-milestone.md`：

- **≤10 条任务**
- **可在 1～3 次 AI 会话内完成**
- 完成后用户应能**演示或运行**契约中 MVP 的一条核心能力

示例（Java API）：

```text
1. 统一 API 响应格式
2. 健康检查端点
3. 一个示例 CRUD 或登录占位
4. 一条集成测试
```

示例（Python LLM）：

```text
1. FastAPI 骨架 + /health
2. 调用一种 LLM API 的 echo 接口
3. 环境变量配置 .env.example
4. pytest smoke
```

---

## 阶段演进（第一版之后）

首里程碑完成后，后续工作建议：

- 大功能 → 独立 plan 文件（`docs/plans/01-xxx.md`）
- 行为规格 → 可选引入 OpenSpec 或类似 change 流程
- 架构变更 → 更新 ARCHITECTURE.md + 可选 ADR（`docs/decisions/`）

本 Blueprint **不强制** OpenSpec；用户项目可自选。

---

## 验证纪律

AI 声称某阶段完成时，必须：

1. 在新项目目录执行 AGENTS.md 中的命令
2. 依据**终端输出**判断成功/失败
3. 失败则修复，不得口头声称通过
