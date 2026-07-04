# 安装 project-intake Skill

本 Skill 与具体 AI 编码工具无关。将 `skill/` 目录（含 `SKILL.md`、`reference/`、`templates/`）放入你的 Agent **Skills 目录**即可。

## 方式 A：安装脚本

```bash
git clone git@github.com:szyilin/projectblueprint.git
cd projectblueprint
chmod +x scripts/*.sh

# 指定 Skills 目录（各 Agent 文档中的路径可能不同）
export AGENT_SKILLS_DIR="$HOME/skills"   # 按你的环境修改
./scripts/install-skill.sh

# 或直接传入目标路径
./scripts/install-skill.sh /path/to/your/agent/skills/project-intake
```

## 方式 B：手动复制

```bash
cp -R skill/ /path/to/your/agent/skills/project-intake/
```

确保 Agent 能发现 `project-intake/SKILL.md`（具体配置见你所用 Agent 的 Skills 文档）。

## 使用

在任意工作区对 AI 说：

> 我要从零开始做一个 XXX 项目，请按 Project Blueprint 引导我。

## 维护者同步

修改 `docs/` 或 `templates/` 后：

```bash
./scripts/sync-skill.sh
```

再重新安装或复制 `skill/` 到 Skills 目录。
