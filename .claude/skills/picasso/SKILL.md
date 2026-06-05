---
name: picasso
description: Modo de design máximo. Combina impeccable (7 domínios), design-motion-principles (lente Jakub Krehel), DICE poster-forward pattern, Land-book Dark+Gradient, anime.js creative patterns e Figma Claude Bridge para redesign com identidade de nightlife/eventos. Ativa quando: "redesenha", "refaz", "melhora UI", "aplica picasso", "visual mais forte", ou trabalho em qualquer tela Figma do projeto PARTY X.
---

# Picasso — Design Intelligence Máxima

Skill de redesign completo que funde todas as capacidades de design disponíveis no vault. Nível: nightlife/consumer-events, energia de festival, polish de produto premium.

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
Letter-spacing: -0.02em em displays e headings. Tracking tight = modernidade.

**Cor — sistema dark com gradient energy:**

| Token | Hex | RGB (0-1) | Uso |
|---|---|---|---|
| `bg` | #050508 | (0.020, 0.020, 0.031) | Fundo base — quase preto com toque azul |
| `surface` | #0F0F14 | (0.059, 0.059, 0.078) | Cards, painéis |
| `raised` | #18181F | (0.094, 0.094, 0.122) | Inputs, botões secondary |
| `border` | #252530 | (0.145, 0.145, 0.188) | Linhas, divisores |
| `accent` (violet) | #8B5CF6 | (0.545, 0.361, 0.965) | CTA primário, destaques |
| `accent-pink` | #EC4899 | (0.925, 0.286, 0.600) | Acento secundário, gradiente final |
| `gradient` | violet→pink | — | Elemento hero, logo X, glow principal |
| `text-1` | #FFFFFF | (1, 1, 1) | Texto primário |
| `text-2` | #9191A0 | (0.569, 0.569, 0.627) | Secundário |
| `text-3` | #5C5C6E | (0.361, 0.361, 0.431) | Muted, placeholders |
| `success` | #22C55E | (0.133, 0.773, 0.369) | Em Venda |
| `warning` | #EAB308 | (0.918, 0.706, 0.008) | Em Breve |
| `danger` | #EF4444 | (0.937, 0.267, 0.267) | Esgotando! |
| `glow-violet` | #8B5CF6 @ 10-20% | — | Ambiente, halos |
| `glow-pink` | #EC4899 @ 5-12% | — | Profundidade, contra-luz |

**Atmosfera (simular gradiente com camadas no Figma):**
```
Layer 1 (base):    solid #050508
Layer 2 (glow 1):  ellipse 800×600, violet, op 0.12-0.18, upper-right
Layer 3 (glow 2):  ellipse 400×300, pink,   op 0.06-0.10, center-right
Layer 4 (streak):  rectangle 1200×1, violet, op 0.08, horizontal
Layer 5 (dark-floor): rectangle full-w × 200, #000, op 0.5, bottom → dark
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
- 52px: primary CTA (mais impacto)

---

### 2. DICE Poster-Forward — Padrão de Card

Referência: DICE FM (dice.fm) — o melhor padrão de card para eventos.

**Princípio:** evento É o poster. A imagem domina. Texto aparece sobre ela.

```
Card 420×280 (não 420×230)
├── Image area: 420×200 (71% da altura) — dark atmospheric gradient
│   ├── Category chip: top-left (12,12)
│   ├── Status chip: top-right
│   ├── Gradient overlay: bottom 100px de image → dark (opacidade aumenta de 0→1)
│   ├── Event name: 15px Medium, x=16, y=image_bottom-48 (SOBRE a imagem)
│   └── Date+venue: 11px Regular, x=16, y=image_bottom-28 (SOBRE a imagem)
└── Info strip: 420×80
    ├── Capacity bar: topo da strip
    ├── Price: 14px Bold accent, left
    └── CTA: 100×36 primary, right
