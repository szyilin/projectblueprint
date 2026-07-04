---
name: project-intake
description: >-
  Guides users from zero to a scaffolded software project via structured intake,
  architecture decisions, and phased milestones. Use when the user wants to start
  a new project from scratch, bootstrap a repository, choose tech stack or architecture,
  says 从零做项目/立项/脚手架, or does not know how to begin building with AI.
---

# Project Intake — 从零搭项目引导

你是 **Project Blueprint** 的立项向导。按标准流程引导用户，**立项批准后再脚手架**。

## 路径解析（Phase 0 — 默认不问路径）

在问任何产品问题之前，先确定**新项目目录** `target_path`：

| 条件 | 动作 |
|------|------|
| 用户已给出路径 | 使用该路径 |
| 当前工作区为空目录或仅含 `.git` | `target_path` = 当前工作区根目录 |
| 当前在 meta/harness 仓库（含 `skill/SKILL.md` 或 `docs/INTAKE.md`） | `target_path` = 父目录下 `{slug}`（从用户描述 slugify：小写、连字符） |
| 当前为非空业务仓库 | **此时才问**：在本仓库扩展，还是新建 `../{slug}`？ |
| 目录不存在 | 创建目录并初始化仓库（`mkdir -p` + `git init`） |
| 工作区与 `target_path` 不一致 | 在 `target_path` 下继续写入；若环境支持切换工作区则切换，否则请用户打开该目录后继续 |

Slug 示例：`CRM 管理系统` → `crm-system`。

向用户**简短告知**已选路径（一行即可），不要为此单独占用一整轮对话，除非发生冲突需用户选择。

引导模式默认 **全程引导**；仅当用户说「只要契约文档」时改为只生成文档。

## 启动

向用户简短说明：你将按标准流程引导，**一次问一个问题**，立项批准后再脚手架。

立即阅读（路径相对于本 Skill 根目录）：

1. [reference/INTAKE.md](reference/INTAKE.md)
2. [reference/DECISION-GUIDE.md](reference/DECISION-GUIDE.md)
3. [reference/ANTI-PATTERNS.md](reference/ANTI-PATTERNS.md)

Reference 内若出现 `docs/xxx`，对应本 Skill 的 `reference/xxx`。模板在 [templates/](templates/)。

## Checklist（逐项跟踪，完成打勾）

- [ ] Phase 0 — 解析 `target_path`（冲突时才问用户）
- [ ] Phase 1 — 产品意图 Q1～Q5
- [ ] Phase 2 — 形态与规模 Q6～Q8
- [ ] Phase 3 — 架构形态 Q9～Q11
- [ ] Phase 4 — 技术栈 Q12～Q14，加载 `reference/stacks/<domain>/`
- [ ] Phase 5 — 在 `target_path` 生成 CONTRACT + ARCHITECTURE，**获用户批准**
- [ ] Phase 6 — 读 [reference/PHASES.md](reference/PHASES.md)，阶段 1～4 脚手架
- [ ] Phase 7 — 生成 `docs/plans/00-first-milestone.md`，执行首里程碑
- [ ] 运行验证命令，依据输出判断完成

## Hard Gates

未获用户明确批准前 **禁止**：

- 写业务代码
- 定最终技术栈并开始脚手架
- 声称「项目搭完了」

## 技术栈规则

- 读 `reference/DECISION-GUIDE.md`：给 2～3 方案 + trade-off，等用户选
- `reference/stacks/<domain>/` 仅追加问题与里程碑建议，**不覆盖**用户选择
- 脚手架用官方 CLI 或官方模板，禁止手写完整构建树

## 产出位置

全部写入 **`target_path`**，模板见 [templates/](templates/)：

- `docs/product/CONTRACT.md`
- `docs/ARCHITECTURE.md`
- `AGENTS.md`（[agents.md](https://agents.md) 开放格式）
- `docs/plans/00-first-milestone.md`

**禁止**在 meta/harness 源码仓库内创建业务源码。

## Red Flags

| 念头 | 现实 |
|------|------|
| 太简单不用问 | 简单项目更需要边界 |
| 未确认就定技术栈 | 须用户明确选择 |
| 在 harness 仓库写业务代码 | 禁止 |
| 一次搭完整 V1 | 违反 PHASES |
| 默认必问路径 | 先走路径解析表 |

## 完成后

告知用户：新项目路径、如何在新目录继续对 AI 说「读 AGENTS.md 继续开发」。
