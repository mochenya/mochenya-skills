[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Path,

    [Parameter(Mandatory = $true)]
    [string]$Subject,

    [string]$Goal = 'Build a durable, linked knowledge base with deep explanations and practical verification.',
    [string]$Audience = 'Learner with basic computer science background',
    [ValidateSet('overview', 'working', 'deep')]
    [string]$Depth = 'deep',
    [string]$SubjectTag = ''
)

$ErrorActionPreference = 'Stop'

$resolvedPath = [System.IO.Path]::GetFullPath($Path)
if ([string]::IsNullOrWhiteSpace($SubjectTag)) {
    $SubjectTag = ($Subject.ToLowerInvariant() -replace '[^a-z0-9]+', '-').Trim('-')
    if ([string]::IsNullOrWhiteSpace($SubjectTag)) {
        $SubjectTag = 'subject'
    }
}

function Ensure-Directory {
    param([string]$Directory)
    if (-not (Test-Path -LiteralPath $Directory)) {
        New-Item -ItemType Directory -Path $Directory -Force | Out-Null
    }
}

function Write-IfMissing {
    param(
        [string]$FilePath,
        [string]$Content
    )
    if (-not (Test-Path -LiteralPath $FilePath)) {
        Set-Content -LiteralPath $FilePath -Value $Content -Encoding utf8
        Write-Output "created: $FilePath"
    }
    else {
        Write-Output "kept: $FilePath"
    }
}

$directories = @(
    'docs/00-index',
    'docs/topics',
    'docs/patterns',
    'docs/experiments',
    'docs/projects',
    'docs/99-inbox',
    'code',
    'projects',
    'templates'
)
foreach ($directory in $directories) {
    Ensure-Directory (Join-Path $resolvedPath $directory)
}

$skillRoot = Split-Path -Path (Split-Path -Path $PSCommandPath -Parent) -Parent
$templateSource = Join-Path $skillRoot 'assets/templates'
$templateDestination = Join-Path $resolvedPath 'templates'
if (Test-Path -LiteralPath $templateSource) {
    foreach ($template in Get-ChildItem -LiteralPath $templateSource -File) {
        $destination = Join-Path $templateDestination $template.Name
        if (-not (Test-Path -LiteralPath $destination)) {
            Copy-Item -LiteralPath $template.FullName -Destination $destination
            Write-Output "created: $destination"
        }
        else {
            Write-Output "kept: $destination"
        }
    }
}

$goalContent = @"
---
title: 学习目标
type: learning-goal
subject: $Subject
depth: $Depth
audience: $Audience
mode: topic-driven
---

# $Subject 学习目标

## 总目标

$Goal

## 学习方式

不预设固定章节。根据当前问题创建主题知识包，并持续补充机制、边界、工程实践、实验和项目关系。

## 深度标准

- 解释问题和心智模型
- 解释生命周期、执行顺序或关键不变量
- 记录边界条件、失败模式和不适用场景
- 用代码、测试、源码或可复现实验证结论
- 连接前置知识、相关主题和实际应用

## 当前学习路径

参见 [[当前学习路径]]。
"@

$readmeContent = @"
# $Subject Knowledge Repository

This repository is topic-driven. Knowledge lives in `docs/topics/`; indexes are navigation views that can change as the graph grows.

- Goal: $Goal
- Audience: $Audience
- Target depth: $Depth

Use `docs/99-inbox/` for uncategorized questions, `code/` for runnable evidence, and `projects/` for integrated practice.
"@

$catalogContent = @"
<!-- GENERATED FILE. Rebuild with scripts/build-topic-index.ps1. -->

# 主题总索引

当前还没有主题入口。创建 `docs/topics/<topic>/00-主题入口.md` 后运行索引脚本。
"@

$pathContent = @"
---
title: 当前学习路径
type: learning-path
subject: $Subject
---

# 当前学习路径

这是人工维护的学习顺序，不会被自动索引脚本覆盖。

## 当前主题

- 

## 下一步问题

- 
"@

Write-IfMissing (Join-Path $resolvedPath 'README.md') $readmeContent
Write-IfMissing (Join-Path $resolvedPath 'docs/00-index/学习目标.md') $goalContent
Write-IfMissing (Join-Path $resolvedPath 'docs/00-index/主题总索引.md') $catalogContent
Write-IfMissing (Join-Path $resolvedPath 'docs/00-index/当前学习路径.md') $pathContent
