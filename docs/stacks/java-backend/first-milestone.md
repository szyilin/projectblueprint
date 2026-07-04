# Java 后端 — 第一个里程碑建议

首里程碑目标：**可编译、可启动、可 hit 一个 HTTP 端点**，并有一条自动化验证。

## 建议 tasks（≤10，按项目裁剪）

```text
1. [ ] 用官方工具生成 Maven/Gradle 骨架（或复制 parent 模式）
2. [ ] 添加 .gitignore、README 构建说明
3. [ ] 生成 AGENTS.md（构建/测试/运行命令）
4. [ ] 统一 API 响应格式（如 code=0 成功）— 若契约有要求
5. [ ] GET /health 或 /actuator/health 可访问
6. [ ] 配置 application.yml（端口、profile）
7. [ ] （可选）一个示例实体 + 内存/嵌入式 DB 的 CRUD
8. [ ] （可选）Flyway V1 占位迁移
9. [ ] 一条 mvn test 或 @WebMvcTest 通过
10. [ ] 在 AGENTS.md 更新「当前阶段：首里程碑完成」
```

## 验证命令（写入新项目 AGENTS.md）

```bash
./mvnw -q -DskipTests compile
./mvnw test
./mvnw spring-boot:run
# curl localhost:8080/health
```

具体模块路径（如 `-pl xxx-server`）按实际结构写。

## 刻意不做（第一里程碑）

- 完整 RBAC、工作流、IM 等域功能
- 分布式组件（Gateway、Nacos）
- 生产级监控（可留后续 plan）
