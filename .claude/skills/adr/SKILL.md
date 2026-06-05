---
name: adr
description: Cria Architecture Decision Record formal. Ativar quando Luiz disser "criar ADR", "registrar decisão", "/adr" ou precisar documentar uma decisão técnica ou arquitetural.
---

# Skill: adr

Cria ADR a partir do template padrão — decisão técnica com contexto, opções e consequências.

## Perguntas (verificar antes de agir)

Antes da Fase 1, verificar:

1. **ADR anterior sobre o tema** — listar `07_Decisions/` e `04_Projects/[projeto]/decisions/`. Se encontrar ADR relacionado: "Já existe [[ADR-NNN-tema]]. Esta decisão supera ou complementa?"
2. **Escopo não informado** — se o usuário não especificou vault ou projeto, perguntar: "Esta decisão é do vault inteiro ou de um projeto específico? (vault / [nome do projeto])"

## Fase 1 — Coleta (uma pergunta por vez)

Fazer em ordem, aguardar resposta:

1. "Esta decisão é do vault inteiro ou de um projeto específico?"
   - Vault → arquivo em `07_Decisions/`
   - Projeto → arquivo em `04_Projects/[projeto]/decisions/`
2. "Se projeto: qual o nome do projeto?"
3. "Qual o título da decisão? (ex: 'Usar Supabase como banco de dados')"
4. "Qual o contexto? O que motivou esta decisão?"
5. "Quais opções foram consideradas? (liste 2-3 com prós e contras)"
6. "Qual foi a decisão final e por quê?"
7. "Quais as consequências? (positivas e trade-offs)"
8. "Quando revisar? (condição que tornaria a decisão obsoleta)"

## Fase 2 — Determinar Número do ADR

**Se vault-level:**
- Listar arquivos em `07_Decisions/`
- Encontrar maior número ADR existente
- Próximo = maior + 1 (formato: ADR-001, ADR-002, etc.)

**Se projeto:**
- Verificar se `04_Projects/[projeto]/decisions/` existe
  - Se não, criar a pasta
- Listar arquivos na pasta
- Determinar próximo número da sequência do projeto

## Fase 3 — Criar ADR

A partir de `12_Modelos/template-adr.md`, criar o arquivo preenchido:

**Vault-level:** `07_Decisions/ADR-NNN-[slug-do-titulo].md`  
**Projeto:** `04_Projects/[projeto]/decisions/ADR-NNN-[slug-do-titulo].md`

Preencher todos os campos com as respostas coletadas.

O slug deve ser o título em kebab-case sem acentos (ex: "Usar Supabase" → `usar-supabase`).

## Fase 4 — Registrar Referência

**Se vault-level:**
- Adicionar em `99_System/ARCHITECTURE.md` na seção de ADRs (se existir):
  ```
  | ADR-NNN | [Título] | aceito | YYYY-MM-DD |
  ```

**Se projeto:**
- Adicionar em `04_Projects/[projeto]/CLAUDE.md` na seção de decisões (se existir):
  ```
  | ADR-NNN | [Título] | aceito |
  ```

## Fase 5 — Confirmação

Exibir:
- Caminho do arquivo criado
- Número ADR gerado
- Síntese da decisão (1 frase)

## Referências Vault (sugerir ao completar)

Ao criar o ADR, sugerir:
- ADRs relacionados no mesmo domínio (do vault ou projeto)
- Notas de conhecimento base que embasam a decisão tomada
- Formato: "Decisões relacionadas: [[ADR-NNN]], [[ADR-NNN]]"

## Restrições

- NUNCA criar ADR sem preencher todos os campos — ADR incompleto é pior que nenhum
- O número ADR deve ser único — verificar sempre antes de criar
- Não retroativamente renumerar ADRs existentes
- Se decisão ainda não foi tomada, não criar ADR — ADR registra decisão aceita, não debate aberto
