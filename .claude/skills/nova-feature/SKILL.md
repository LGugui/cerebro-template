---
name: nova-feature
description: Cria feature spec completa antes de implementar. Ativar quando Luiz disser "nova feature", "nova funcionalidade", "/nova-feature" ou pedir spec de uma feature.
---

# Skill: nova-feature

Cria spec da feature antes de qualquer linha de código — princípio SDD.

## Perguntas (verificar antes de agir)

Antes de iniciar a Fase 1, verificar:

1. **Pesquisa existente** — buscar em `05_Research/` e `10_Learning/` por notas com palavras-chave da feature. Se encontrar: "Encontrei [[nota]] relacionada. Quer que eu leia antes de criar a spec?"
2. **Feature vs. extensão** — se o nome soa como extensão de feature existente, verificar `04_Projects/[projeto]/specs/` e perguntar: "Esta feature está relacionada a [[feature-existente]]? Devo criar spec separada ou estender a existente?"

Se não houver ambiguidade, ir direto à Fase 1.

## Fase 1 — Coleta (uma pergunta por vez)

Fazer em ordem, aguardar resposta:

1. "Qual o projeto? (ex: crm-kermartin, csharp-unity)"
2. "Qual o nome da feature? (kebab-case, ex: paginacao-contatos)"
3. "Objetivo em 1 frase: o que esta feature entrega para o usuário?"
4. "Prioridade? alta / media / baixa"
5. "Quais arquivos ou módulos serão afetados? (pode listar ou dizer 'não sei ainda')"
6. "Critérios de aceitação — quando podemos considerar pronta? (liste 2-5 itens)"
7. "O que NÃO deve ser implementado nesta feature? (scope lock)"

## Fase 2 — Verificação de Pré-condições

1. Verificar se `04_Projects/[projeto]/CLAUDE.md` existe
   - Se não existir: avisar e sugerir `/novo-projeto` antes de continuar
2. Verificar se `04_Projects/[projeto]/specs/` existe
   - Se não existir: criar a pasta

## Fase 3 — Criar Feature Spec

Criar `04_Projects/[projeto]/specs/feature-[nome].md`:

```markdown
---
data: YYYY-MM-DD
tipo: spec
projeto: [projeto]
feature: [nome]
status: pendente
prioridade: [alta|media|baixa]
---

# Feature: [Nome Legível]

## Objetivo

[Objetivo em 1 frase — copiado da coleta]

## Critérios de Aceitação

- [ ] [critério 1]
- [ ] [critério 2]
- [ ] [critério N]

## Arquivos Afetados

- `[caminho/arquivo.ext]` — [o que muda]

## O que NÃO implementar (Scope Lock)

- [item 1]
- [item 2]

## Notas Técnicas

[Espaço para decisões técnicas, dependências, riscos]

## Spec Visual (se tocar UI/UX)

- Estrutura:
- Visual detalhado:
- Localizacao dos elementos:
- Logica visual:
- Estados:
- Responsivo:
- Acessibilidade:
- Referencias visuais:

## Log de Implementação

| Data | Ação |
|------|------|
| YYYY-MM-DD | Spec criada |
```

## Fase 4 — Registrar no Sistema

**KANBAN.md** — adicionar na coluna `🔵 Ativa`:
```
- [ ] [[04_Projects/[projeto]/specs/feature-[nome]|[PROJETO] · [Nome]]] #[equipe] #[prioridade]
```

**TAREFAS.md** — adicionar entrada:
```
### T-[EQ]-NNN · [Projeto] — [Nome da Feature]
- Status: 🔵 Ativa
- Spec: 04_Projects/[projeto]/specs/feature-[nome].md
- Prioridade: [prioridade]
```

**Paperclip** — criar issue:
```
POST http://127.0.0.1:3100/api/companies/6e2fe3bc-5f44-4070-af8c-98330bd47a39/issues
Authorization: Bearer $env:PAPERCLIP_API_KEY
Content-Type: application/json

{
  "title": "T-[EQ]-NNN · [Projeto] — [Nome da Feature]",
  "description": "**Objetivo:** [objetivo]\n\n**Critérios:**\n- [critério 1]\n- [critério 2]\n\n**Spec:** 04_Projects/[projeto]/specs/feature-[nome].md",
  "status": "todo",
  "priority": "high|medium|low",
  "projectId": "a3df0837-7017-424d-80c9-4924b0b458ab"
}
```

## Fase 5 — Prompt de Abertura de Sessão

Exibir pronto para copiar:

```
## Sessão: [Projeto] — [Nome da Feature]

**Spec:** `04_Projects/[projeto]/specs/feature-[nome].md`
**Objetivo:** [objetivo]
**Critérios de aceitação:** [lista]
**Scope lock (NÃO implementar):** [lista]

Leia o CLAUDE.md do projeto antes de implementar.
Ao terminar: commit + atualizar spec com log + encerrar via /encerrar.
```

## Referências Vault (sugerir ao completar)

Ao criar a spec, sugerir:
- Notas de pesquisa relacionadas encontradas em `05_Research/` ou `10_Learning/`
- ADRs existentes do projeto em `04_Projects/[projeto]/decisions/` que podem impactar a feature
- Formato: "Notas relacionadas: [[nota1]], [[nota2]]"

## Restrições

- NUNCA criar feature sem spec escrita
- NUNCA incluir implementação nesta skill — apenas spec e registro
- NUNCA avançar se CLAUDE.md do projeto não existir
- Se Paperclip offline, criar no vault e avisar
