# Cérebro — Template de Segundo Cérebro com Agentes IA

Template de vault Obsidian com sistema completo de agentes IA integrado.

## O que é

Sistema de segundo cérebro (PKM) com hierarquia de agentes Claude Code, skills Ruflo e automações prontas. Funciona com Claude Code, Codex CLI e Gemini CLI.

## Estrutura de agentes

```
CEO (orquestrador)
  ├── Gerentes de equipe (Jurídica, Comercial, Dev, Pesquisa, Pessoal)
  ├── Executor (universal)
  ├── Revisor (universal)
  └── Pesquisador (universal)

Agentes Ruflo (especializados):
  ├── SPARC (spec → pseudocode → arch → code → refine)
  ├── GitHub (pr-manager, code-review-swarm)
  ├── Core (coder, reviewer, tester, researcher)
  ├── Swarm (adaptive, hierarchical, mesh)
  └── V3 (python, typescript, database specialists)
```

## Como usar

### 1. Pré-requisitos

- [Obsidian](https://obsidian.md/) — abrir o vault
- [Claude Code](https://claude.ai/code) — agentes e skills
- Plugin Obsidian: **Kanban** (para KANBAN.md)

### 2. Setup inicial

```bash
git clone https://github.com/[usuario]/cerebro-template.git meu-vault
cd meu-vault
```

Abrir pasta no Obsidian. Abrir Claude Code no mesmo diretório.

### 3. Personalizar

Editar `99_System/CLAUDE.md` — preencher "Quem é o dono" com seus dados.

### 4. Primeira sessão

```
"Use o agente CEO para inicializar o vault e criar os arquivos de equipe"
```

## Estrutura de pastas

```
00_Inbox/       → captura rápida, daily notes
01_Dashboard/   → visão geral
02_Knowledge/   → conhecimento permanente
03_Entities/    → pessoas, empresas, ferramentas
04_Projects/    → projetos ativos
05_Research/    → pesquisas em andamento
07_Decisions/   → ADRs e decisões
08_Conversations/ → reuniões e conversas
09_Operations/  → processos repetíveis
10_Learning/    → aprendizado ativo
11_Conteudo/    → ideias de conteúdo
12_Modelos/     → templates de nota
14_Indexes/     → MOCs e índices (MAPA.md)
15_Arquivo/     → notas inativas
99_System/      → configuração do vault
```

## Skills disponíveis (via Claude Code)

| Skill | Uso |
|---|---|
| `/absorver [URL]` | Transforma URL/texto em nota de conhecimento |
| `/processar-inbox` | CEO processa e distribui inbox |
| `/nova-tarefa` | Cria tarefa com card no Kanban |
| `/encerrar` | Encerra sessão e atualiza TAREFAS.md |
| `/status` | Relatório de status do vault |

## Hooks automáticos

- **PreToolUse:** bloqueia comandos destrutivos (rm -rf, git reset --hard)
- **PostToolUse (Write):** auto-commit de notas em pastas de conhecimento

## MCPs recomendados

```bash
claude mcp add context7 -- npx -y @upstash/context7-mcp
claude mcp add github -- npx -y @modelcontextprotocol/server-github
```

## Créditos

Estrutura de agentes baseada em [Ruflo](https://github.com/ruvnet/ruflo) + agentes vault customizados.
