---
name: melhorar
description: Diagnóstico de melhoria proativa. Escaneia projeto, sistema ou organização, aplica os 8 princípios de engenharia cognitiva como rubrica, ranqueia oportunidades por impacto/esforço e oferece opções concretas. Ativar com "/melhorar", "melhora X", "o que posso melhorar", "otimiza", "revisa o projeto" — ou automaticamente quando a IA detectar sinais de degradação.
---

# Skill: melhorar

Diagnóstico estruturado de melhoria. A skill **escaneia e sugere** — nunca executa sem aprovação.

## Perguntas (verificar antes de agir)

Se o escopo não estiver claro na mensagem, perguntar antes da Fase 1:

1. **Alvo** — "O que quer melhorar? (projeto específico / vault inteiro / integração/sistema / tudo)"
2. **Foco** — se alvo = projeto, perguntar: "Qual aspecto focar? (arquitetura / documentação / fluxo de agentes / qualidade das notas / tudo)"

Se alvo óbvio na mensagem, ir direto à Fase 1.

Funciona para:
- Projetos do vault (`04_Projects/`)
- Vault inteiro (organização, skills, fluxo de agentes)
- Sistemas externos (computador, apps integrados, automações, n8n, APIs)
- Qualquer combinação dos três

---

## Fase 1 — Identificar Escopo

Se o usuário não especificou o alvo, perguntar:

> "O que quer melhorar? Pode ser um projeto específico (ex: CRM, Unity), o vault inteiro, uma integração/sistema externo, ou tudo."

Se o alvo for claro na mensagem, pular esta pergunta e avançar.

**Mapeamento de escopo:**

| Alvo | Onde ler |
|------|----------|
| Projeto específico | `04_Projects/[nome]/CLAUDE.md` + `specs/` + `decisions/` |
| Vault inteiro | `99_System/CLAUDE.md` + `99_System/ARCHITECTURE.md` + `14_Indexes/MAPA.md` + `99_System/TAREFAS.md` |
| Sistema/computador | Perguntar: qual sistema? (n8n, Obsidian, apps, hardware) |
| Integração/automação | Perguntar: qual fluxo ou ferramenta? |

---

## Fase 2 — Leitura do Estado Atual

Para cada escopo identificado, ler em paralelo:

**Projeto:**
- `04_Projects/[nome]/CLAUDE.md` — estado atual, fase, convenções, backlog
- `04_Projects/[nome]/specs/` — specs existentes vs. features implementadas
- `04_Projects/[nome]/decisions/` — ADRs existentes
- `99_System/TAREFAS.md` e `99_System/KANBAN.md` — tarefas em aberto do projeto
- **Notas de melhoria do projeto** — varrer `04_Projects/[nome]/` por arquivos `*-tarefas.md`, `*-backlog.md`, `*-melhorias.md`; extrair seções com títulos como "Backlog", "Melhorias Propostas", "Pendente", "TODO"
- **Notas relacionadas no vault** — se CLAUDE.md referenciar notas externas (ex: `03_Entities/`, `02_Knowledge/`), ler as seções de backlog/melhoria dessas notas também

**Vault:**
- `99_System/CLAUDE.md`, `99_System/ARCHITECTURE.md`
- `99_System/TAREFAS.md`, `99_System/KANBAN.md`
- `14_Indexes/MAPA.md`
- `.claude/skills/` — skills existentes

**Sistema externo:**
- Perguntar ao usuário: como ele está configurado? Quais problemas percebe?
- Se for vault + integração: ler `06_Integrations/` se existir

---

**Consolidação de backlogs encontrados:**
- Unificar itens de todas as fontes lidas (CLAUDE.md, *-tarefas.md, KANBAN, specs)
- Deduplificar: se o mesmo item aparece no KANBAN e numa nota de backlog, contar como 1
- Distinguir: item já tem spec/tarefa criada → sinalizar como "rastreado"; item solto sem spec/tarefa → sinalizar como "não rastreado" (oportunidade)

---

## Fase 3 — Diagnóstico pelos 8 Princípios

Aplicar o checklist dos 8 Princípios de Engenharia Cognitiva como rubrica de avaliação.
Referência completa: `02_Knowledge/Desenvolvimento/engenharia-cognitiva-ia/08-principios-fundamentais.md`

Para cada princípio, marcar: ✅ OK / ⚠️ Parcial / ❌ Ausente

| # | Princípio | Verificação |
|---|-----------|-------------|
| P1 | Planejamento | Existe spec antes de código? CLAUDE.md preenchido? |
| P2 | Contexto persistente | CLAUDE.md + ARCHITECTURE + specs existem e estão atualizados? |
| P3 | LLM executa, não inventa | Features têm spec escrita? Ou foram implementadas "na cabeça"? |
| P4 | Modularização | Módulos têm responsabilidades claras? Há acoplamento excessivo? |
| P5 | Sessões menores | Features foram entregues em sessões isoladas? Commits atômicos? |
| P6 | Documentação como memória | Um agente novo entende o projeto em < 30 min lendo os arquivos? |
| P7 | Velocidade = risco de dívida | Há debt register? Decisões técnicas documentadas? |
| P8 | Humano responsável | Quem valida cada feature? Há critérios de aceitação escritos? |

**Adicionar verificações específicas por tipo de escopo:**

Para **sistemas/integrações:**
- Fluxo está documentado? (diagrama, README, n8n exportado)
- Há single point of failure? Fallback definido?
- Credenciais/chaves seguras? (nunca hardcoded)
- Automação tem log de execução acessível?

