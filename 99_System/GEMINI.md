# GEMINI.md — Instruções para IA

Este vault pertence ao Luiz Fernando.

**Leia obrigatoriamente antes de qualquer ação:**
1. `99_System/AI-INSTRUCTIONS.md` — regras de comportamento, classificação e escrita
2. `99_System/CLAUDE.md` — contexto do dono, agentes e protocolo de sessão
3. `99_System/TAREFAS.md` — estado atual das tarefas

**Leia também quando o tema envolver Figma, design, modelagem visual, trading, bolsa ou agentes treináveis:**
- `99_System/contexts/ctx-agentes-especializados-figma-trading.md`

Resumo das regras principais (completo em AI-INSTRUCTIONS.md):
- Classifique antes de criar: decida a pasta correta antes de escrever qualquer nota
- Prefira atualizar nota existente a criar duplicata
- Escreva em Markdown claro, objetivo e útil para recuperação futura
- Use `[[links internos]]` para conectar notas relacionadas
- NUNCA delete arquivos — arquive em `15_Arquivo/`
- Ao encerrar sessão: atualize `99_System/TAREFAS.md` com log
- Figma/design exige briefing, design system e validação visual
- Trading/bolsa exige backtest, paper trading e risk gate antes de execução real

## Sistema de Agentes Ruflo

Este vault tem agentes especializados em `.claude/agents/`. Ler como contexto antes de executar:

| Tarefa | Agente — ler como contexto |
|---|---|
| Feature > 3h (qualquer stack) | `.claude/agents/sparc/specification.md` + `sparc/architecture.md` |
| Code review / bug complexo | `.claude/agents/core/reviewer.md` |
| Implementação limpa | `.claude/agents/core/coder.md` |
| Python (Aprimorador, Radar, Big Bang) | `.claude/agents/v3/python-specialist.md` |
| TypeScript / Three.js / Vite | `.claude/agents/v3/typescript-specialist.md` |
| Múltiplas subtarefas paralelas | `.claude/agents/swarm/adaptive-coordinator.md` |

**Regra:** ao receber tarefa dev, verificar gatilhos acima e ler o agente correspondente antes de executar.
