---
name: briefing
description: Gera briefing matinal com tarefas ativas e 3 prioridades do dia. Ativar com /briefing, "briefing", "prioridades de hoje" ou via cron às 8h.
---

# Skill: briefing

Gera resumo executivo do dia com base no estado atual do vault e na última sessão.

## Fase 1 — Ler estado atual

1. Ler `99_System/TAREFAS.md` — extrair tarefas com status `🔵 Ativa` ou `🔄 Em Andamento` por equipe
2. Glob `99_System/logs/session-*.md` ordenado por data decrescente — ler o mais recente
3. Extrair seções `## Próximos passos` e `## Status das tarefas` do session log
4. Ler `99_System/KANBAN.md` — verificar coluna `🔍 Revisão` (tarefas aguardando validação)

## Fase 2 — Gerar 3 prioridades

Com base nos dados coletados, determinar as 3 prioridades mais importantes para hoje:

**Critérios (em ordem):**
1. Tarefas bloqueantes ou com prazo iminente
2. Tarefas `🔄 Em Andamento` — manter momentum
3. Próximos passos da última sessão
4. Tarefas `🔵 Ativa` de maior prioridade

**Formato das prioridades:**
```
1. [T-XXX-NNN] Título — [equipe] — motivo da prioridade
2. ...
3. ...
```

## Fase 3 — Formatar briefing

```
## Briefing Matinal — YYYY-MM-DD

**Última sessão:** [data] — [resumo 1 linha do session log]

**Tarefas em andamento:**
- [T-XXX-NNN]: [título] ([equipe])

**Aguardando revisão:**
- [se houver na coluna 🔍 Revisão]

**🎯 3 Prioridades de hoje:**
1. [prioridade 1]
2. [prioridade 2]
3. [prioridade 3]

**Contexto:**
Ler: [[caminho/CLAUDE.md mais relevante para as prioridades]]
```

## Fase 4 — Enviar para WhatsApp (se variável configurada)

Se `$env:BRIEFING_WEBHOOK_URL` estiver definida:

```powershell
$body = @{ text = "[conteúdo do briefing formatado como texto plano]" } | ConvertTo-Json
Invoke-RestMethod -Uri $env:BRIEFING_WEBHOOK_URL -Method POST -Body $body -ContentType "application/json"
```

Se variável não configurada: exibir briefing no terminal apenas.

## Fase 5 — Gravar log do briefing

Adicionar entrada em `99_System/logs/briefing-YYYYMMDD.md`:

```markdown
---
data: YYYY-MM-DD
hora: HH:MM
tipo: briefing
---

[conteúdo completo do briefing]
```

## Referências Vault

Ao concluir, sugerir:
- `[[99_System/TAREFAS]]` — para atualizar status após revisar prioridades
- `[[14_Indexes/IDX-{domínio da prioridade 1}]]` — contexto do domínio prioritário

## Restrições

- NUNCA inventar tarefas — usar apenas o que está em TAREFAS.md e KANBAN.md
- Se TAREFAS.md vazio ou sem tarefas ativas: informar e sugerir `/nova-tarefa`
- Se session log não existir (primeira sessão): briefing apenas com tarefas do KANBAN
