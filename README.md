# Cérebro — Template de Segundo Cérebro com Agentes IA

Template de vault Obsidian com sistema completo de agentes IA integrado.

## O que é

Sistema de segundo cérebro (PKM) com hierarquia de agentes Claude Code, 60+ skills Ruflo e automações prontas. Funciona com Claude Code, Codex CLI e Gemini CLI.

## Estrutura de agentes

```
CEO (orquestrador)
  ├── Gerentes de equipe (Jurídica, Comercial, Dev, Pesquisa, Pessoal)
  ├── Executor (universal)
  ├── Revisor (universal)
  └── Pesquisador (universal)

Agentes Ruflo (especializados):
  ├── SPARC (specification → pseudocode → architecture → code → refinement)
  ├── GitHub (pr-manager, code-review-swarm)
  ├── Core (coder, reviewer, tester, researcher)
  ├── Swarm (adaptive, hierarchical, mesh)
  ├── V3 (python, typescript, database specialists)
  └── Hive-Mind, Consensus, Flow-Nexus...
```

## Pré-requisitos

- [Obsidian](https://obsidian.md/) — abrir o vault
- [Claude Code](https://claude.ai/code) — agentes e skills
- Plugin Obsidian: **Kanban** (para KANBAN.md)
- Node.js 18+ (para MCPs)

## Setup inicial

```bash
git clone https://github.com/LGugui/cerebro-template.git meu-vault
cd meu-vault
```

Abrir pasta no Obsidian. Abrir Claude Code no mesmo diretório.

Editar `99_System/CLAUDE.md` — preencher "Quem é o dono" com seus dados.

## MCPs recomendados

```bash
# Documentação ao vivo de bibliotecas
claude mcp add context7 -- npx -y @upstash/context7-mcp

# Integração GitHub (PRs, issues, actions)
claude mcp add github -- npx -y @modelcontextprotocol/server-github
```

## Plugins recomendados

Instalar via Claude Code:

```
/plugin install figma@claude-plugins-official
/plugin install vercel@claude-plugins-official
/plugin install caveman@caveman
/plugin install claude-code-setup@claude-plugins-official
```

| Plugin | Skill | Para quê |
|---|---|---|
| `figma` | `figma:*` | Escrever frames/componentes no Figma via Bridge |
| `vercel` | `vercel:*` | Deploy, variáveis de ambiente, logs |
| `caveman` | `caveman:*` | Respostas ultra-enxutas, diff review |
| `claude-code-setup` | análise de automações | Recomenda hooks, MCPs, agents para o projeto |

## Skills disponíveis (via Claude Code)

### Vault — Fluxo de trabalho

| Skill | Comando | Para quê |
|---|---|---|
| inicio | `/inicio` | Menu interativo de início de sessão |
| processar-inbox | `/processar-inbox` | CEO processa e distribui inbox |
| encerrar | `/encerrar` | Encerra sessão e atualiza TAREFAS.md |
| status | `/status` | Relatório de status do vault |
| revisao-semanal | `/revisao-semanal` | Review semanal de progresso |

### Vault — Criação de conteúdo

| Skill | Comando | Para quê |
|---|---|---|
| absorver | `/absorver [URL\|texto]` | Transforma entrada em nota de conhecimento |
| nova-tarefa | `/nova-tarefa` | Cria tarefa com card no Kanban |
| nova-feature | `/nova-feature` | Especifica e cria feature de desenvolvimento |
| novo-projeto | `/novo-projeto` | Inicializa estrutura de projeto |
| adr | `/adr` | Cria Architecture Decision Record |
| briefing | `/briefing` | Gera briefing de projeto |
| melhorar | `/melhorar` | Aprimora nota existente |
| pesquisar | `/pesquisar` | Pesquisa no vault com contexto |
| obsidian | `/obsidian` | Operações avançadas no vault |

### Vault — Processamento de arquivos

| Skill | Comando | Para quê |
|---|---|---|
| pdf | `/pdf [arquivo]` | Extrai conhecimento de PDF |
| docx | `/docx [arquivo]` | Extrai conhecimento de DOCX |
| xlsx | `/xlsx [arquivo]` | Extrai dados de planilha |

### Design & Visual

| Skill | Comando | Para quê |
|---|---|---|
| visual-intelligence | auto | Extrai padrões visuais de código/screenshots/URLs |
| picasso | `/picasso` | Redesign máximo — sistema dark premium + Figma Bridge |
| impeccable | `/impeccable` | 7 domínios de qualidade visual (tipo, cor, espaço...) |

### Desenvolvimento

| Skill | Comando | Para quê |
|---|---|---|
| browser | `/browser` | Automação de browser (web scraping, testes) |
| pair-programming | `/pair-programming` | Sessão de pair programming estruturada |
| performance-analysis | `/performance-analysis` | Análise de performance de código |
| skill-builder | `/skill-builder` | Cria nova skill para o vault |
| hooks-automation | `/hooks-automation` | Configura hooks Claude Code |
| dual-mode | `/dual-mode` | Alterna entre modos Claude/Codex |

### Ruflo — SPARC

| Skill | Comando | Para quê |
|---|---|---|
| sparc-methodology | `/sparc` | SPARC completo (Spec→Pseudo→Arch→Code→Refine) |

### Ruflo — GitHub

| Skill | Comando | Para quê |
|---|---|---|
| github-code-review | `/github-code-review` | Review de PR com swarm |
| github-multi-repo | `/github-multi-repo` | Gerenciar múltiplos repositórios |
| github-project-management | `/github-project-management` | Issues, milestones, roadmap |
| github-release-management | `/github-release-management` | Releases, changelogs, tags |
| github-workflow-automation | `/github-workflow-automation` | GitHub Actions |

### Ruflo — Swarm & Orquestração

| Skill | Comando | Para quê |
|---|---|---|
| swarm-orchestration | `/swarm` | Orquestrar swarm de agentes |
| swarm-advanced | `/swarm-advanced` | Topologias avançadas (mesh, hierárquica) |
| hive-mind-advanced | `/hive-mind` | Collective intelligence patterns |
| agentic-jujutsu | `/agentic-jujutsu` | Técnicas avançadas de prompting agentico |
| stream-chain | `/stream-chain` | Pipeline de processamento em stream |

### Ruflo — Memória & AgentDB

| Skill | Comando | Para quê |
|---|---|---|
| agentdb-advanced | auto | Banco de dados vetorial para agentes |
| agentdb-learning | auto | Aprendizado persistente entre sessões |
| agentdb-memory-patterns | auto | Padrões de memória de longo prazo |
| agentdb-optimization | auto | Otimização de queries no AgentDB |
| agentdb-vector-search | auto | Busca vetorial semântica |
| reasoningbank-agentdb | auto | Banco de raciocínio persistente |
| reasoningbank-intelligence | auto | Inteligência acumulada de sessões |

### Ruflo — V3 Especialistas

| Skill | Comando | Para quê |
|---|---|---|
| v3-core-implementation | auto | Implementação Python/TS de alta qualidade |
| v3-ddd-architecture | auto | Domain-Driven Design |
| v3-integration-deep | auto | Integração profunda de sistemas |
| v3-mcp-optimization | auto | Otimização de MCP servers |
| v3-memory-unification | auto | Unificação de sistemas de memória |
| v3-performance-optimization | auto | Performance e benchmarking |
| v3-security-overhaul | auto | Revisão de segurança completa |
| v3-swarm-coordination | auto | Coordenação avançada de swarm |
| v3-cli-modernization | auto | Modernização de CLIs |

### Ruflo — Flow Nexus

| Skill | Comando | Para quê |
|---|---|---|
| flow-nexus-neural | auto | Treinamento de redes neurais na nuvem |
| flow-nexus-platform | auto | Operações na plataforma Flow Nexus |
| flow-nexus-swarm | auto | Swarms na infraestrutura Flow Nexus |

### Outros

| Skill | Comando | Para quê |
|---|---|---|
| paperclip | `/paperclip` | Sync com Paperclip (notas Apple) |
| verification-quality | auto | Verificação de qualidade de outputs |
| worker-benchmarks | auto | Benchmarks de workers paralelos |
| worker-integration | auto | Integração de workers headless |

## Hooks automáticos

| Hook | Evento | Ação |
|---|---|---|
| PreToolUse | qualquer | Bloqueia `rm -rf`, `git reset --hard`, `DROP TABLE` |
| PostToolUse (Write) | criar .md em pastas de conhecimento | Auto-commit da nota |

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

## Primeira sessão

```
"Use o agente CEO para inicializar o vault e criar os arquivos de equipe"
```

ou

```
/inicio
```

## Créditos

Agentes Ruflo baseados em [ruvnet/ruflo](https://github.com/ruvnet/ruflo).
Vault e skills vault customizados.
