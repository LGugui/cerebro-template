---
tipo: sistema
atualizado: 2026-06-05
---

# CLAUDE.md — Segundo Cérebro com Agentes IA

> **Arquitetura:** [[99_System/ARCHITECTURE]] — visão do vault como sistema
> **Regras completas de comportamento da IA:** [[99_System/AI-INSTRUCTIONS]]
> Leia `AI-INSTRUCTIONS.md` antes de qualquer operação no vault.

---

## O que é este vault

Segundo cérebro pessoal. Sistema numerado (00–99) com 16 pastas temáticas. Regras de classificação, escrita e atualização definidas em [[99_System/AI-INSTRUCTIONS]].

---

## Quem é o dono (preencher)

- Nome: [SEU NOME]
- Contexto profissional: [SEU CONTEXTO]
- Estilo de resposta: respostas diretas, concisas, próximos passos acionáveis

---

## Regras de IA (resumo — ver AI-INSTRUCTIONS.md para completo)

**Classificação:**
- Informação crua → `00_Inbox`
- Acionável em projeto → `04_Projects`
- Exploração/análise → `05_Research`
- Decisão rastreável → `07_Decisions`
- Reunião/conversa → `08_Conversations`
- Processo repetível → `09_Operations`
- Conhecimento permanente → `02_Knowledge`
- Pessoa/empresa/ferramenta → `03_Entities`
- Inativo/histórico → `15_Arquivo`

**Escrita:** Markdown claro, títulos objetivos, `[[links internos]]`, seções curtas, datas quando relevantes, próximos passos explícitos.

**Atualização:** Prefira atualizar nota existente. Evite duplicatas. Sugira consolidação quando houver notas próximas.

---

## 🤖 Sistema de Agentes

Este vault opera com uma hierarquia de agentes especialistas definidos em `.claude/agents/`.

### Hierarquia

```
DONO (aprova, decide, prioriza)
  └── CEO (orquestrador — delega, monitora, reporta)
        ├── Equipe Jurídica
        ├── Equipe Comercial
        ├── Equipe Dev
        ├── Equipe Pesquisa
        └── Equipe Pessoal
```

### Agentes do Vault

| Agente | Arquivo | Função |
|---|---|---|
| **CEO** | `.claude/agents/ceo.md` | Orquestrador geral — lê inbox, delega, roteia para Ruflo |
| **gerente-juridico** | `.claude/agents/gerente-juridico.md` | Coordena Equipe Jurídica |
| **gerente-comercial** | `.claude/agents/gerente-comercial.md` | Coordena Equipe Comercial |
| **gerente-dev** | `.claude/agents/gerente-dev.md` | Coordena Equipe Dev |
| **gerente-pesquisa** | `.claude/agents/gerente-pesquisa.md` | Coordena Equipe Pesquisa |
| **gerente-pessoal** | `.claude/agents/gerente-pessoal.md` | Coordena Equipe Pessoal |
| **executor** | `.claude/agents/executor.md` | Executa tarefas operacionais (universal) |
| **revisor** | `.claude/agents/revisor.md` | Valida e aprova entregas (universal) |
| **pesquisador** | `.claude/agents/pesquisador.md` | Busca contexto no vault (universal) |

### Agentes Ruflo (especializados)

| Categoria | Agente | Quando usar |
|---|---|---|
| **Dev** | `core/coder` | Implementação limpa |
| | `core/reviewer` | Code review |
| | `v3/python-specialist` | Python complexo |
| | `v3/typescript-specialist` | TypeScript |
| **SPARC** | `sparc/specification` | Spec de feature |
| | `sparc/architecture` | Design de sistema |
| **GitHub** | `github/pr-manager` | PRs |
| | `github/code-review-swarm` | Review paralelo |
| **Swarm** | `swarm/adaptive-coordinator` | Múltiplos agentes em paralelo |

### Roteamento automático (aplicar sem esperar pedido)

| Gatilho | Agente Ruflo |
|---|---|
| Feature > 3h estimada | `sparc-coord` |
| Review / merge / PR | `code-review-swarm` ou `pr-manager` |
| Bug sem causa conhecida | `core/reviewer` + `core/coder` |
| > 3 subtarefas paralelas | `swarm/adaptive-coordinator` |

---

## Arquivos de tarefas por equipe

Criar em `99_System/equipes/`:
- `juridica-tarefas.md` — T-JUR-XXX
- `comercial-tarefas.md` — T-COM-XXX
- `dev-tarefas.md` — T-DEV-XXX
- `pesquisa-tarefas.md` — T-PES-XXX
- `pessoal-tarefas.md` — T-PSS-XXX

---

## Como invocar agentes

```
# CEO distribuir inbox
"Use o agente CEO para processar a inbox"

# Gerente de equipe
"Use o gerente-dev para avançar a T-DEV-001"

# Fluxo completo
"Use o gerente-comercial para executar a T-COM-001 com executor e revisor"
```

---

## Regras de operação

### AO INICIAR SESSÃO:
1. Leia este arquivo (CLAUDE.md)
2. Leia `99_System/TAREFAS.md` — estado atual
3. Informe: pendências em aberto, foco sugerido para sessão

### AO CRIAR NOTAS:
- Toda nota DEVE ter frontmatter YAML
- Use wikilinks [[assim]] para conectar notas
- Nomes de arquivo: kebab-case sem acentos
- Ao criar nota relevante: adicione em `14_Indexes/MAPA.md`

### RESTRIÇÕES:
- NUNCA delete arquivos — mova para `15_Arquivo/`
- NUNCA modifique `99_System/` sem avisar o dono
- NUNCA crie tarefa sem card correspondente no `KANBAN.md`

### PORTABILIDADE:
- **Claude Code** → lê `CLAUDE.md`
- **Codex CLI** → lê `AGENTS.md`
- **Gemini CLI** → lê `GEMINI.md`

---

## Estrutura do vault

```
cerebro/
├── CLAUDE.md                    ← este arquivo
├── AGENTS.md                    ← redirecionamento Codex/Cursor
├── GEMINI.md                    ← redirecionamento Gemini
├── .claude/
│   ├── agents/                  ← agentes vault + Ruflo
│   ├── skills/                  ← skills disponíveis
│   ├── commands/                ← comandos slash
│   ├── hooks/                   ← pre-tool-validator
│   └── scripts/                 ← auto-commit-note
├── 99_System/
│   ├── CLAUDE.md                ← este arquivo
│   ├── TAREFAS.md               ← central do CEO (criar)
│   ├── KANBAN.md                ← painel visual (criar)
│   └── equipes/                 ← tarefas por equipe (criar)
├── 00_Inbox/
├── 01_Dashboard/
├── 02_Knowledge/
├── 03_Entities/
├── 04_Projects/
├── 05_Research/
├── 07_Decisions/
├── 08_Conversations/
├── 09_Operations/
├── 10_Learning/
├── 11_Conteudo/
├── 12_Modelos/
├── 14_Indexes/
└── 15_Arquivo/
```

## Frontmatter Schema (aplicar em todas as notas)

```yaml
---
data: YYYY-MM-DD
tipo: recurso | projeto | moc | área | referencia | sistema
dominio: dev | direito | comercial | pessoal | geral
tipo_nota: conceito | procedimento | caso | recurso | projeto | moc | sistema
nivel: básico | intermediário | avançado
status_nota: ativo | referência | arquivo
tags: []
---
```
