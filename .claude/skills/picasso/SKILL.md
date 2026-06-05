---
name: picasso
description: Modo de design máximo. Combina sistema visual dark premium (impeccable 7 domínios), DICE poster-forward pattern, anime.js motion patterns e Figma Claude Bridge para redesign de alta energia. Ativa quando: "redesenha", "refaz", "melhora UI", "aplica picasso", "visual mais forte", ou trabalho em telas Figma de eventos/apps dark.
---

# Picasso — Design Intelligence Máxima

Skill de redesign completo que funde todas as capacidades de design disponíveis no vault. Nível: consumer-grade, energia de produto premium, polish de nightlife/eventos.

---

## Pilares ativos

### 1. Impeccable — 7 Domínios

**Tipografia** — escala modular ratio 1.25, base 15px:
```
11px  labels, badges, captions
13px  nav, meta, secundário
15px  body, card title
17px  subheading
20px  section label
24px  heading 3
32px  heading 2
44px  heading 1 (hero secondary)
56px  hero primary
80px  display (splash)
96px  super display (one use only, with gradient)
```
Letter-spacing: -0.02em em displays e headings.

**Cor — sistema dark com gradient energy:**

| Token | Hex | RGB (0-1) | Uso |
|---|---|---|---|
| `bg` | #050508 | (0.020, 0.020, 0.031) | Fundo base |
| `surface` | #0F0F14 | (0.059, 0.059, 0.078) | Cards, painéis |
| `raised` | #18181F | (0.094, 0.094, 0.122) | Inputs, botões secondary |
| `border` | #252530 | (0.145, 0.145, 0.188) | Linhas, divisores |
| `accent` | #8B5CF6 | (0.545, 0.361, 0.965) | CTA primário |
| `accent-2` | #EC4899 | (0.925, 0.286, 0.600) | Acento secundário |
| `gradient` | accent→accent-2 | — | Elemento hero, glow |
| `text-1` | #FFFFFF | (1, 1, 1) | Texto primário |
| `text-2` | #9191A0 | (0.569, 0.569, 0.627) | Secundário |
| `text-3` | #5C5C6E | (0.361, 0.361, 0.431) | Muted |
| `success` | #22C55E | — | Disponível |
| `warning` | #EAB308 | — | Em Breve |
| `danger` | #EF4444 | — | Esgotando/Urgente |

**Atmosfera (simular gradiente com camadas no Figma):**
```
Layer 1 (base):    solid bg
Layer 2 (glow 1):  ellipse 800×600, accent, op 0.12-0.18, upper-right
Layer 3 (glow 2):  ellipse 400×300, accent-2, op 0.06-0.10, center-right
Layer 4 (streak):  rectangle full×1, accent, op 0.08, horizontal
Layer 5 (dark-floor): rectangle full-w × 200, #000, op 0.5, bottom
```

**Espaçamento** — grid 8px: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64, 80, 96, 128

**Border-radius:**
- 4px: micro badges
- 8px: botões, chips
- 10px: cards poster
- 16px: modais, painéis
- 100px: pills

**Botões:**
- 32px: compact (nav)
- 44px: secondary
- 52px: primary CTA

---

### 2. DICE Poster-Forward — Padrão de Card

Referência: DICE FM — melhor padrão de card para eventos/produtos com imagem forte.

**Princípio:** item É o poster. A imagem domina. Texto aparece sobre ela.

```
Card 420×280
├── Image area: 420×200 (71%)
│   ├── Category chip: top-left (12,12)
│   ├── Status chip: top-right
│   ├── Gradient overlay: bottom 100px → dark
│   ├── Title: 15px Medium, x=16, y=image_bottom-48 (SOBRE imagem)
│   └── Meta: 11px Regular, x=16, y=image_bottom-28 (SOBRE imagem)
└── Info strip: 420×80
    ├── Capacity/progress bar: topo
    ├── Price/label: left
    └── CTA: 100×36, right
```

