# PreToolUse hook — valida chamadas Bash antes de executar
# Recebe input via stdin como JSON do Claude Code

$inputJson = [Console]::In.ReadToEnd()
if (-not $inputJson) { exit 0 }

try {
    $toolInput = $inputJson | ConvertFrom-Json
    $command = $toolInput.command
    if (-not $command) { exit 0 }
} catch {
    exit 0
}

# Padroes perigosos que requerem confirmacao extra
$dangerous = @(
    "rm -rf",
    "Remove-Item -Recurse -Force",
    "git reset --hard",
    "git push --force",
    "git push -f",
    "rmdir /s"
)

foreach ($pattern in $dangerous) {
    if ($command -like "*$pattern*") {
        Write-Host "BLOQUEADO: Padrao '$pattern' detectado. Confirme explicitamente antes de executar."
        exit 2
    }
}

exit 0
