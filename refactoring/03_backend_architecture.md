# 3. 后端架构现代化 (Backend Architecture Modernization)

我们将采用 **DDD (领域驱动设计)** + **Clean Architecture (整洁架构)** 彻底重构后端，从单体应用向微服务架构演进，构建高性能、高可用、易扩展的现代技术底座。

## 3.1 领域驱动设计 (DDD) 与微服务拆分

### **限界上下文 (Bounded Contexts) 划分**
我们将系统拆分为 ≥ 4 个核心限界上下文，每个上下文独立部署，通过明确的接口契约交互：

1.  **核心域 (Core Domain)**:
    *   **项目上下文 (Project Context)**: 负责项目全生命周期管理 (立项、执行、变更、归档)。
    *   **造价上下文 (Cost Context)**: 负责复杂的造价计算、预算编制、核算逻辑。
2.  **支撑域 (Supporting Domain)**:
    *   **审批上下文 (Approval Context)**: 基于工作流引擎，处理所有业务流程的流转。
    *   **资源上下文 (Resource Context)**: 管理人员、证书、物资等企业资源。
3.  **通用域 (Generic Domain)**:
    *   **认证授权上下文 (Identity Context)**: 统一处理登录、权限控制 (IAM)。
    *   **通知上下文 (Notification Context)**: 统一消息发送 (邮件、短信、站内信)。

### **统一语言 (Ubiquitous Language)**
*   建立包含中英文对照的领域术语表 (Glossary)，确保产品、开发、测试对业务概念理解一致。

## 3.2 技术栈升级 (Tech Stack)

### **核心服务**
*   **语言**: **Java 21** (LTS) —— 利用 Records, Pattern Matching, Virtual Threads 提升开发效率与并发性能。
*   **框架**: **Spring Boot 3.2** —— 原生支持 GraalVM Native Image，启动速度提升 10x。
*   **并发模型**: **Virtual Threads (Project Loom)** —— 替代传统的线程池模型，以低成本实现高吞吐量的 I/O 密集型服务。

### **高性能组件**
*   **API 网关**: **Go 1.22** (基于 APISIX 或 Kong) —— 处理高频流量入口，负责限流、熔断、鉴权。
*   **计算密集型服务**: **Rust** —— 用于复杂的造价算法引擎，利用其内存安全与零成本抽象特性，确保高性能计算稳定性。

### **接口契约**
*   **OpenAPI 3.1**: 采用 API First 策略，先定义接口文档，再自动生成代码。
*   **版本控制**: 严格遵守语义化版本控制，确保向后兼容 ≥ 2 个大版本。

## 3.3 数据层架构 (Data Architecture)

### **数据库 (RDBMS)**
*   **主存储**: **MySQL 8.0** —— 采用分库分表策略 (ShardingSphere)，解决单表数据量过大问题。
*   **读写分离**: 一主多从架构，通过 Proxy 层自动路由读写请求。

### **实时 OLAP**
*   **TiDB**: 作为实时分析型数据库，同步 MySQL 增量数据，支持复杂的报表查询与多维分析，无需 ETL 延迟。

### **缓存体系**
*   **Redis 7 Cluster**: 构建高可用缓存集群，目标缓存命中率 **≥ 98%**。
*   **缓存一致性**: 引入 **CDC (Change Data Capture)** 技术 (Debezium)，监听 MySQL Binlog，自动失效或更新 Redis 缓存，彻底解决双写一致性问题。

### **事件驱动架构 (Event-Driven)**
*   **消息总线**: **Kafka 3.6** —— 作为全系统的时间总线，解耦微服务。
*   **可靠性**: 保证 **Exactly-Once** 语义，防止消息丢失或重复消费。
*   **可观测性**: 配置死信队列 (DLQ) 并集成 Prometheus 监控，确保积压与消费延迟可视。

## 3.4 安全架构 (Security)

*   **零信任架构 (Zero Trust)**: 所有服务间调用均需经过认证。
*   **认证协议**: **OAuth 2.1 + OIDC** —— 统一身份认证标准。
*   **传输安全**: **mTLS** (双向 TLS) —— 确保微服务间通信加密且身份可信。
*   **密钥管理**: **HashiCorp Vault** —— 集中管理数据库密码、API Key 等敏感凭据，杜绝硬编码。
*   **数据加密**: 敏感字段 (如身份证号、手机号) 采用 **AES-256-GCM** 算法加密存储。
