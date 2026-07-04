# 架构摘要 — {{PROJECT_NAME}}

> 由 Project Blueprint Intake 生成。批准日期：{{APPROVAL_DATE}}

## 架构形态

| 项 | 决策 |
|----|------|
| 拓扑 | {{TOPOLOGY}} <!-- 单体 / 微服务就绪单体 / 分布式 --> |
| 选型理由 | {{TOPOLOGY_RATIONALE}} |
| 演进路线 | {{EVOLUTION}} <!-- 如：V1 单体单部署，域模块清晰，满足 X 条件再拆 --> |

## 技术栈（已批准）

| 层级 | 选择 |
|------|------|
| 语言 | {{LANGUAGE}} |
| 框架 | {{FRAMEWORK}} |
| 数据存储 | {{DATA_STORE}} |
| 其他 | {{OTHER_STACK}} |

### 备选方案（记录决策过程）

- 方案 A：… — 未选原因：…
- 方案 B（**已选**）：…

## 系统边界

```text
{{ASCII_DIAGRAM_OR_BULLET_BOUNDARIES}}
```

## 模块 / 包（规划）

| 模块 | 职责 |
|------|------|
| {{MODULE_1}} | {{MODULE_1_DESC}} |

## 集成

| 外部系统 | 用途 | 第一版 |
|----------|------|--------|
| {{INTEGRATION_1}} | … | 是/否/占位 |

## 非功能（第一版最低要求）

| 项 | 要求 |
|----|------|
| 认证 | {{AUTH}} |
| 配置 | {{CONFIG}} |
| 日志 | {{LOGGING}} |

## 验证命令

```bash
{{VERIFY_BUILD}}
{{VERIFY_TEST}}
{{VERIFY_RUN}}
```

## 修订记录

| 日期 | 变更 |
|------|------|
| {{APPROVAL_DATE}} | 初始版本 |
