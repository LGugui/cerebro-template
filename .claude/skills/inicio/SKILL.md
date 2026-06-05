---
name: inicio
description: Menu interativo de início de sessão com seleção de domínio + tarefa. Carrega contexto específico por combinação escolhida. Executar automaticamente ao iniciar qualquer sessão no vault. Ativar com "/inicio", "menu", "início", "começar" ou automaticamente via hook SessionStart.
---

# Skill: inicio

Menu de orientação de sessão com roteamento por domínio + tarefa. Lê estado atual do vault antes de exibir — nunca mostra dados desatualizados.

---

## Fase 1 — Leitura de Estado (antes de exibir qualquer coisa)

Ler em paralelo:
- `99_System/TAREFAS.md` — contar tarefas ativas + último log de sessão
- `99_System/KANBAN.md` — contar cards na coluna 🔵 Ativa
- `14_Indexes/MAPA.md` — extrair lista de projetos ativos
- `00_Inbox/` — contar arquivos .md não processados
- `10_Learning/` — Glob nos 20 .md mais recentes; ler frontmatter; contar com `gerado_por: aprimorador` + `data` nos últimos 7 dias → guardar como `N_APRIMORADOR`

### Fase 1b — Ler sessão anterior (memória)

1. Glob `99_System/logs/session-*.md` — ordenar por nome (data/hora) — pegar o mais recente
2. Se existir e data do arquivo for dos últimos 3 dias:
   - Extrair seção `## Próximos passos` → guardar como `PROXIMOS_PASSOS`
   - Extrair linha de resumo (primeiro bullet de `## O que foi feito`) → guardar como `RESUMO_SESSAO`
   - Extrair `dominio:` do frontmatter → guardar como `DOMINIO_ANTERIOR`
3. Se não existir ou for mais antigo que 3 dias: `PROXIMOS_PASSOS = null`

---

## Fase 2 — Seletor de Domínio

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 VAULT CÉREBRO — DD/MM/YYYY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Tarefas: X  |  Inbox: X arquivos
 Último log: [data do último log em TAREFAS.md]
 [se RESUMO_SESSAO: "Última sessão ([data]): [RESUMO_SESSAO]"]
 [se N_APRIMORADOR > 0: "Aprimorador: N notas novas (7 dias)"]

 Em qual domínio quer trabalhar?

 1. Dev          (C#/Unity, IA, Automação)
 2. Direito      (Faculdade, Estágio, Jurídico)
 3. Comercial    (Kermartin/CRM, Vendas)
 4. Pessoal      (Hábitos, Finanças, Rotina)
 5. Geral        (sem filtro de domínio)
 [se N_APRIMORADOR > 0:]
 A. Notas do Aprimorador    (N novas)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Aceitar número, letra ou palavra como resposta. "A" ou "aprimorador" → pular para Fase 5 (Notas do Aprimorador).

---

## Fase 3 — Seletor de Tarefa

Após escolha do domínio, exibir:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Domínio: [NOME DO DOMÍNIO ESCOLHIDO]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 O que vai fazer?

 a) Estudar    → conhecimento filtrado por nível
 b) Trabalhar  → projetos ativos + tarefas
 c) Planejar   → KANBAN + backlog + metas
 d) Pesquisar  → knowledge base + índices
 e) Livre      → sem filtro, vault completo
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Mapear resposta para nome de tarefa:
- "a" / "estudar" / "estudo" → `estudar`
- "b" / "trabalhar" / "trabalho" / "executar" → `trabalhar`
- "c" / "planejar" / "planejamento" → `planejar`
- "d" / "pesquisar" / "pesquisa" → `pesquisar`
- "e" / "livre" / "chat" → executar Fase 4e (livre)

Mapear domínio para slug:
- 1 / "dev" → `dev`
- 2 / "direito" / "juridico" → `direito`
- 3 / "comercial" / "crm" / "kermartin" → `comercial`
- 4 / "pessoal" → `pessoal`
- 5 / "geral" → `geral`

---

## Fase 4 — Carregar Contexto e Exibir Submenu

### 4a — Domínios com context bundle (dev / direito / comercial / pessoal)

**Para tarefa = estudar, trabalhar ou planejar:**

1. Ler `99_System/contexts/ctx-{dominio}-{tarefa}.md`
2. Executar as leituras da seção "Ler primeiro (obrigatório)" do bundle
3. Exibir o submenu da seção "Submenu sugerido" do bundle
4. Aguardar ação do usuário

**Para tarefa = pesquisar:**

Executar skill `/pesquisar` com escopo = domínio escolhido.

**Para tarefa = livre:**

```
 Domínio: [X] | Modo livre
 Contexto carregado. Pode falar.
```

Sair do menu. IA fica disponível com o contexto do domínio.

---

### 4c — Sugerir referências e memória (executar após 4a ou 4b)

**Após carregar context bundle e exibir submenu**, antes de aguardar ação do usuário:

1. Buscar as 3 notas mais recentemente modificadas no domínio escolhido
   - Filtrar por `dominio: [slug]` no frontmatter
   - Ordenar por data de modificação

