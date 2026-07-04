# Project Blueprint — AI 编码说明

> **人类读者请读 [`README.md`](README.md)**。本文档面向维护本 Harness 的 AI 代理。

本仓库是 **project-intake Skill 的源码库**，不是待实现的业务项目。

## 维护者角色

编辑流程 / 模板 / Skill 编排；**不在此仓库写业务代码**。

## 双产物

| 产物 | 路径 | 说明 |
|------|------|------|
| 流程真源 | `docs/`、`templates/` | 人类 PR 在此改 |
| 可安装 Skill | `skill/` | 由 `scripts/sync-skill.sh` 同步 |

改 `docs/` 或 `skill/SKILL.md` 后 **必须** 运行 `./scripts/sync-skill.sh`。

## 用户如何使用（告知用户）

见 [skill/INSTALL.md](skill/INSTALL.md)。安装后在**任意工作区**对 AI 说「从零做一个 XXX 项目」即可；不必打开本仓库。

## Skill 入口

编排：[ `skill/SKILL.md` ](skill/SKILL.md)

## 硬约束（Harness 自身）

- 改流程 → 改 `docs/`，同步 `skill/SKILL.md` checklist，跑 `sync-skill.sh`
- 新增 stack profile → `docs/stacks/<name>/` 三文件 + sync
- Skill 与文档**不得绑定**特定 AI 工具或 IDE；保持 `AGENTS.md` 精简（<150 行）

## 验证

改 Skill 或 INTAKE 后，假想试跑：空目录立项、meta 仓库内立项，确认 AI 不默认必问路径、不跳批准点。
