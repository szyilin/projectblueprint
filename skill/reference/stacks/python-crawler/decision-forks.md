# Python 爬虫 — 架构分叉（简版）

| 场景 | 倾向 |
|------|------|
| 多站点、管道、去重 | Scrapy |
| 少量 API/页面 | httpx + pydantic 模型 |
| 强 JS 渲染 | Playwright（成本高，确认必要再用） |

**合规**：默认遵守 robots.txt；频率限制写入 ARCHITECTURE；不引导绕过合法访问控制。

## 第一里程碑（简版）

1. 项目结构 + 依赖管理
2. 爬取 1 个允许的目标 URL 并解析
3. 结果写入本地 JSON/CSV
4. 一条 pytest（mock HTTP）
5. README + AGENTS.md
