param(
  [Parameter(Mandatory = $true)]
  [string]$NotesPath,
  [Parameter(Mandatory = $false)]
  [string]$RepoPath,
  [switch]$RequireMermaid
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

if (-not (Test-Path -LiteralPath $NotesPath -PathType Container)) {
  throw "Notes path not found: $NotesPath"
}

$notes = @(Get-ChildItem -LiteralPath $NotesPath -Filter '*.md' -File | Sort-Object Name)
if ($notes.Count -eq 0) {
  throw "No Markdown notes found: $NotesPath"
}

$requiredFields = @('title:', 'type:', 'repo:', 'commit:')
$sourcePattern = '(?<path>(?:[A-Za-z0-9_.-]+/)*[A-Za-z0-9_.-]+\.(?:py|md|toml|json|ts|tsx)):(?<line>\d+)'
$problems = [System.Collections.Generic.List[string]]::new()

foreach ($note in $notes) {
  $content = Get-Content -LiteralPath $note.FullName -Raw -Encoding UTF8
  $lines = $content -split "`r?`n"

  if ($lines.Count -lt 3 -or $lines[0] -ne '---') {
    $problems.Add("$($note.Name): missing YAML frontmatter")
  } else {
    $frontmatterEnd = [Array]::IndexOf($lines, '---', 1)
    if ($frontmatterEnd -lt 0) {
      $problems.Add("$($note.Name): unterminated YAML frontmatter")
    } else {
      $frontmatter = ($lines[0..$frontmatterEnd] -join "`n")
      foreach ($field in $requiredFields) {
        if ($frontmatter -notmatch "(?m)^$([regex]::Escape($field))") {
          $problems.Add("$($note.Name): missing $field")
        }
      }
    }
  }

  $fenceCount = ([regex]::Matches($content, '(?m)^```')).Count
  if (($fenceCount % 2) -ne 0) {
    $problems.Add("$($note.Name): unmatched fenced code block")
  }

  $mermaidCount = ([regex]::Matches($content, '(?m)^```mermaid\s*$')).Count
  if ($RequireMermaid -and $mermaidCount -eq 0) {
    $problems.Add("$($note.Name): Mermaid diagram required")
  }

  $wikilinks = [regex]::Matches($content, '\[\[([^\]|#]+)')
  foreach ($linkMatch in $wikilinks) {
    $target = $linkMatch.Groups[1].Value.Trim()
    if ($target -and -not (Test-Path -LiteralPath (Join-Path $NotesPath ($target + '.md')))) {
      $problems.Add("$($note.Name): unresolved wikilink [[$target]]")
    }
  }

  if ($RepoPath -and (Test-Path -LiteralPath $RepoPath -PathType Container)) {
    foreach ($sourceMatch in [regex]::Matches($content, $sourcePattern)) {
      $relativePath = $sourceMatch.Groups['path'].Value.Replace('/', '\\')
      $sourcePath = Join-Path $RepoPath $relativePath
      $lineNumber = [int]$sourceMatch.Groups['line'].Value
      if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
        $problems.Add("$($note.Name): source path not found: $relativePath`:$lineNumber")
        continue
      }
      $sourceLineCount = (Get-Content -LiteralPath $sourcePath -Encoding UTF8).Count
      if ($lineNumber -gt $sourceLineCount) {
        $problems.Add("$($note.Name): $relativePath`:$lineNumber exceeds $sourceLineCount lines")
      }
    }
  }

  "OK $($note.Name): lines=$($lines.Count), mermaid=$mermaidCount"
}

if ($problems.Count -gt 0) {
  'PROBLEMS:'
  $problems
  exit 1
}

"PASS: validated $($notes.Count) Markdown note(s)."
