# auto-commit-note.ps1
# Dispara apos Write em pastas de notas — commita automaticamente
# Pastas-alvo: 00_Inbox, 10_Learning, 02_Knowledge, 05_Research, 03_Entities

$inputJson = [Console]::In.ReadToEnd()
if (-not $inputJson) { exit 0 }

try {
    $toolInput = $inputJson | ConvertFrom-Json
    $filePath = $toolInput.file_path
    if (-not $filePath) { exit 0 }
} catch { exit 0 }

$vaultRoot = "C:\Users\Luiz Fernando\Documents\Cérebro"

# Apenas pastas de notas atomicas
$targetFolders = @("00_Inbox", "10_Learning", "02_Knowledge", "05_Research", "03_Entities")
$relative = $filePath.Replace($vaultRoot + "\", "").Replace($vaultRoot + "/", "")
$folder = ($relative -split "[\\/]")[0]

if ($folder -notin $targetFolders) { exit 0 }
if ($filePath -notmatch "\.md$") { exit 0 }

# Verificar se ha mudanca staged ou unstaged
$status = git -C $vaultRoot status --porcelain $filePath 2>&1
if (-not $status) { exit 0 }

$fileName = [System.IO.Path]::GetFileNameWithoutExtension($filePath)
$shortName = if ($fileName.Length -gt 50) { $fileName.Substring(0, 50) } else { $fileName }

git -C $vaultRoot add $filePath 2>&1 | Out-Null
git -C $vaultRoot commit -m "chore: auto-commit — $shortName" 2>&1 | Out-Null

exit 0
