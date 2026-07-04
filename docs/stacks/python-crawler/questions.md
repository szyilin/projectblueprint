# Python 爬虫 — 追加问题

## Q-C1. 规模与频率

> 爬多少页面？一次性还是持续调度？

## Q-C2. 目标站点特征

> 静态 HTML /  heavy JS / 需要登录？

## Q-C3. 反爬与合规

> 有无 robots.txt 约束、频率限制、法律合规要求？

## Q-C4. 存储

> 结果存哪？CSV / JSON / DB / 消息队列？

## Q-C5. 调度

> 仅手动运行 / cron / 分布式调度（Celery 等）？

---

详细分叉与里程碑见同目录 `decision-forks.md`、`first-milestone.md`（V1 可随首个爬虫项目补全）。

**脚手架原则**：Scrapy 项目用 `scrapy startproject`；轻量用 httpx + 脚本结构，禁止一次写巨型单文件。
