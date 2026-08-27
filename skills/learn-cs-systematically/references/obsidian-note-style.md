# Obsidian 学习笔记规范

只有用户已经授权创建或更新笔记时，才读取并使用本规范。

## 沉淀稳定知识

普通聊天不自动写入文件。

只有内容具备复用价值、脱离当前对话后仍可理解、已经达到当前用途所需的可靠程度，并且不是临时调试噪声时，才创建或更新笔记。

先搜索目标 Vault。优先更新已有规范笔记，不创建重复内容。

一篇持久笔记只围绕一个连贯主题。请求覆盖宽泛领域时，使用课程地图连接若干聚焦章节；同一问题、模型、示例和完成任务构成连续主线时，可以保留一篇较长章节，不因篇幅机械拆分。

持久笔记应保留“本篇范围”和可验证的学习目标：读者至少能够定义核心概念、依据机制预测一个例子，并在相关时判断工程适用边界。不要用笔记数量、章节数量或代码长度代替学习结果。

篇幅由声明范围和知识结构决定：删除重复、口语化填充和无关分支，但不能为了固定字数省略核心定义、主要操作、机制证据或边界。出现第二个独立模型、不同前置或不同完成能力时再拆分笔记。

## 最小 Frontmatter

使用：

~~~yaml
---
title: "中文标题"
aliases:
  - "English Term"
  - "ABBR"
tags:
  - cs/domain
type: concept
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
~~~

规则：

- 存在稳定专业译法时，标题使用中文。
- aliases 只记录真实英文名、缩写或有搜索价值的其他译法。
- 使用低基数的层级标签表达所属领域。
- type 可使用 concept、chapter、lab、practice、exercise、project 或 reference。
- 只有内容明显受版本影响时才添加 version 字段。
- 不为排版效果添加空属性。

## 标签与链接

- 标签用于宽泛分类，例如 cs/database-systems、cs/concurrency、cs/algorithms 或 swe/testing。
- 前置、相关和后续概念使用 [[wikilinks]]。
- 外部来源使用普通 Markdown 链接。
- 不要把每个关键词都变成标签。
- 不要为了让关系图看起来丰富而制造大量未解析链接。

## 正文结构

使用 [../assets/systematic-note-template.md](../assets/systematic-note-template.md) 作为可删减起点。

本文件只约束 Obsidian 持久化和排版，不另行规定一套教学顺序。正文内容按主题读取：

- 概念、隐藏前置和机制：使用 [concept-first-teaching.md](concept-first-teaching.md)；
- 编程语言设计与八个覆盖维度：使用 [programming-language-learning.md](programming-language-learning.md)；
- 语法、方法与 API 操作：使用 [syntax-and-api-teaching.md](syntax-and-api-teaching.md)；
- 可见标题和段落组织：使用 [teaching-style.md](teaching-style.md)；
- 代码、命令和结果：使用 [code-style.md](code-style.md)。

模板中的内容模块不是固定标题。最终二级标题应表达本节正在回答的具体问题、状态变化或选择条件。删除不适用的模块，但主概念和声明范围内的核心操作必须在本篇或明确归属的连续章节中讲清；不能用 wikilink 代替当前推理所需的定义和关系。

## Callout 提示块

谨慎使用 Obsidian 标准 Callout：

- abstract：核心结论。
- info：准确事实、示例环境或正式要求。
- example：完整示例或推演。
- tip：工程建议。
- warning：常见误区或重要边界。
- danger：数据丢失、安全、损坏等严重后果。
- question：可选自检问题。
- success：存在自检时，用于折叠显示参考答案。

普通正文不要放进 Callout。

## 代码与结果

- 使用带正确语言标识的代码围栏。
- 按可复现顺序展示准备工作、代码和结果。
- 明确标注“预期结果”或“实际运行结果”。
- 代码块之后解释关键逻辑。
- 遵循 [code-style.md](code-style.md)。

## 参考资料

正文末尾默认添加“参考资料”章节，保留一到三个真正有用的来源。

优先顺序：

1. 标准、规范和官方文档。
2. 权威教材或原始论文。
3. 能够补充工程语境的可信技术文档。

不要把普通学习笔记做成引用审计。只有准确、争议、规范性或版本相关结论确实需要时，才使用逐条脚注。

## 排版规则

- 使用一个与 title 一致的一级标题。
- 不跳过标题层级。
- 优先使用短段落和聚焦列表。
- 表格只用于比较、映射或小型结果集。
- Mermaid 仅在能够显著澄清复杂关系或过程时使用，并遵循 [teaching-style.md](teaching-style.md) 的可视化约束。
- 中文正文使用中文标点，技术名称保持官方大小写。
