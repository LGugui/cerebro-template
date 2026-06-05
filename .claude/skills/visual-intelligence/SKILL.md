---
name: visual-intelligence
description: >
  Extrai padrões visuais de código (CSS, Tailwind, tokens, componentes React,
  scripts Figma) e referências visuais (screenshots, URLs, wireframes) para
  replicar e aprimorar designs. Ativar quando houver: código front-end para
  analisar estilos, screenshots/URLs de interfaces a estudar, ou pedido de
  replicação/melhoria visual. Regra obrigatória: Estrutura + Visual detalhado
  + Localização. Ativada automaticamente por /absorver quando entrada é visual.
---

# Skill: visual-intelligence

Transforma referências visuais — código, screenshots, URLs, wireframes — em
padrões documentados e prontos para replicar e aprimorar.

---

## Regra mestre

Toda análise ou produção visual entrega:

```
Estrutura + Visual detalhado + Localização + Padrão reutilizável
```

Não basta listar seções. Identificar: lógica visual, hierarquia, paleta,
componentes, estados, espaçamento, e ONDE cada elemento fica na tela.

---

## Quando ativar

| Entrada | Ativar? |
|---|---|
| URL de site, app, landing page, dashboard | ✅ sempre |
| Screenshot ou imagem de interface | ✅ sempre |
| Arquivo CSS / Tailwind / SCSS | ✅ sempre |
| Tokens de design (JS, JSON, YAML) | ✅ sempre |
| Componente React / Vue / Svelte com estilos | ✅ sempre |
| Script Figma (tokens, helpers, picasso) | ✅ sempre |
| "copie esse estilo", "replique", "melhore o visual" | ✅ sempre |
| Texto puro sem conteúdo visual | ❌ usar absorver padrão |

### Integração com /absorver

Quando `/absorver` recebe entrada de tipo visual (URL de site, screenshot,
template, código de componente), **chamar visual-intelligence automaticamente**
antes de salvar a nota. O resultado alimenta a seção "Spec Visual" da nota.

---

## Fase 1 — Identificar fonte

### 1A — Fonte: URL / Screenshot

```
WebFetch(url) → capturar HTML + CSS inline + meta OG
```

Se o visual não estiver claro só pelo texto:
- Tirar screenshot: desktop full-page, first fold, mobile
- Salvar em `10_Learning/Desenvolvimento/UI-UX/assets/[nome-ref]/`

### 1B — Fonte: Código (CSS / Tailwind / tokens / componentes)

Ler os arquivos relevantes:
```
Read(arquivo.css | tokens.js | Component.tsx)
```

Extrair:
- Variáveis CSS / tokens de cor, tipografia, espaçamento
- Classes utilitárias recorrentes (Tailwind)
- Padrões de componente (estrutura DOM, props, variantes)
- Animações e transições
- Breakpoints e responsividade

### 1C — Fonte: Script Figma (tokens_v2.js, picasso_*.js)

Ler o arquivo:
```
Read(figma-claude-bridge/_tokens_v2.js)
Read(figma-claude-bridge/picasso_*.js)
```

Extrair:
- Paleta de cores (constantes r,g,b)
- Tipografia (tamanhos, pesos, line-height)
- Espaçamento (grid, margens, paddings)
- Helpers disponíveis (rect, text, el, section, buildNavbar...)
- Padrões de componente (card, hero, navbar, sidebar)
- Regras de design (regras críticas documentadas)

---

## Fase 2 — Extração estruturada

Para cada referência, preencher o template:

### 2.1 Estrutura
- Quais seções/blocos existem (header, hero, grid, sidebar, footer...)
- Hierarquia de informação (o que domina a tela)
- Fluxo de leitura (Z-pattern, F-pattern, centralizado...)
- Navegação e estados (tabs, modals, tooltips, hover)

### 2.2 Visual detalhado

| Dimensão | Extrato |
|---|---|
| **Layout** | grid, flex, colunas, proporções |
| **Hierarquia** | H1→H2→body, tamanhos relativos |
| **Densidade** | compacto / arejado / balanced |
| **Paleta** | hex/rgb de cada cor com uso |
| **Tipografia** | família, tamanhos por nível, pesos, line-height |
| **Espaçamento** | base grid (4px? 8px?), margens, paddings padrão |
| **Bordas** | radius por tipo, border-width, cor |
| **Sombras** | offsets, blur, spread, cor, opacidade |
| **Componentes** | cards, botões, inputs, badges, chips, modais |
| **Estados** | hover, active, disabled, loading, error, empty |
| **Dark/Light** | bg principal, bg elevado, bg input, texto 1/2/3 |
| **Motion** | transições, durações, easing, animações |

### 2.3 Localização

| Elemento | Posição | X | Y | W | H | Função |
|---|---|---|---|---|---|---|
| Navbar | topo fixo | 0 | 0 | 100% | 64px | navegação |
| Hero | abaixo navbar | 0 | 64 | 100% | 420px | destaque |
| ... | ... | | | | | |

