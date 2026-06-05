---
name: status
description: Exibe relatório visual rápido do estado atual do vault — tarefas por status, por equipe, prazos e bloqueios. Ativar quando Luiz disser "status", "como estão as tarefas", "/status" ou pedir visão geral do vault. Não cria nem modifica arquivos.
---

# Skill: status

Lê arquivos do vault e exibe relatório visual no terminal. Somente leitura — nenhum arquivo é criado ou modificado.

## Passos

1. **Ler** `99_System/TAREFAS.md`
2. **Ler** os 5 arquivos de equipe em `99_System/equipes/`:
   - `juridica-tarefas.md`
   - `comercial-tarefas.md`
   - `dev-tarefas.md`
   - `pesquisa-tarefas.md`
   - `pessoal-tarefas.md`

3. **Gerar relatório no terminal** com este formato:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 STATUS DO VAULT — DD/MM/YYYY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 TAREFAS POR STATUS
  🔵 Ativa         X
  🔄 Em Andamento  X
  🔍 Revisão       X
  🚨 Bloqueada     X
  ✅ Concluída     X
  ─────────────────
  Total            X

📋 TAREFAS POR EQUIPE
  ⚖️  Jurídica     X ativas
  💼 Comercial     X ativas
  💻 Dev           X ativas
  📚 Pesquisa      X ativas
  🏠 Pessoal       X ativas

⏰ PRAZOS NOS PRÓXIMOS 7 DIAS
  ID · Título — prazo DD/MM (equipe)
  ...

🚨 BLOQUEIOS ATIVOS
  ID · Título — motivo do bloqueio
  ...

📅 ÚLTIMA SESSÃO
  Data e resumo do último log em TAREFAS.md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Restrições

- **Somente leitura** — não criar, não editar, não mover nenhum arquivo
- Se dado não encontrado, exibir "—" em vez de erro