2. Se encontrar notas recentes, exibir:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Notas recentes em [DOMÍNIO]:
   • [[nota-recente-1]] (modificada há X dias)
   • [[nota-recente-2]] (modificada há X dias)
   • [[nota-recente-3]] (modificada há X dias)

 Quer que eu carregue alguma? (número ou Enter para pular)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

3. Se `PROXIMOS_PASSOS` existir, exibir após a lista de notas:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Da última sessão:
   [PROXIMOS_PASSOS — bullet por bullet]

 Quer continuar de onde parou? (s/n)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

4. Aguardar resposta e carregar nota escolhida se houver.

---

### 4b — Domínio Geral

**Geral + estudar:**
Ler `14_Indexes/MAPA.md`. Exibir todos os domínios e perguntar qual área de conhecimento focar.

**Geral + trabalhar:**
Exibir lista de todos os projetos ativos (extraída do MAPA.md). Usuário escolhe → ler `04_Projects/[projeto]/CLAUDE.md`. Submenu igual ao antigo (estado / feature / tarefa / backlog).

**Geral + planejar:**
Ler `99_System/TAREFAS.md` (últimas 3 entradas), `99_System/KANBAN.md` (todas ativas), `99_System/DEBT-REGISTER.md` (se existir).
Exibir:
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 RESUMO — última semana
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

O que foi feito:
  [resumo dos últimos logs do TAREFAS.md]

Em andamento agora (KANBAN Ativa):
  [lista de cards ativos com equipe]

Dívidas técnicas abertas:
  [lista do DEBT-REGISTER se houver]

Sugestão de foco:
  [tarefa de maior prioridade no KANBAN]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Quer executar alguma dessas tarefas agora?
```

**Geral + pesquisar:**
Executar skill `/pesquisar` sem filtro de domínio.

**Geral + livre:**
```
Pronto. Pode falar — estou aqui.
```

---

## Fase 5 — Notas do Aprimorador

**Objetivo:** revisar o que o Aprimorador inseriu no vault automaticamente. Para cada nota, mostrar contexto suficiente para decidir se vale manter, arquivar ou ignorar.

### Fase 5a — Coletar notas

1. Glob `10_Learning/**/*.md` ordenado por data de modificação (mais recentes primeiro)
2. Ler frontmatter de cada arquivo
3. Filtrar: `gerado_por: aprimorador` + `data` nos últimos 7 dias
4. Limitar a 15 notas por sessão

### Fase 5b — Exibir cabeçalho

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 NOTAS DO APRIMORADOR — últimos 7 dias
 N nota(s) criadas automaticamente
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### Fase 5c — Para cada nota, exibir ficha + perguntar ação

```
━━━ [X/N] ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 📄 [Título da nota]
 Pasta:     [pasta relativa no vault]
 Data:      [data de criação]
 Domínio:   [area do frontmatter]
 Nível:     [nivel do frontmatter ou —]
 Aplicação: [aplicacao do frontmatter ou —]

 Resumo:
   [primeiros 200 chars do conteúdo após frontmatter]

 → Importância estimada: [avaliar com base em nivel + aplicacao + área]
 → Motivo para manter:   [1 frase justificando relevância para o vault]
 → Motivo para arquivar: [1 frase se conteúdo for redundante, datado ou genérico demais]

 Ação: (m) manter  (a) arquivar  (Enter) pular  (s) sair
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Avaliar importância** com base em:
- `nivel: avançado` → mais relevante que `básico`
- `aplicacao` menciona projeto ativo do vault → relevância alta
- Área alinhada com agenda (Direito / Dev / IA) → relevância alta
- Conteúdo já coberto por nota existente → baixa, sugerir arquivar

### Fase 5d — Executar ação escolhida

| Ação | O que fazer |
|------|------------|
| `m` / manter | Adicionar `revisado: true` e `revisado_em: YYYY-MM-DD` ao frontmatter. Confirmar. |
| `a` / arquivar | Confirmar antes. Mover arquivo para `15_Arquivo/[mesma subpasta]/`. Registrar no log. |
| Enter / pular | Passar para próxima nota sem ação. |
| `s` / sair | Encerrar revisão e mostrar resumo. |

**Nunca arquivar sem confirmação explícita.**

### Fase 5e — Resumo final

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 REVISÃO CONCLUÍDA
 Mantidas:  X  |  Arquivadas: X  |  Puladas: X
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Voltar ao menu? (s/n)
```

---

## Navegação global

- "voltar" ou "menu" em qualquer momento → retornar ao menu principal (Fase 2)
- "domínio" em qualquer momento → retornar ao seletor de domínio (Fase 2)
- "tarefa" em qualquer momento → retornar ao seletor de tarefa (Fase 3) com domínio mantido

---

## Restrições

- NUNCA exibir contagens sem ter lido os arquivos antes
- NUNCA executar ação sem confirmação (exceto "Conversa livre" e "Livre")
- Aceitar número, letra ou palavra como resposta em qualquer fase
- Se projeto não tiver CLAUDE.md: avisar e sugerir `/novo-projeto`
- Se inbox vazia: omitir contagem de inbox do cabeçalho
- Domínio escolhido permanece ativo durante toda a sessão até troca explícita
