param (
    [Parameter(Mandatory = $true)]
    [string]$TargetWorkspace
)

$RepoRoot = Split-Path -Parent $PSScriptRoot
$DestSkill = Join-Path $TargetWorkspace ".agents\skills\bricks-acss-stack"

if (Test-Path $DestSkill) { Remove-Item -Recurse -Force $DestSkill }
New-Item -ItemType Directory -Path $DestSkill -Force | Out-Null

Copy-Item -Path (Join-Path $RepoRoot "SKILL.md") -Destination (Join-Path $DestSkill "SKILL.md") -Force
Copy-Item -Path (Join-Path $RepoRoot "references") -Destination (Join-Path $DestSkill "references") -Recurse -Force

Write-Host "Installed bricks-acss-stack into workspace: $DestSkill" -ForegroundColor Green
