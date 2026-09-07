# 仓库勘察与研究包

本参考文件用于执行阶段。目标是把“读仓库”变成可复核的证据采集，而不是凭目录名称写架构故事。

## 1. 先固定分析合同

开始前记录：

- 仓库路径或 URL、目标分支/commit、分析日期和项目版本。
- 用户要理解的能力，例如 Agent Loop、记忆、插件、网关或任务调度。
- 明确排除项，例如 UI、皮肤、部署、商业后台或未要求的外围服务。
- 交付深度：总览、核心模块、代码细节、流程图、自检和迁移模式是否都需要。

如果用户未指定 commit，使用当前 checkout 并明确它是快照，不把“最新”当成已验证事实。

## 2. 拓扑扫描顺序

在 Windows 环境优先使用 PowerShell 和 `rg`：

```powershell
$repoRoot = 'D:\Project\target-repo'
git -C $repoRoot rev-parse HEAD
rg --files $repoRoot -g 'AGENTS.md' -g 'README*' -g 'pyproject.toml' -g 'package.json' -g 'go.mod' -g 'Cargo.toml'
rg --files $repoRoot | Select-Object -First 200
```

然后按以下顺序读：仓库指令、README、元数据、入口文件、核心目录、官方架构文档、测试和插件/适配器注册点。记录“读到的事实”和“尚未确认的假设”两列。

## 3. 找真实入口和窄腰

搜索而不是猜测：

- CLI：`argparse`、`click`、`typer`、`main`、console scripts。
- 服务：`FastAPI`、`Flask`、`aiohttp`、HTTP/WebSocket、gateway/server 启动点。
- Agent：`while` 回合循环、model request、tool call、finalizer、interrupt、budget。
- 工具：registry、decorator、schema、dispatch、result normalization。
- 状态：SQLite、JSON、文件持久化、cache、session、ledger、WAL、FTS。
- 扩展：plugin/provider/adapter discovery、entry points、dynamic import、registry。

对每个候选入口回答：谁调用它、它创建什么状态、它把控制权交给谁、成功和失败怎样返回。真正连接多种上层模式的共享核心，通常是架构的“窄腰（narrow waist）”，应优先写进总览。

## 4. 追踪一条代表性生命周期

至少完成一条从外部输入到结果交付的链路：

```text
入口 -> 配置/身份 -> session/context -> model request
     -> tool call / external side effect -> state persistence
     -> final response -> delivery / cleanup
```

每一步记录调用者、被调用者、输入形状、返回形状、可变状态、异常/中断处理和缓存边界。若不同运行模式共享核心，画一张“模式汇聚图”，再用时序图展开一条主链路。

## 5. 研究包设计

需要委派时，按机制而不是目录机械切片。每个研究包必须包含：

```text
研究问题：要解释的行为或设计决策
源码范围：允许读取的目录/文件
交叉边界：必须检查的调用方和被调用方
证据格式：路径:行号 + 原始摘录 + 解释 + 不确定项
禁止事项：不分析的模块，不推断的运行时结论
```

适合 Agent 项目的研究包通常是：Agent Loop、Context/Prompt、Tools、Memory、Self-evolution、Delegation/Automation、Gateway/Adapters。研究包之间要共享一个术语表和一个“冲突事实”列表；主 Agent 负责整合，不接受没有源码定位的结论。

## 6. 证据卡片

每个重要结论至少形成一张证据卡片：

```text
结论：一句可证伪的陈述
源码：repo/path.py:123
观察：源码实际做了什么
机制：为什么这能产生结论中的行为
边界：在哪些模式、配置或失败路径下不成立
交叉证据：调用方、测试、官方文档或配置
状态：confirmed / inferred / needs-runtime-check
```

不要把“文件存在”当成“功能启用”；还要找到注册、调用、配置和结果消费中的至少一环。

## 7. 处理冲突和版本漂移

当源码、测试、AGENTS、官方文档或配置不一致时，保留冲突：

| 来源 | 说法/观察 | 可信度与范围 | 影响 |
| --- | --- | --- | --- |
| 当前源码 | 实际控制流和默认值 | 当前 checkout | 运行行为 |
| 测试 | 被自动验证的契约 | 测试覆盖范围 | 回归边界 |
| 官方文档 | 设计意图或公开承诺 | 文档版本 | 用户预期 |
| AGENTS/注释 | 维护者约束或局部说明 | 维护范围 | 实施注意 |

结论应明确“代码事实”和“文档说法”的差异，不自行修复仓库或为了统一叙事删除其中一方。