```

**Regra crítica:** nunca empilhar título + meta ABAIXO da imagem em cards de evento — isso mata o impacto.

---

### 3. Anime.js — Padrões Criativos (intenção de motion nos frames)

Anotar intenção de animação com badges roxos no frame. Padrões prioritários para PARTY X:

**Splash screen:**
```javascript
// Anéis pulsam em entrada com stagger
anime({ targets: '.ring', scale: [0, 1], opacity: [0, 1], delay: stagger(120), ease: 'outExpo' })
// Partículas surgem aleatórias
anime({ targets: '.dot', x: rand, y: rand, opacity: [0, 0.4], delay: stagger(30, { from: 'random' }) })
// Logo: letters stagger
anime({ targets: '.logo-letter', translateY: [40, 0], opacity: [0, 1], delay: stagger(80) })
// Progress bar preenche
anime({ targets: '.progress-fill', width: ['0%', '100%'], duration: 1200 })
```

**Hero Home:**
```javascript
// Atmospheric glow pulsa lento
anime({ targets: '.glow-blob', scale: [0.95, 1.05], duration: 4000, loop: true, alternate: true })
// Conteúdo sobe do fundo
anime({ targets: '.hero-content', translateY: [20, 0], opacity: [0, 1], delay: 400 })
// Streak de luz passa
anime({ targets: '.light-streak', translateX: [-200, 1600], opacity: [0, 0.3, 0], duration: 1800 })
```

**Cards:**
```javascript
// Stagger de entrada ao scroll
animate('.event-card', { translateY: [24, 0], opacity: [0, 1], delay: stagger(80) })
// Hover: escala sutil
// hover: scale(1.02), translateY(-2px), duration: 200ms
```

---

### 4. FOMO / Urgência Visual

Padrões obrigatórios em telas client:

| Elemento | Onde | Código |
|---|---|---|
| Live viewers | Hero | `● 47 pessoas vendo agora` (ponto vermelho pulsante) |
| Social proof | Abaixo do hero | `João M. comprou · 3 min` (ticker) |
| Lote warning | Card / hero | `⚡ Lote 1 encerra em 3 dias · Próximo: R$ 180` |
| Capacity bar | Todo card | Muda de cor: verde < 80%, laranja 80-95%, vermelho > 95% |
| Price lock | Checkout | `⏱ Ingresso reservado por: 14:23` |

---

### 5. Separação Cliente vs Admin

**Cliente vê:** Home, Evento, Vitrine, Login/Cadastro, Checkout (3 etapas)
**Admin vê:** Dashboard, Convidados, Scanner QR (página `06 · Admin`)

Diferenciadores visuais:
- Cliente: energy, gradientes, FOMO, modo imersivo dark
- Admin: dados densos, tabelas, KPIs, sidebar estruturada, fundo mais escuro/neutro

---

### 6. Land-book + Framer Gallery — Filtros de referência

Para PARTY X → buscar: **Dark Colors + Gradient + Animations**
Para admin/B2B → buscar: **Business + Grid + Dark**
Para landing de produto → buscar: **Landing Page + Large Type + Dark**

---

### 7. Figma Claude Bridge — Execução

```bash
curl http://localhost:4444/ping
```

```bash
node -e "
const fs=require('fs'),http=require('http');
const code=fs.readFileSync(process.argv[1],'utf8');
const body=JSON.stringify({code});
const req=http.request({hostname:'localhost',port:4444,path:'/execute',method:'POST',headers:{'Content-Type':'application/json','Content-Length':Buffer.byteLength(body)}},res=>{let d='';res.on('data',c=>d+=c);res.on('end',()=>console.log(d))});
req.write(body);req.end();
" SCRIPT.js
```

**Helpers padrão:**
```javascript
await figma.loadFontAsync({ family: 'Inter', style: 'Regular' });
await figma.loadFontAsync({ family: 'Inter', style: 'Medium' });
await figma.loadFontAsync({ family: 'Inter', style: 'Bold' });

const BG    = { r: 0.020, g: 0.020, b: 0.031 }; // #050508
const SURF  = { r: 0.059, g: 0.059, b: 0.078 }; // #0F0F14
const RAISED= { r: 0.094, g: 0.094, b: 0.122 }; // #18181F
const BORDER= { r: 0.145, g: 0.145, b: 0.188 }; // #252530
const ACCENT= { r: 0.545, g: 0.361, b: 0.965 }; // #8B5CF6 violet
const PINK  = { r: 0.925, g: 0.286, b: 0.600 }; // #EC4899 pink
const T1    = { r: 1,     g: 1,     b: 1     };
const T2    = { r: 0.569, g: 0.569, b: 0.627 };
const T3    = { r: 0.361, g: 0.361, b: 0.431 };
const GREEN = { r: 0.133, g: 0.773, b: 0.369 };
const RED   = { r: 0.937, g: 0.267, b: 0.267 };
const YELLOW= { r: 0.918, g: 0.706, b: 0.008 };

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
- `figma.notify()` não existe — usar `return`
- Timeout: 30s por execute — scripts complexos: dividir
- Gradient fills via API são complexos — simular com layers sobrepostas

---

## Processo de redesign v2

1. Ler estado atual do frame antes de substituir
2. Definir composição visual nova (sketch mental com layers)
3. Construir de trás pra frente: background → atmosphere → content → FOMO layer → annotations
4. Testar proporções: hero ocupa 33% da tela, logo é o único elemento display
5. Commitar após cada 2-3 telas executadas com sucesso

---

## Sistema Visual PARTY X v2

**Identidade:** Clube noturno premium de SP. Energia de festival. Experiência de produto polida.
**Paleta:** Near-black + Violet + Pink (gradient). Sem azul. Sem verde-escuro.
**Tipografia:** Inter Bold display, nunca Light em headings.
**Fotografia/Imagem:** Simulada com gradientes atmosféricos purple→pink→black.
**Tom de voz:** Urgente, exclusivo, cultural. Não genérico.

**Eventos:**
- Festa 31/12 — Reveillon 2027 (72% capacidade)
- Carnaval Elite 2027 (45%)
- Hip Hop Night SP (95% — ESGOTANDO)
- Festival Eletronika (30% — Em Breve)
- Sertanejo Premium (88%)
- Rock in Rio Experience (12% — Em Breve)

---

## Relacionado

[[impeccable-design-language-ai]]
[[design-motion-principles-skill]]
[[animejs-biblioteca-animacao-js]]
[[framer-gallery-templates-estilos]]
[[referencias-design-inspiracao-2026]]
[[reference_figma-mcp]]
