# Stack Profiles（技术域加速包）

## 是什么

每个子目录对应一种**技术域**，不是框架绑定清单。

| 文件 | 用途 |
|------|------|
| `questions.md` | Intake 之后**追加**问该域特有的问题 |
| `decision-forks.md` | 该域常见架构分叉与 trade-off |
| `first-milestone.md` | 第一个里程碑通常包含什么 |

## 如何使用（AI）

1. INTAKE Phase 4 确定 `stack.domain`
2. 若存在对应目录 → 读三个文件
3. 将答案合并进 `docs/ARCHITECTURE.md` 与 `docs/plans/00-first-milestone.md`
4. **不**把 profile 里的示例框架当作强制规定

## 当前已有 Profile

| 目录 | 适用场景 |
|------|----------|
| [java-backend](java-backend/) | Java 服务端、REST API、企业后台 |
| [python-llm](python-llm/) | LLM 应用、RAG、Agent |
| [python-crawler](python-crawler/) | 爬虫、采集、数据抓取 |

## 如何新增 Profile

复制任一目录，改三文件即可。PR 时说明：

- 适用边界（什么项目不该用这个 profile）
- 追加问题 ≤10 个
- 不含「必须用 XXX 版本」的硬性规定

## 与 RelayFlow 的关系

[`java-backend/`](java-backend/) 中的「微服务就绪单体」分叉可参考同级目录 `relayflow` 的实践，但 **Project Blueprint 不依赖 RelayFlow 仓库存在**。
