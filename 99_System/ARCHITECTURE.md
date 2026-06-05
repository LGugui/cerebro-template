---
data: 2026-05-18
tipo: sistema
status: ativo
tags: [arquitetura, vault, sistema, sdd]
---

# ARCHITECTURE.md — Vault Cérebro

> Documento de arquitetura do vault. Descreve o que é o sistema, como está estruturado e por que.
> Leia junto com CLAUDE.md para entender o contexto completo.

---

## Visão

**O que é:** segundo cérebro do Luiz Fernando — sistema de conhecimento, planejamento e execução operado com IA.

**Propósito:** centralizar contexto de vida, trabalho e aprendizado de forma que qualquer IA possa retomar qualquer projeto com menos de 30 minutos de leitura.

**Princípio central:** o vault é a memória externa da IA. O que não está escrito aqui não existe na próxima sessão.

---

## Domain Model — Glossário Formal

| Termo | Definição |
|-------|-----------|
| **Vault** | Este repositório Obsidian — o cérebro completo |
| **Nota** | Arquivo Markdown atômico: 1 ideia, 1 arquivo |
| **Inbox** | Captura rápida de informação não processada (`00_Inbox/`) |
| **Processamento** | Mover nota da inbox para a pasta correta com frontmatter |
| **Tarefa** | Ação concreta com responsável, prazo e equipe — rastreada no Paperclip |
| **Projeto** | Conjunto de features com escopo, spec e roadmap em `04_Projects/` |
| **Feature** | Entregável único de um projeto — tem spec antes de ser executada |
| **Spec** | Documento escrito antes de qualquer implementação — define o quê, não o como |
| **ADR** | Architecture Decision Record — registo de decisão importante com contexto e trade-offs |
| **Equipe** | Conjunto de agentes especializados por área (Jurídica, Comercial, Dev, Pesquisa, Pessoal) |
| **Agente** | LLM com papel fixo e contexto mínimo carregado — opera por sessão |
| **CEO** | Agente orquestrador — distribui tarefas entre equipes, monitora KANBAN |
| **Gerente** | Agente que coordena uma equipe — lê tarefas da equipe, instrui executor |
| **Executor** | Agente que realiza operações no vault (criar, editar, mover notas) |
| **Revisor** | Agente que valida qualidade antes de aprovar entrega |
| **Pesquisador** | Agente que busca contexto no vault antes de executar |
| **Sessão** | Uma conversa com a IA — começa com contexto limpo, termina com commit e documentação |
| **Handoff** | Artefato que passa contexto de uma sessão/agente para o próximo |
| **Drift** | Divergência entre o estado real do vault e o que a IA acredita que é o estado |
| **Kanban** | `99_System/KANBAN.md` — painel visual de status das tarefas |
| **Paperclip** | Sistema de gerenciamento de tarefas local (`localhost:3100`) — fonte da verdade para execução |

---

## Estrutura de Pastas e Justificativa

```
Cérebro/
├── 99_System/           ← controle da IA: CLAUDE.md, agentes, tarefas, kanban
│   ├── CLAUDE.md        ← âncora obrigatória — lida em toda sessão
│   ├── ARCHITECTURE.md  ← este arquivo
│   ├── TAREFAS.md       ← central do CEO, estado atual, log de sessões
│   ├── KANBAN.md        ← painel visual — sincronizado com status das tarefas
│   ├── QUEM-SOU.md      ← identidade e contexto pessoal do Luiz
│   └── equipes/         ← backlog por equipe (juridica, comercial, dev, pesquisa, pessoal)
│
├── 00_Inbox/            ← captura rápida + daily notes (processa antes de qualquer sessão)
├── 01_Dashboard/        ← HOME.md — visão geral ativa
├── 02_Knowledge/        ← conhecimento consolidado e permanente
│   └── Dev/
│       └── engenharia-cognitiva-ia/  ← manual de engenharia (framework governante)
├── 03_Entities/         ← pessoas, empresas, ferramentas (entidades do domínio)
├── 04_Projects/         ← projetos ativos com spec, roadmap e features
├── 05_Research/         ← pesquisas em andamento (output: nota em 02_Knowledge)
├── 06_Integrations/     ← documentação de APIs e automações externas
├── 07_Decisions/        ← ADRs de decisões importantes
├── 08_Conversations/    ← reuniões e alinhamentos relevantes
├── 09_Operations/       ← processos recorrentes e SSOPs
├── 10_Learning/         ← aprendizado ativo (em andamento — vira 02_Knowledge quando consolidado)
├── 11_Conteudo/          ← ideias e conteúdo em elaboração
├── 12_Modelos/        ← templates de notas e specs
├── 13_Attachments/      ← imagens, PDFs, anexos
├── 14_Indexes/          ← MOCs e MAPA.md — índices de navegação
└── 15_Arquivo/          ← projetos e notas concluídas ou obsoletas
```

