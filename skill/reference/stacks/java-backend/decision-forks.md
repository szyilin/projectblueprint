# Java 后端 — 架构分叉

## 分叉 1：部署形态

| 选项 | 描述 | 何时选 |
|------|------|--------|
| **单体** | 单模块或少量模块，一个 Spring Boot 进程 | 1～2 人、2 周内 demo、域少 |
| **微服务就绪单体** | 多 Maven 模块（api/biz/server），**一个**运行时 JAR | 域清晰、未来可能拆、团队 2～5 人 |
| **分布式** | Gateway + 注册中心 + 多 `*-server` | 已有 K8s/平台组、明确要独立扩容 |

**Blueprint 默认倾向**：微服务就绪单体（若用户无相反约束）。

## 分叉 2：分层风格

常见：

```text
controller → service → repository/mapper
         ↘ dto/vo 转换
```

若多域：

```text
*-api（对外契约/DTO/Feign 接口）
*-biz（实现）
server（唯一入口，V1）
```

**跨域规则（若多模块）**：禁止 biz 互依赖，跨域走 api —— 写入新项目 ARCHITECTURE.md。

## 分叉 3：API 风格

| 风格 | 说明 |
|------|------|
| REST + OpenAPI | 默认推荐之一 |
| RPC（Dubbo/gRPC） | 已有生态或性能要求 |
| GraphQL | 前端强聚合需求 |

第一版优先 REST，除非用户指定。

## 分叉 4：数据迁移

- 有表结构 → Flyway/Liquibase 从第一天纳入
- AI 只写 SQL **内容**；文件名遵循项目约定（写入新项目 AGENTS.md）

## 脚手架原则

- ✅ Spring Initializr、start.spring.io、官方 archetype
- ✅ 复制**已验证**的多模块 parent 结构（若用户有参考仓库）
- ❌ AI 从零手写 20 个 pom.xml
- ❌ 第一版引入 Gateway/Nacos（除非选分布式且用户确认）

## 参考实例

同级目录 [`relayflow`](../../../relayflow)（若存在）可作为「微服务就绪单体 + OpenSpec」的完整样例，**不要整库复制**。
