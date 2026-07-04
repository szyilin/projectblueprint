# 立项产出样例 — 内部 Wiki API（Java）

> 虚构项目，展示 Intake 完成后的文档长什么样。  
> **不是** Project Blueprint 要实现的产品。

---

## 产品契约摘要

- **一句话**：小团队内部知识库 REST API，支持文档 CRUD 与全文搜索
- **用户**：5 人开发团队，通过 Admin 与未来前端调用
- **MVP**：文档 CRUD、PostgreSQL 存储、关键词搜索、JWT 登录
- **Non-goals**：第一版不做协同编辑、不做微服务
- **成功标准**：Postman 能完成登录 → 建文档 → 搜索到该文档

## 架构决策摘要

| 项 | 选择 |
|----|------|
| 拓扑 | 微服务就绪单体（单 JAR，Maven 多模块预留） |
| 语言/框架 | Java 21 + Spring Boot 3 |
| 数据库 | PostgreSQL |
| 认证 | JWT |

**为何不用分布式**：团队 2 人、8 周 demo，运维无 K8s。

## 用户确认记录（示意）

- [x] 产品契约批准 — 2026-07-04
- [x] 技术栈方案 B 批准 — 2026-07-04
- [x] 新项目路径 `~/projects/wiki-api` — 2026-07-04

## 下一步

在新目录 `~/projects/wiki-api` 执行 PHASES 阶段 1～4，首里程碑见 `docs/stacks/java-backend/first-milestone.md`。
