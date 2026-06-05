---
data: 2026-05-29
tipo: contexto
status: ativo
tags: [ia, agentes, figma, trading, contexto-global]
---

# Contexto Global - Agentes Especializados Figma e Trading

> Leia este contexto quando a sessão envolver Figma, design, modelagem visual, mercado financeiro, bolsa, trading, backtesting, Interactive Brokers, agentes treináveis ou automação de compra/venda de ativos.

---

## Princípio Global

Esses domínios são de alto impacto. A IA deve operar com método, não improviso.

Regra:

```text
pesquisar -> especificar -> validar -> executar pequeno -> documentar
```

---

## Segmentos no Vault

### Figma + Claude

- [[04_Projects/agente-figma-claude/CLAUDE]] - projeto principal.
- [[14_Indexes/moc-agente-figma-claude]] - índice navegável.
- [[04_Projects/agente-figma-claude/pesquisa-figma-claude]] - pesquisa geral.
- [[04_Projects/agente-figma-claude/pesquisa-repositorios-github]] - repositórios GitHub.
- [[04_Projects/agente-figma-claude/workflow-operacional]] - workflows.
- [[04_Projects/agente-figma-claude/promptbook]] - prompts reutilizáveis.

### Agente Trading Mercado Financeiro

- [[04_Projects/agente-trading-mercado-financeiro/CLAUDE]] - projeto principal.
- [[14_Indexes/moc-agente-trading]] - índice navegável.
- [[04_Projects/agente-trading-mercado-financeiro/pesquisa-repositorios-github]] - repositórios GitHub.
- [[04_Projects/agente-trading-mercado-financeiro/arquitetura]] - arquitetura.
- [[04_Projects/agente-trading-mercado-financeiro/risk-guardrails]] - limites e bloqueios.
- [[04_Projects/agente-trading-mercado-financeiro/roadmap]] - fases.

---

## Regras Globais - Figma

Quando o Luiz pedir algo sobre Figma, design, modelagem visual, wireframe, UI, UX, design system ou Claude mexendo no Figma:

1. Consultar primeiro [[14_Indexes/moc-agente-figma-claude]].
2. Se for criação/alteração de canvas, usar workflow de [[04_Projects/agente-figma-claude/workflow-operacional]].
3. Se envolver MCP, priorizar `figma/mcp-server-guide` e Figma MCP oficial.
4. Se envolver escrita programática no canvas, estudar antes `TalkToFigma`, `FigClaw` e Plugin API.
5. Se envolver design system, consultar `work-with-design-systems` e regras de tokens/variables.
6. Nunca criar design sem briefing mínimo.
7. Sempre procurar design system existente antes de criar tokens/componentes novos.
8. Trabalhar em passos pequenos e validar visualmente.

Fluxo padrão:

```text
briefing
  -> inspecionar arquivo
  -> resolver design system
  -> planejar tela/modelagem
  -> criar incrementalmente
  -> screenshot/validação
  -> documentar decisão
```

Guardrails:

- Não alterar design system de produção sem aprovação.
- Não hardcodar cores se houver variables.
- Não duplicar componente existente.
- Não rodar plugin/MCP de terceiro sem considerar segurança.
- Não executar código Figma gerado por LLM sem revisar quando o arquivo for importante.

---

## Regras Globais - Trading/Mercado Financeiro

Quando o Luiz pedir algo sobre bolsa, ações, mercado financeiro, Interactive Brokers, robô de trading, backtest, agente treinável ou compra/venda automática:

1. Consultar primeiro [[14_Indexes/moc-agente-trading]].
2. Separar pesquisa, backtest, paper trading e execução real.
3. Nunca propor execução real antes de validação.
4. Nunca deixar modelo enviar ordem direto para corretora.
5. Sempre incluir risk manager/risk gate.
6. Começar por estratégia simples antes de ML/RL.
7. Tratar RL como experimental até vencer baseline fora da amostra.
8. Usar paper trading antes de dinheiro real.

Fluxo padrão:

```text
market-data
  -> feature-engineering
  -> strategy-research
  -> backtest
  -> walk-forward-validation
  -> paper-trading
  -> risk-gate
  -> execution-broker
  -> monitoring
```

Guardrails:

- Sem margem no início.
- Sem opções no início.
- Sem futuros alavancados no início.
- Sem ordens market no início.
- Usar conta cash.
- Usar ordens limitadas.
- Registrar logs de decisão e execução.
- Simular custos, spread e slippage.
- Validar sem vazamento temporal.

---

## Repositórios de Referência

### Figma

- Figma MCP Server Guide - https://github.com/figma/mcp-server-guide
- TalkToFigma - https://github.com/grab/cursor-talk-to-figma-mcp
- Figma Context MCP - https://github.com/GLips/Figma-Context-MCP
- Antonytm Figma MCP - https://github.com/antonytm/figma-mcp-server
- FigClaw - https://github.com/PavelLaptev/FigClaw
- Work with Design Systems - https://github.com/natdexterra/work-with-design-systems
- F2C MCP - https://github.com/f2c-ai/f2c-mcp
- design-extract - https://github.com/Manavarya09/design-extract

### Trading

- FinRL - https://github.com/AI4Finance-Foundation/FinRL
- FinRL-Trading - https://github.com/AI4Finance-Foundation/FinRL-Trading
- QuantConnect Lean - https://github.com/QuantConnect/Lean
- vectorbt - https://github.com/polakowo/vectorbt
- PyBroker - https://github.com/edtechre/pybroker
- Backtrader - https://github.com/mementum/backtrader
- aat - https://github.com/AsyncAlgoTrading/aat
- ib_insync - https://github.com/erdewit/ib_insync
- Freqtrade - https://github.com/freqtrade/freqtrade

