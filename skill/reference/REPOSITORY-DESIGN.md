# 仓库设计说明

> 供维护者理解「Project Blueprint 应该长什么样、为什么这样设计」。  
> AI 执行立项时**不必**读本文，除非用户明确要修改 Harness 本身。

## 设计目标

1. **让不懂从 0 搭项目的人**，在 AI 引导下走完标准流程，不走弯路
2. **让有经验的人**，跳过已知的问卷环节，但仍产出统一契约文档
3. **技术栈保持开放** —— 流程固定，框架不固定
4. **跨工具** —— 以可安装 Agent Skill 为主入口，`docs/` 为流程真源

### 决策 5：全局 Skill + 路径自动推断

- 用户**不必**先打开本仓库；将 `skill/` 安装到 Agent 的 Skills 目录（见 `skill/INSTALL.md`）
- Phase 0 **默认推断** `target_path`（空目录 / meta 仓库 / 用户已给路径）；仅非空业务仓库时才问
- 目录不存在时 `mkdir -p` + `git init`；工作区不一致时写入目标路径或请用户切换工作区

## 核心设计决策

### 决策 1：流程固定，技术栈 AI 辅助 + 用户拍板

| 维度 | 谁负责 | 说明 |
|------|--------|------|
| 先问什么、后问什么 | **本仓库**（`INTAKE.md`） | 流程是 Harness 的核心价值 |
| 单体 / 分布式 / 演进路线 | **本仓库**（问题 + `DECISION-GUIDE.md`） | 决策框架固定 |
| 具体用 Spring 还是 Quarkus | **AI 推荐 + 用户确认** | 随时代变化，不宜写死 |
| 脚手架命令 | **AI + stack profile 提示** | Profile 给「问什么、验证什么」，不给死命令版本号 |

**为什么不写死技术栈？**

- 框架版本迭代快，写死在仓库里会过期
- 不同团队约束不同（公司已有 Java 17、必须用 PostgreSQL 等）
- AI 的知识库可以匹配「2026 年仍维护的框架」，但**必须经用户确认**

**为什么不完全交给 AI 自由发挥？**

- 没有流程时，AI 容易跳过产品定义直接写代码
- 没有决策框架时，新手仍然不知道「单体还是微服务」该怎么想
- Harness 的价值 = **可重复的工程纪律**

### 决策 2：三层内容结构

```text
Layer A — 通用流程（所有项目必读）
  INTAKE.md, PHASES.md, DECISION-GUIDE.md, ANTI-PATTERNS.md

Layer B — 技术域加速包（确定域后读）
  docs/stacks/java-backend/
  docs/stacks/python-llm/
  docs/stacks/web-frontend/
  ...

Layer C — 产出模板（写入用户新项目）
  templates/product-contract.md
  templates/architecture-brief.md
  templates/new-project-agents.md
```

Layer B **不是**「Spring Boot 教程」，而是：

- 该域**多问的 5～10 个问题**
- 该域**常见的架构分叉**（如 API 单体 vs 微服务就绪单体）
- 该域**脚手架原则**（用官方工具，禁止手写 pom 树）
- 该域**第一个里程碑**通常包含什么

### 决策 3：本仓库零业务代码

```
project-blueprint/
├── skill/                 # 可安装 Skill 包（SKILL.md + reference/ + templates/）
├── scripts/
│   ├── sync-skill.sh      # docs/ → skill/reference/
│   └── install-skill.sh   # 安装到 AGENT_SKILLS_DIR 或指定路径
├── AGENTS.md              # 维护者入口（薄）
├── README.md              # 人类入口
├── docs/                  # 流程真源（编辑后 sync）
├── templates/             # 新项目模板真源
├── examples/
├── .cursor/rules/         # 可选：本仓库维护用编辑器规则
└── (无 src/, 无应用级构建文件)
```

用户的新项目创建在 **`target_path`**（自动推断或用户指定），例如：

```text
~/projects/my-app/                  ← 真实代码
~/study/project/project-blueprint/  ← 仅维护 Harness 源码
```

### 决策 4：Skill 负责编排，Markdown 负责真源

- **Skill**（`skill/SKILL.md`）：触发条件、路径解析、checklist、禁止项、何时读 reference
- **Markdown**（`docs/` → sync 到 `skill/reference/`）：问题 wording、决策原则、阶段定义

避免把所有内容塞进 Skill（难 diff、难协作）；也避免只有 Markdown 没有 Skill（AI 可能不主动读）。

## 推荐的用户旅程

```text
用户安装 Skill（install-skill.sh）或在任意工作区触发 project-intake
        │
        ▼
Phase 0 — 推断 target_path（默认不问）→ 创建目录 / 初始化 git
        │
        ▼
Phase 1～4 — Intake（reference/INTAKE.md，一次一问）
        │
        ▼
技术域 → reference/stacks/<domain>/
        │
        ▼
方案对比（DECISION-GUIDE.md）→ 用户确认
        │
        ▼
写入契约（templates/ → target_path/docs/）
        │
        ▼
脚手架（PHASES.md）→ 第一个里程碑（≤10 tasks，可验证）
```

## 未来可扩展（V2+，当前不做）

| 能力 | 说明 | 为何暂缓 |
|------|------|----------|
| CLI 工具 `blueprint init` | 交互式问卷 + 生成目录 | 先验证 Markdown + Skill 是否够用 |
| OpenSpec 集成 | 变更驱动实现 | 可选插件，非所有人需要 |
| Stack Pack 版本锁定 | 如 `java-backend@2026-q2` | 维护成本高 |
| Web UI 问卷 | 非开发者友好 | 次要受众 |

## 成功标准

Harness 生效的标志：

1. 新手用户能在 **30 分钟内**（含对话）得到一份批准的产品契约 + 架构摘要
2. AI **没有**在用户确认前生成业务代码
3. 新项目的 `AGENTS.md` 能让**另一个全新 AI 会话**继续开发而不重新问一遍基础问题
4. 第一个里程碑有**可运行的验证命令**（compile / test / lint 之一）

## 维护原则

- 改流程 → 改 `docs/` 与 `skill/SKILL.md`，运行 `scripts/sync-skill.sh`
- 加技术域 → 新增 `docs/stacks/<name>/`，三文件即可：`questions.md`、`decision-forks.md`、`first-milestone.md`
- 不加「必须用 XXX 框架」的硬性规则，只加**决策问题**