Para **vault:**
- Inbox processada? Notas sem frontmatter?
- MAPA.md atualizado com todos os projetos?
- Skills cobrindo os fluxos mais usados?
- TAREFAS.md com log recente?

Para **UI/UX / interface / site / dashboard:**
- A analise aplica `Estrutura + Visual detalhado + Localizacao`?
- Existem screenshots ou assets visuais preservados quando a referencia e visual?
- A interface tem hierarquia clara, densidade adequada, acao principal visivel e localizacao coerente?
- O dominio visual esta correto? (operacional, comercial, editorial, enterprise, tecnico)
- Ha validacao desktop/mobile?
- Referencias: `10_Learning/Desenvolvimento/UI-UX/manual-producao-visual.md` e `.claude/skills/visual-intelligence/SKILL.md`

---

## Fase 4 — Ranqueamento por Impacto × Esforço

Classificar cada gap encontrado em:

| | Esforço Baixo | Esforço Alto |
|-|--------------|-------------|
| **Impacto Alto** | 🔴 Quick Win — fazer agora | 🟠 Projeto — planejar |
| **Impacto Baixo** | 🟡 Fácil — fazer quando sobrar tempo | ⚫ Ignorar — custo > benefício |

Ordenar as opções: 🔴 primeiro, depois 🟠, depois 🟡.

---

## Fase 5 — Apresentar Opções ao Usuário

Exibir lista numerada, máximo 7 opções, com este formato:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 DIAGNÓSTICO DE MELHORIA — [ALVO]
 Avaliado em: DD/MM/YYYY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Princípios ✅ OK: [lista]
Princípios com gaps: [lista]

━━━ OPORTUNIDADES RANQUEADAS ━━━

🔴 QUICK WINS (alto impacto, baixo esforço)
  1. [Descrição clara da melhoria] — P[N]
     → Ação: [o que fazer] | Rota: /nova-feature | /adr | edição direta
  2. ...

🟠 PROJETOS (alto impacto, mais esforço)
  3. [Descrição] — P[N]
     → Ação: [o que fazer] | Rota: /nova-feature

🟡 FÁCEIS (baixo impacto, rápido)
  4. [Descrição] — P[N]
     → Ação: [o que fazer] | Rota: edição direta

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Qual quer executar? (número ou "todas as quick wins")
```

---

## Fase 6 — Rotear para Execução

Com base na escolha do usuário:

| Tipo de melhoria | Rota |
|-----------------|------|
| Feature nova / funcionalidade | Executar `/nova-feature` com contexto preenchido |
| Decisão técnica sem ADR | Executar `/adr` com contexto preenchido |
| Atualizar CLAUDE.md do projeto | Editar diretamente com confirmação |
| Criar spec retroativa | Criar `specs/feature-[nome].md` a partir do que existe |
| Refactoring | Criar spec de refactor em `specs/refactor-[area].md` e registrar no KANBAN |
| Atualizar documentação | Editar nota indicada diretamente |
| Sistema/integração externo | Perguntar acesso necessário e executar ou instruir o Luiz |

**Nunca executar sem confirmação do usuário.**

---

## Modo Autônomo (para outros agentes de IA)

Este modo permite que qualquer IA execute o diagnóstico sem interação do usuário e retorne um relatório estruturado para handoff.

### Como ativar modo autônomo
Incluir na mensagem: "modo autônomo" ou "retorne relatório estruturado" ou "handoff".

### Protocolo de leitura autônoma
1. Ler `99_System/CLAUDE.md` — identificar projetos ativos
2. Para cada projeto ativo, ler `04_Projects/[nome]/CLAUDE.md`
3. Ler `99_System/TAREFAS.md` — tarefas em aberto
4. Aplicar diagnóstico dos 8 princípios
5. Gerar relatório no formato abaixo (sem interação)

### Formato de saída para handoff

```
MELHORAR_REPORT:
  alvo: [nome do projeto/sistema]
  data: YYYY-MM-DD
  principios_ok: [P1, P3, P5]
  principios_gap: [P2, P4, P6, P7]
  oportunidades:
    - id: 1
      prioridade: quick_win
      descricao: "[descrição]"
      principio: P2
      acao: "[o que fazer exatamente]"
      rota: nova-feature | adr | edicao-direta | instrucao-usuario
    - id: 2
      ...
  proximos_passos: "[resumo em 2 frases para o próximo agente]"
```

Outro agente pode consumir este relatório e executar as ações indicadas em `rota`.

---

## Referências Vault (sugerir ao completar)

Ao apresentar o diagnóstico, incluir ao final:
- Links para notas de conhecimento base dos princípios violados (`02_Knowledge/Desenvolvimento/engenharia-cognitiva-ia/08-principios-fundamentais`)
- Links para templates disponíveis que podem ajudar (`12_Modelos/`)
- Formato: "Referências: [[08-principios-fundamentais]], [[template-projeto-sdd]]"

## Restrições

- **Nunca executar mudanças sem aprovação** — esta skill é diagnóstico + roteamento
- **Nunca marcar princípio como OK sem evidência** — checar arquivo, não assumir
- **Máximo 7 opções** — mais que isso vira lista inútil
- **Não misturar escopos** — se usuário pediu melhoria do CRM, não diagnosticar vault inteiro
- **Modo autônomo não executa** — apenas gera relatório para handoff
- Para sistemas externos sem acesso direto: descrever a melhoria e instruir o Luiz a executar
