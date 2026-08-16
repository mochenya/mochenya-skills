[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Path
)

$ErrorActionPreference = 'Stop'
$resolvedPath = [System.IO.Path]::GetFullPath($Path)
$topicRoot = Join-Path $resolvedPath 'docs/topics'
$indexDirectory = Join-Path $resolvedPath 'docs/00-index'
$indexPath = Join-Path $indexDirectory '主题总索引.md'

if (-not (Test-Path -LiteralPath $topicRoot)) {
    throw "Topic directory does not exist: $topicRoot"
}
if (-not (Test-Path -LiteralPath $indexDirectory)) {
    New-Item -ItemType Directory -Path $indexDirectory -Force | Out-Null
}

function Get-FrontmatterValue {
    param(
        [string[]]$Lines,
        [string]$Key
    )
    $line = $Lines | Where-Object { $_ -match "^$([regex]::Escape($Key)):\s*(.+)$" } | Select-Object -First 1
    if ($null -eq $line) { return '' }
    return ([regex]::Match($line, "^$([regex]::Escape($Key)):\s*(.+)$")).Groups[1].Value.Trim()
}

$entries = foreach ($entry in Get-ChildItem -LiteralPath $topicRoot -Recurse -File -Filter '00-主题入口.md') {
    $lines = Get-Content -LiteralPath $entry.FullName -Encoding utf8
    $relative = $entry.FullName.Substring($resolvedPath.Length).TrimStart('\', '/') -replace '\\', '/'
    $topicPath = Split-Path -Path $relative -Parent
    [pscustomobject]@{
        Title = (Get-FrontmatterValue $lines 'title')
        Type = (Get-FrontmatterValue $lines 'type')
        Subject = (Get-FrontmatterValue $lines 'subject')
        Status = (Get-FrontmatterValue $lines 'status')
        Level = (Get-FrontmatterValue $lines 'level')
        Path = $topicPath
        Link = ($relative -replace '\.md$', '')
    }
}

$rows = foreach ($entry in ($entries | Sort-Object Subject, Title, Path)) {
    $title = if ([string]::IsNullOrWhiteSpace($entry.Title)) { Split-Path $entry.Path -Leaf } else { $entry.Title }
    "| $title | $($entry.Type) | $($entry.Subject) | $($entry.Level) | $($entry.Status) | [[$($entry.Link)]] |"
}

$body = @(
    '<!-- GENERATED FILE. Do not edit the table by hand. Rebuild with scripts/build-topic-index.ps1. -->'
    ''
    '# 主题总索引'
    ''
    '主题入口按主题元数据汇总。当前学习顺序请维护在 [[当前学习路径]]。'
    ''
    '| 主题 | 类型 | 学科 | 深度 | 状态 | 路径 |'
    '| --- | --- | --- | --- | --- | --- |'
    $rows
)
Set-Content -LiteralPath $indexPath -Value ($body -join [Environment]::NewLine) -Encoding utf8
Write-Output "rebuilt: $indexPath"
Write-Output "topics: $($entries.Count)"
