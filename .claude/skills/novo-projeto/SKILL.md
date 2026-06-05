---
name: novo-projeto
description: Inicia projeto com SDD completo — diagnóstico, CLAUDE.md, specs/, decisions/ e registro no KANBAN/Paperclip. Ativar quando Luiz disser "novo projeto", "iniciar projeto", "/novo-projeto" ou pedir estrutura SDD para um projeto.
---

# Skill: novo-projeto

Guia criação completa de projeto com SDD — spec antes de qualquer implementação.

## Perguntas (verificar antes de agir)

Antes da Fase 1, verificar:

1. **Projeto existente** — buscar em `04_Projects/` se já existe pasta com nome similar. Se sim: "Já existe [[04_Projects/nome/CLAUDE]]. Quer atualizar ou criar separado?"
2. **Notas existentes** — buscar em `02_Knowledge/`, `05_Research/` e `10_Learning/` por notas sobre o tema do projeto. Se encontrar: "Há [[nota]] relacionada. Devo usá-la como base para o CLAUDE.md?"

## Fase 1 — Coleta (uma pergunta por vez)

Fazer em ordem, aguardar resposta antes de prosseguir:

1. "Qual o nome do projeto? (kebab-case, ex: crm-kermartin)"
2. "Descreva em 1 frase: o que este projeto entrega?"
3. "Qual equipe? dev / juridico / comercial / pesquisa / pessoal"
4. "Qual o tamanho estimado? pequeno (1-3 features) / médio (4-10) / grande (10+)"
5. "Tem integrações externas? (APIs, banco, serviços). Liste ou diga 'não'."
6. "Existe prazo ou entrega específica?"

## Fase 2 — Diagnóstico de Abordagem

Com base nas respostas, determinar abordagem:

| Critério | SDD Light | SDD Completo |
|----------|-----------|--------------|
| Tamanho | Pequeno | Médio/Grande |
| Integrações | Nenhuma/poucas | Múltiplas |
| Equipe | Solo | Multi-agente |
| Prazo | Aberto | Fixo com milestones |

**SDD Light:** apenas `CLAUDE.md` + features por sessão  
**SDD Completo:** `CLAUDE.md` + `specs/` + `decisions/` + templates preenchidos

Informar Luiz qual abordagem foi determinada e por quê. Pedir confirmação se SDD Completo.

## Fase 3 — Criação da Estrutura

### Sempre criar:

**`04_Projects/[nome]/CLAUDE.md`** a partir de `12_Modelos/template-projeto-sdd.md`:
- Preencher: nome, descrição, equipe, stack (se dev), fase atual, o que NÃO fazer
- Deixar seções de features e ADRs para o Luiz completar

### Se SDD Completo, criar também:

**`04_Projects/[nome]/specs/`** — pasta para feature specs  
**`04_Projects/[nome]/decisions/`** — pasta para ADRs do projeto

Criar arquivo placeholder `04_Projects/[nome]/specs/.gitkeep` e `decisions/.gitkeep` para manter pastas no git.

### Registrar no sistema:

**KANBAN.md** — adicionar na coluna `🔵 Ativa`:
```
- [ ] [[04_Projects/[nome]/CLAUDE.md|[NOME] — setup inicial]] #[equipe] #alta
```

**TAREFAS.md** — adicionar entrada na seção da equipe:
```
### T-[EQ]-NNN · [Nome] — setup inicial
- Status: 🔵 Ativa
- Projeto: [nome]
- Criado: YYYY-MM-DD
```

**MAPA.md** — adicionar na seção "Projetos Ativos":
```
### [Nome do Projeto]
- [[04_Projects/[nome]/CLAUDE.md]] — [descrição 1 frase]
```

**Paperclip** — criar issue:
```
POST http://127.0.0.1:3100/api/companies/6e2fe3bc-5f44-4070-af8c-98330bd47a39/issues
Authorization: Bearer $env:PAPERCLIP_API_KEY
Content-Type: application/json

{
  "title": "T-[EQ]-NNN · [Nome] — setup inicial SDD",
  "description": "Projeto iniciado com SDD.\n\n**Vault:** 04_Projects/[nome]/CLAUDE.md\n**Abordagem:** SDD Light/Completo\n**Equipe:** [equipe]",
  "status": "todo",
  "priority": "high",
  "projectId": "a3df0837-7017-424d-80c9-4924b0b458ab"
}
```

## Fase 4 — Confirmação

Exibir resumo:
- Arquivos criados (lista)
- Abordagem SDD adotada
- Próximo passo sugerido: `/nova-feature` para primeira feature

## Referências Vault (sugerir ao completar)

Ao criar a estrutura do projeto, sugerir:
- Notas de conhecimento base relevantes para o projeto (`02_Knowledge/` por domínio)
- Templates disponíveis em `12_Modelos/` que podem ser úteis
- Formato: "Notas relevantes para este projeto: [[nota1]], [[nota2]]"

## Restrições

- NUNCA criar projeto sem CLAUDE.md
- NUNCA iniciar implementação dentro desta skill — apenas estrutura
- Se projeto já existe em `04_Projects/`, avisar e perguntar se quer atualizar o CLAUDE.md existente
- Se Paperclip offline, criar no vault e avisar
