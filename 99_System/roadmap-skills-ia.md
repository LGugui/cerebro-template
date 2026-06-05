---
tipo: sistema
area: ia
status: ativo
atualizado: 2026-06-01
tags: [skills, claude, codex, roadmap, ia, vault]
---

# Roadmap de Aprimoramento das Skills IA

## Objetivo

Manter Claude, Codex e o vault usando as mesmas habilidades globais, com conexao clara, teste funcional e melhoria continua.

## Estado atual

- Claude skills locais: `.claude/skills/`
- Codex skills globais: `C:\Users\Luiz Fernando\.codex\skills\`
- Registro do vault: [[99_System/SKILLS-REGISTRY]]
- Entrada curta global: [[SKILLS]]
- Nova habilidade visual: `visual-intelligence`

## Fase 1 - Padronizacao

- [x] Criar skill `visual-intelligence` para Claude.
- [x] Criar skill `visual-intelligence` para Codex global.
- [x] Criar entrada global `SKILLS.md`.
- [x] Atualizar `SKILLS-REGISTRY.md`.
- [x] Conectar `AI-INSTRUCTIONS.md`.

## Fase 2 - Funcionalidade

- [x] Validar que cada skill Claude tem `SKILL.md`.
- [x] Validar frontmatter com `name` e `description`.
- [x] Validar presença da skill global do Codex.
- [x] Criar script de auditoria recorrente em `99_System/scripts/audit-skills.ps1`.
- [ ] Rodar auditoria semanal via `/revisao-semanal`.

## Fase 3 - Integracao Operacional

- [x] `/absorver` deve acionar leitura visual quando entrada for site/template/screenshot/UI.
- [x] `/pesquisar` deve extrair camada visual em pesquisas de UI/UX.
- [x] `/melhorar` deve avaliar visual em projetos com interface.
- [x] `/nova-feature` deve incluir spec visual quando feature tocar UI.
- [x] `gerente-dev` deve orientar executor a usar visual-intelligence em UI.

## Fase 4 - Biblioteca Visual

- [x] Moqups websites com assets visuais.
- [x] Moqups site maps com assets visuais.
- [x] Moqups admin dashboards com assets visuais.
- [ ] Criar biblioteca de padroes visuais por dominio.
- [ ] Criar templates React/Tailwind para padroes aprovados.

## Fase 5 - Qualidade

- [ ] Adicionar score visual em specs importantes.
- [ ] Exigir screenshot desktop/mobile antes de concluir UI.
- [ ] Criar checklist de regressao visual.
- [ ] Linkar decisoes visuais relevantes em ADRs.

## Regra permanente

Qualquer IA trabalhando com UI/UX no vault deve usar:

```text
Estrutura + Visual detalhado + Localizacao
```
