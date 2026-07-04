# 通用立项流程（Intake）

AI 引导用户从零搭项目时，**默认按本文件顺序提问**。  
每个问题**单独一条消息**；用户回答后再问下一个。

用户若已明确多项信息，可合并确认，但**不可跳过未覆盖的必填项**。

---

## Phase 0 — 开场（路径推断优先）

**默认不问路径**。按 [`skill/SKILL.md`](../skill/SKILL.md) 中的「路径解析」表确定 `target_path`，仅在一行内告知用户；只有当前为非空业务仓库且用户未说明意图时才提问。

确认项：

1. 用户要创建的是**新项目**（而非在已有仓库里加功能）——若语义模糊，单独澄清
2. `target_path` — 推断规则见 Skill；用户已给路径则直接用；目录不存在则 `create_project` + 必要时 `move_agent_to_root`
3. 引导模式 — 默认**全程引导**；用户说「只要契约文档」时改为仅生成文档

---

## Phase 1 — 产品意图（必填）

按顺序问：

### Q1. 一句话描述

> 用一句话说：你要做的是什么？给谁用？

记录：`product.one_liner`

### Q2. 核心用户与场景

> 谁会用？最典型的 1 个使用场景是什么？

记录：`product.users`, `product.primary_scenario`

### Q3. 必须有的能力（MVP）

> 第一版**必须**能做什么？请列 3～5 条，按优先级。

记录：`product.mvp_features[]`

### Q4. 明确不做（Non-goals）

> 第一版**刻意不做**什么？（防止 scope 膨胀）

记录：`product.non_goals[]`

### Q5. 成功标准

> 怎样算「第一版做成了」？能观测或可演示的标准是什么？

记录：`product.success_criteria[]`

---

## Phase 2 — 形态与规模（必填）

### Q6. 项目类型

> 这更像下面哪一类？（可多选或补充）

- [ ] Web 应用（浏览器访问）
- [ ] 后端 API / 服务
- [ ] 命令行工具
- [ ] 数据管道 / ETL / 爬虫
- [ ] AI / LLM 应用（RAG、Agent、微调等）
- [ ] 移动端
- [ ] 库 / SDK（给别人集成）
- [ ] 其他：___

记录：`shape.project_types[]`

### Q7. 部署与受众

> 谁部署？仅本机 / 内网 / 公网 SaaS / 客户现场？

记录：`shape.deployment`, `shape.audience`

### Q8. 团队与周期

> 几人开发？希望第一版大概多久可演示？

记录：`shape.team_size`, `shape.timeline_hint`

---

## Phase 3 — 架构形态（必填）

### Q9. 架构偏好（引导式，见 DECISION-GUIDE.md）

> 关于系统结构，你更倾向哪种？如果不确定，我可以用下面方式帮你选：

- **A. 单体** — 一个进程/一个部署单元，最简单
- **B. 微服务就绪单体** — 现在一个部署，代码按模块分好，以后可拆
- **C. 分布式** — 现在就多服务（Gateway、注册中心等）
- **D. 不确定** — 请 AI 根据 Q6～Q8 给建议

记录：`architecture.topology_choice`

若选 D：AI 必须读 [`DECISION-GUIDE.md`](DECISION-GUIDE.md) 给出 2～3 方案 + 推荐，**等用户选**。

### Q10. 数据与状态

> 需要持久化数据吗？大概什么类型（关系型 / 文档 / 文件 / 向量 / 无状态）？

记录：`architecture.data_needs[]`

### Q11. 集成与外部依赖

> 要不要对接第三方（支付、OAuth、大模型 API、消息队列等）？

记录：`architecture.integrations[]`

---

## Phase 4 — 技术栈（必填，AI 辅助）

### Q12. 已有约束

> 有没有**必须**用的语言、框架、云、数据库？（公司规定、个人熟悉度）

记录：`stack.hard_constraints[]`

### Q13. 偏好或无偏好

> 对技术栈有偏好吗？还是希望我根据上面信息推荐？

- 有偏好 → 记录 `stack.user_preference`
- 无偏好 → AI 读 [`DECISION-GUIDE.md`](DECISION-GUIDE.md)，给出 **2～3 个完整方案**（语言 + 框架 + 存储 + 部署），每个 3～5 条 trade-off

**必须等用户选定一个方案**，记录 `stack.selected`

### Q14. 技术域确认

根据 `stack.selected`，确定 `stack.domain`，例如：

- `java-backend`
- `python-llm`
- `python-crawler`
- `web-frontend`
- `fullstack`
- `generic`（无匹配 profile 时）

→ 加载 [`docs/stacks/<domain>/`](stacks/)（若存在）

---

## Phase 5 — 契约化与批准

1. 用 [`templates/product-contract.md`](../templates/product-contract.md) 生成 `docs/product/CONTRACT.md`（写入**新项目**目录）
2. 用 [`templates/architecture-brief.md`](../templates/architecture-brief.md) 生成 `docs/ARCHITECTURE.md`
3. 向用户展示摘要，问：**「以上契约是否批准？有需要改的地方吗？」**

未批准 → 修改后再次确认。  
已批准 → 进入 [`PHASES.md`](PHASES.md) 脚手架阶段。

---

## 快速路径（有经验用户）

用户可说「我熟悉流程，跳过问卷」，AI 仍须：

1. 请用户**一次性提供** Phase 1～4 的要点（或粘贴 PRD）
2. AI 整理成 CONTRACT + ARCHITECTURE
3. **仍须**获得批准后再写代码

不可因「用户说跳过」而省略批准点。

---

## Intake 产出清单

| 产出 | 位置（新项目内） |
|------|------------------|
| 产品契约 | `docs/product/CONTRACT.md` |
| 架构摘要 | `docs/ARCHITECTURE.md` |
| AI 入口 | `AGENTS.md`（从模板生成） |
| 首里程碑 | `docs/plans/00-first-milestone.md` |