### 2.4 Lógica visual

Por que a tela foi organizada assim?
- Quais decisões de UX estão embutidas
- O que a hierarquia prioriza
- Quais padrões de atenção foram usados

---

## Fase 3 — Protocolo de Replicação

Após extração, gerar um **Guia de Replicação**:

```markdown
## Como replicar este padrão

### Setup
- Framework: [Next.js / Figma / CSS puro]
- Tokens: [onde definir as variáveis]

### Passo 1 — Definir tokens
[código de variáveis CSS / tailwind.config / tokens.js]

### Passo 2 — Estrutura base
[HTML/JSX/Figma script do layout]

### Passo 3 — Componentes-chave
[código dos componentes principais]

### Passo 4 — Estados
[hover, active, disabled, etc.]

### Armadilhas
- [o que não fazer]
- [o que costuma quebrar]
```

---

## Fase 4 — Protocolo de Aprimoramento

Sobre a referência original, sugerir melhorias em:

| Área | Verificar | Sugestão padrão |
|---|---|---|
| **Acessibilidade** | contrast ratio, foco visível | aumentar contraste T3 mínimo 4.5:1 |
| **Espaçamento** | consistência do grid | alinhar tudo ao grid 8px |
| **Hierarquia** | clareza do H1 | garantir 1 único ponto de atenção por seção |
| **Mobile** | responsividade | verificar 390px e 768px |
| **Estados** | hover/empty/loading | adicionar se faltarem |
| **Performance** | imagens, fontes | lazy load, subset de font |
| **Dark mode** | contraste em dark | testar fundo #050508 |

Ao aprimorar: manter a **intenção original** do design — não redesenhar,
apenas elevar o que está fraco.

---

## Fase 5 — Salvar no vault

### Destino da nota

```
10_Learning/Desenvolvimento/UI-UX/[nome-referencia].md
```

### Frontmatter

```yaml
---
data: YYYY-MM-DD
tipo: referencia
dominio: dev
tipo_nota: referencia
nivel: intermediário
status_nota: ativo
tags: [ui-ux, visual-intelligence, design-system, ...]
---
```

### Estrutura da nota

```markdown
# [Nome da Referência]

**Fonte:** [URL ou arquivo]
**Tipo:** [site / componente / script Figma / token file]
**Capturado em:** YYYY-MM-DD

---

## Estrutura
[resultado da Fase 2.1]

## Visual detalhado
[resultado da Fase 2.2]

## Localização
[resultado da Fase 2.3]

## Lógica visual
[resultado da Fase 2.4]

## Guia de Replicação
[resultado da Fase 3]

## Aprimoramentos sugeridos
[resultado da Fase 4]

## Padrão reutilizável
[snippet de código ou Figma script]

## Quando usar / evitar
- Usar:
- Evitar:

## Relacionado
[wikilinks do vault]
```

### Assets

Se a referência tiver imagens/screenshots relevantes:
```
10_Learning/Desenvolvimento/UI-UX/assets/[nome-ref]/
  ├── desktop-full.png
  ├── mobile.png
  └── componentes/
```

### Commit

```bash
git add 10_Learning/Desenvolvimento/UI-UX/[nota].md
git commit -m "feat: visual-intelligence — [nome da referência]

Padrão visual extraído: [resumo em 1 linha]
Fonte: [URL ou arquivo]

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>"
git push
```

---

## Template de saída rápida

Para análises inline (sem salvar nota):

```markdown
## [Nome da Referência]

**Estrutura:**
- [seções encontradas]

**Visual:**
- Layout: [descrição]
- Paleta: [cores]
- Tipografia: [fonte, tamanhos]
- Espaçamento: [grid base]
- Componentes: [lista]

**Localização:**
| Elemento | Posição | Função |
|---|---|---|

**Lógica visual:**
- [por que foi feito assim]

**Replicar com:**
[snippet ou passos]

**Aprimorar:**
- [sugestões de melhoria]
```

---

## Regras críticas

- ❌ Nunca analisar "em geral" — sempre extrair **valores concretos** (px, hex, ms)
- ❌ Nunca omitir a seção Localização — posição importa tanto quanto estilo
- ❌ Nunca copiar código literal sem adaptar ao contexto do projeto
- ✅ Sempre mapear para projetos reais do vault ao salvar
- ✅ Sempre incluir "quando usar / evitar" — padrão sem contexto é ruído
- ✅ Quando absorver código Figma: ler `_tokens_v2.js` como base de tokens existentes

---

## Referências do vault

- `10_Learning/Desenvolvimento/UI-UX/manual-producao-visual.md`
- `10_Learning/Desenvolvimento/UI-UX/glossario-logica-visual.md`
- `10_Learning/Desenvolvimento/UI-UX/framework-absorcao-selecao-ui-ux-visual.md`
- `10_Learning/Desenvolvimento/UI-UX/roadmap-inteligencia-visual-ia.md`
- `figma-claude-bridge/_tokens_v2.js` — tokens Party X (paleta, tipografia, helpers)
