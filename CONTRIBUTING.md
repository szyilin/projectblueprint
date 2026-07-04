# 贡献指南

## 欢迎的贡献

- 新增 `docs/stacks/<domain>/` 技术域 profile
- 改进 INTAKE 问题 wording
- 补充 `examples/` 完整立项样例
- 修正 `ANTI-PATTERNS` 与真实 AI 失败案例
- 改进 `skill/SKILL.md` 编排（路径策略、checklist）

## 不接受的贡献（通常）

- 在本仓库加入业务应用代码
- 推广单一框架为「官方唯一推荐」
- 巨型 AGENTS.md（应拆到 docs/）
- 只改 `.cursor/skills/project-intake/` 而不跑 sync（会被覆盖）

## 改流程的检查清单

1. 改 `docs/INTAKE.md` 或 `docs/PHASES.md`（及必要时 `skill/SKILL.md`）
2. 运行 `./scripts/sync-skill.sh`
3. 若影响 stack profile，同步 `docs/stacks/`
4. 在 PR 描述中说明：假想用户旅程是否仍顺畅（含路径自动推断）

## 设计真源

仓库形态见 [`docs/REPOSITORY-DESIGN.md`](docs/REPOSITORY-DESIGN.md)。

## 本地安装自测

```bash
./scripts/install-skill.sh
```

在新 Cursor 会话中触发「从零做 Java API」验证 Skill 是否加载。