**Por que esta estrutura:** numeração garante ordenação visual consistente. Separação `02_Knowledge` (permanente) vs `10_Learning` (em andamento) evita misturar conhecimento consolidado com estudo ativo. `07_Decisions` centraliza rastreabilidade. `99_System` agrupa tudo que controla a IA.

---

## Arquitetura de Agentes

```
Luiz (humano — aprova, decide, prioriza)
  └── CEO (orquestrador)
        ├── Equipe Jurídica   → gerente-juridico + executor + revisor + pesquisador
        ├── Equipe Comercial  → gerente-comercial + executor + revisor + pesquisador
        ├── Equipe Dev        → gerente-dev + executor + revisor + pesquisador
        ├── Equipe Pesquisa   → gerente-pesquisa + executor + revisor + pesquisador
        └── Equipe Pessoal    → gerente-pessoal + executor + revisor
```

**Princípio:** cada agente opera com contexto mínimo — só carrega o que precisa para seu papel. Minimiza drift entre sessões.

---

## Framework Governante

Todo projeto e feature do vault seguem os princípios de `02_Knowledge/Desenvolvimento/engenharia-cognitiva-ia/`:

| Princípio | Como se aplica no vault |
|-----------|------------------------|
| P1 — Planejamento é multiplicador | Diagnóstico antes de começar qualquer projeto (`11-perguntas-diagnostico`) |
| P2 — Contexto persistente | CLAUDE.md + ARCHITECTURE.md obrigatórios por sessão |
| P3 — LLM executa, não inventa | Spec antes de qualquer feature. Agente lê spec, não inventa |
| P4 — Modularização | Agentes especializados com contexto reduzido |
| P5 — Sessões menores | 1 tarefa = 1 sessão. Commit + doc ao terminar |
| P6 — Documentação como memória | TAREFAS.md, ADRs, specs — o que não está escrito não existe |
| P7 — Velocidade aumenta débito | Revisor valida antes de aprovar. Nunca fechar tarefa com TODO no código |
| P8 — Humano responsável | Luiz aprova antes de avançar fase ou projeto |

---

## Decisões Arquiteturais

Ver `07_Decisions/` para ADRs completos:

- [[07_Decisions/ADR-001-estrutura-vault]] — por que a numeração 00-99
- [[07_Decisions/ADR-002-sistema-agentes]] — por que hierarquia CEO + equipes
- [[07_Decisions/ADR-003-paperclip]] — por que Paperclip como fonte da verdade
- [[07_Decisions/ADR-004-engenharia-cognitiva]] — por que adotar o manual como framework governante

---

## Saúde do Vault

| Artefato | Propósito |
|----------|-----------|
| [[99_System/DEBT-REGISTER]] | Dívidas técnicas conscientes — registrar antes de aceitar trade-off |
| [[02_Knowledge/Desenvolvimento/engenharia-cognitiva-ia/12-metricas-dashboards]] | Dashboard semanal, sinais de degradação, retrospectiva |

---

## Métricas de Saúde do Vault

| Métrica | Meta | Como medir |
|---------|------|-----------|
| Tempo de onboarding | < 30 min | Tempo para IA retomar projeto parado sem o Luiz |
| Inbox vazia | 0 notas não processadas | `ls 00_Inbox/ | wc -l` |
| ADRs por decisão | 1 ADR por decisão relevante | Contar em `07_Decisions/` |
| Projetos com spec | 100% | Todo projeto em `04_Projects/` tem spec |
| Tarefas sem equipe | 0 | Todo item do KANBAN tem equipe atribuída |
