# 4. 工程卓越实践 (Engineering Excellence)

通过引入现代化的 DevOps 流程与自动化工具链，构建高质量、高效率的软件交付流水线。

## 4.1 自动化测试体系 (Testing Strategy)

*   **单元测试 (Unit Testing)**:
    *   框架: **JUnit 5** + Mockito。
    *   覆盖率目标: 核心业务逻辑 **≥ 85%**。
*   **集成测试 (Integration Testing)**:
    *   工具: **Testcontainers** —— 在 Docker 容器中启动真实的 MySQL、Redis、Kafka 进行测试，拒绝 Mock 外部依赖，确保环境一致性。
*   **契约测试 (Contract Testing)**:
    *   框架: **Spring Cloud Contract** —— 确保微服务间接口变更不会破坏消费者的兼容性。

## 4.2 CI/CD 流水线 (Pipeline)

采用 **GitLab CI** 实现 Pipeline as Code，标准流水线包含以下阶段：

1.  **Build**: 编译代码，检查语法错误。
2.  **Unit Test**: 运行单元测试，生成覆盖率报告。
3.  **Static Analysis**:
    *   **SonarQube**: 质量门禁设为 **A 级** (无 Blocker/Critical 问题)。
    *   **Checkstyle/PMD**: 强制代码风格统一。
4.  **Security Scan**:
    *   **Trivy**: 扫描容器镜像漏洞。
    *   **Dependency Check**: 扫描依赖库 CVE 漏洞。
5.  **Build Image**: 构建 Docker 镜像并推送至 Harbor。
6.  **Deploy (Canary)**: 部署金丝雀版本至 K8s 集群。
7.  **Integration Test**: 运行自动化接口测试。
8.  **Promote**: 全量发布。
9.  **Rollback**: 监控到错误率超标 (如 > 1%) 自动回滚。

## 4.3 可观测性 (Observability)

*   **Metrics**: **Prometheus + Grafana** —— 监控 SLI/SLO (如 HTTP 延迟、错误率、CPU/内存)。
*   **Tracing**: **OpenTelemetry** —— 全链路追踪，可视化微服务间的调用依赖与耗时瓶颈。
*   **Logging**: **Loki** —— 集中式日志管理，支持基于标签的快速检索。
*   **Error Tracking**: **Sentry** —— 实时捕获后端异常与前端 JS 错误，关联堆栈信息。
*   **Alerting**: **On-Call Rotation** —— 告警分级，P0 级故障 **5 分钟内** 响应。

## 4.4 发布策略 (Deployment Strategy)

*   **蓝绿部署 (Blue/Green)**: 确保发布过程零停机。
*   **灰度发布 (Canary)**: 支持按 **用户 ID、地域、版本** 等维度进行流量染色与路由，逐步放量。

## 4.5 基础设施即代码 (IaC)

*   **Terraform**: 统一管理 AWS/EKS 资源，实现基础设施的版本化与可复现。
*   **K8s 安全**: 启用 **PSS (Pod Security Standards)** 的 Restricted 策略，禁止特权容器。
*   **成本优化**:
    *   **资源标签**: 覆盖率 **100%**，精细化核算各部门成本。
    *   **Spot 实例**: 在无状态服务节点组启用 Spot + On-Demand 混部，目标节省 **≥ 35%** 云成本。
