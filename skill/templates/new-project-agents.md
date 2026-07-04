# {{PROJECT_NAME}} — AI 编码说明

> 人类读者请读 [`README.md`](README.md)。

## 当前阶段

**{{CURRENT_PHASE}}** — 见 [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md)

## 文档阅读顺序

| 顺序 | 路径 | 何时读 |
|------|------|--------|
| 1 | [`docs/product/CONTRACT.md`](docs/product/CONTRACT.md) | 理解产品边界 |
| 2 | [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) | 架构与技术栈 |
| 3 | [`docs/plans/00-first-milestone.md`](docs/plans/00-first-milestone.md) | **当前工作范围** |

## 常用命令

```bash
{{BUILD_CMD}}
{{TEST_CMD}}
{{RUN_CMD}}
```

## 硬约束

| 项 | 规则 |
|----|------|
| 包名/模块前缀 | {{PACKAGE_RULE}} |
| API 前缀 | {{API_PREFIX}} |
| 当前禁止 | {{CURRENT_FORBIDDEN}} |

## 实现纪律

1. 只实现 `docs/plans/` 中**当前 plan** 的任务
2. 声称完成前必须运行上方验证命令
3. 架构变更先更新 `docs/ARCHITECTURE.md` 并获人类确认

## 封闭变量

<!-- 立项时填写，AI 不得擅自修改 -->

- {{CLOSED_VAR_1}}
- {{CLOSED_VAR_2}}