**Regra crítica:** nunca empilhar título + meta ABAIXO da imagem — mata o impacto.

---

### 3. Anime.js — Intenção de Motion

Anotar intenção de animação com badges no frame. Padrões principais:

**Splash/Entrada:**
```javascript
anime({ targets: '.ring', scale: [0, 1], opacity: [0, 1], delay: stagger(120), ease: 'outExpo' })
anime({ targets: '.logo-letter', translateY: [40, 0], opacity: [0, 1], delay: stagger(80) })
anime({ targets: '.progress-fill', width: ['0%', '100%'], duration: 1200 })
```

**Hero:**
```javascript
anime({ targets: '.glow-blob', scale: [0.95, 1.05], duration: 4000, loop: true, alternate: true })
anime({ targets: '.hero-content', translateY: [20, 0], opacity: [0, 1], delay: 400 })
```

**Cards:**
```javascript
animate('.card', { translateY: [24, 0], opacity: [0, 1], delay: stagger(80) })
// hover: scale(1.02), translateY(-2px), duration: 200ms
```

---

### 4. FOMO / Urgência Visual

Padrões para telas transacionais:

| Elemento | Onde | Código |
|---|---|---|
| Live viewers | Hero | `● N pessoas vendo agora` (dot pulsante) |
| Social proof | Abaixo hero | `João M. comprou · 3 min` (ticker) |
| Lote warning | Card / hero | `⚡ Lote encerra em X dias` |
| Capacity bar | Todo card | Verde < 80%, laranja 80-95%, vermelho > 95% |
| Price lock | Checkout | `⏱ Reservado por: 14:23` |

---

### 5. Figma Claude Bridge — Execução

```bash
curl http://localhost:4444/ping
```

**Helpers padrão:**
```javascript
await figma.loadFontAsync({ family: 'Inter', style: 'Regular' });
await figma.loadFontAsync({ family: 'Inter', style: 'Medium' });
await figma.loadFontAsync({ family: 'Inter', style: 'Bold' });

const BG    = { r: 0.020, g: 0.020, b: 0.031 };
const SURF  = { r: 0.059, g: 0.059, b: 0.078 };
const RAISED= { r: 0.094, g: 0.094, b: 0.122 };
const BORDER= { r: 0.145, g: 0.145, b: 0.188 };
const ACCENT= { r: 0.545, g: 0.361, b: 0.965 };
const PINK  = { r: 0.925, g: 0.286, b: 0.600 };
const T1    = { r: 1,     g: 1,     b: 1     };
const T2    = { r: 0.569, g: 0.569, b: 0.627 };
const T3    = { r: 0.361, g: 0.361, b: 0.431 };

function r(w, h, color, radius = 0, op = 1) {
  const n = figma.createRectangle(); n.resize(w, h);
  n.fills = color ? [{ type: 'SOLID', color, opacity: op }] : [];
  if (radius) n.cornerRadius = radius; n.strokes = []; return n;
}
function t(str, size, style, color, op = 1) {
  const n = figma.createText(); n.characters = str;
  n.fontName = { family: 'Inter', style }; n.fontSize = size;
  n.fills = [{ type: 'SOLID', color, opacity: op }]; return n;
}
```

**Limitações conhecidas:**
- Sem `figma.createAutoLayout()` — usar `createFrame()` + `layoutMode`
- `figma.notify()` não existe
- Timeout: 30s — scripts grandes: dividir
- Gradient fills: simular com layers sobrepostas

---

## Processo de redesign

1. Ler estado atual do frame antes de substituir
2. Definir composição: background → atmosphere → content → urgency layer → annotations
3. Construir de trás pra frente
4. Testar proporções no viewport alvo
5. Commitar após cada 2-3 telas executadas com sucesso

---

## Relacionado

- `/visual-intelligence` — extração de padrões visuais
- `/impeccable` — regras de qualidade visual
- `figma:*` plugin — integração Figma (instalar separado)
