# Project Blueprint

**用 AI 从 0 搭项目的通用 Agent Skill（立项引导 Harness）**

本仓库**不包含任何业务代码**。它是 **project-intake** Skill 的源码库：流程文档、模板、安装脚本。

## 解决什么问题

- 不知道先问什么、后问什么
- 单体还是微服务没有决策框架
- AI 一次生成整套代码，后面难维护
- 还要先打开 meta 仓库、手动指定项目路径

目标：**固定流程、可变技术栈、用户有最终决定权**；**安装 Skill 后在任意工作区即可立项**，路径默认自动推断。

## 快速开始

### 1. 安装 Skill

```bash
git clone git@github.com:szyilin/projectblueprint.git
cd projectblueprint
chmod +x scripts/*.sh

export AGENT_SKILLS_DIR="$HOME/skills"   # 改为你 Agent 的 Skills 目录
./scripts/install-skill.sh
```

也可手动复制 `skill/` 到 Skills 目录，详见 [skill/INSTALL.md](skill/INSTALL.md)。

安装后**新开一次 Agent 会话**使 Skill 生效。

### 2. 在任意项目中使用

对 AI 说：

> 我要从零开始做一个 XXX 项目，请按 Project Blueprint 引导我。

Agent 应加载 **project-intake** Skill，按流程提问（**一次一问**），自动创建项目目录，立项批准后再脚手架。

### 3. 维护本仓库（贡献者）

```bash
# 改 docs/ 或 templates/ 后同步到 skill/ 包
./scripts/sync-skill.sh
```

## 仓库结构

| 路径 | 用途 |
|------|------|
| [`skill/`](skill/) | **可安装的 Skill 包**（`SKILL.md` + `reference/` + `templates/`） |
| [`skill/INSTALL.md`](skill/INSTALL.md) | 各 Agent 通用安装说明 |
| [`docs/`](docs/) | 流程真源（人类 PR review）；同步进 `skill/reference/` |
| [`templates/`](templates/) | 新项目文档模板；同步进 `skill/templates/` |
| [`scripts/`](scripts/) | `sync-skill.sh`、`install-skill.sh` |

## 文档地图

| 文档 | 用途 |
|------|------|
| [docs/REPOSITORY-DESIGN.md](docs/REPOSITORY-DESIGN.md) | 仓库与 Skill 设计说明 |
| [docs/INTAKE.md](docs/INTAKE.md) | 立项流程与问题顺序 |
| [docs/DECISION-GUIDE.md](docs/DECISION-GUIDE.md) | 技术栈推荐原则 |
| [docs/PHASES.md](docs/PHASES.md) | 脚手架标准阶段 |
| [docs/ANTI-PATTERNS.md](docs/ANTI-PATTERNS.md) | 常见弯路 |
| [docs/stacks/](docs/stacks/) | 各技术域加速问卷 |

## 这个仓库是什么 / 不是什么

| 是 | 不是 |
|----|------|
| 通用 Agent Skill 源码 + 流程真源 | 可直接运行的业务应用 |
| 标准立项阶段与决策框架 | 某语言/框架的官方模板库 |
| 产出物模板 | 「必须用某某框架」的硬性清单 |

## 许可证

MIT（待定，正式开源前可调整）
