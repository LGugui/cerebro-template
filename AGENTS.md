# AGENTS.md — Instruções para IA

**Leia obrigatoriamente antes de qualquer ação:**
1. `99_System/AI-INSTRUCTIONS.md` — regras de comportamento, classificação e escrita
2. `99_System/CLAUDE.md` — contexto do dono, agentes e protocolo de sessão
3. `99_System/TAREFAS.md` — estado atual das tarefas (criar se não existir)

Resumo das regras principais:
- Classifique antes de criar: decida a pasta correta antes de escrever qualquer nota
- Prefira atualizar nota existente a criar duplicata
- Escreva em Markdown claro, objetivo e útil para recuperação futura
- Use `[[links internos]]` para conectar notas relacionadas
- NUNCA delete arquivos — arquive em `15_Arquivo/`
- Ao encerrar sessão: atualize `99_System/TAREFAS.md` com log

## Sistema de Agentes Ruflo

Agentes especializados em `.claude/agents/`. Ler como contexto antes de executar:

| Tarefa | Agente |
|---|---|
| Feature > 3h | `.claude/agents/sparc/specification.md` + `sparc/architecture.md` |
| Code review / bug complexo | `.claude/agents/core/reviewer.md` |
| Implementação limpa | `.claude/agents/core/coder.md` |
| Python complexo | `.claude/agents/v3/python-specialist.md` |
| TypeScript | `.claude/agents/v3/typescript-specialist.md` |
| Múltiplas subtarefas paralelas | `.claude/agents/swarm/adaptive-coordinator.md` |
