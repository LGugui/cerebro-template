---
tipo: sistema
atualizado: 2026-05-31
tags: [sistema, setup, instalação, novo-computador]
---

# SETUP — Novo Computador

> Siga esta ordem. Cada seção depende da anterior.  
> Este arquivo é lido por IAs e pelo próprio Luiz ao configurar um novo ambiente.

---

## 0. Pré-requisitos base

| Software | Versão mínima | Download |
|---|---|---|
| **Git** | qualquer recente | https://git-scm.com |
| **Node.js** | 24+ | https://nodejs.org (LTS) |
| **Python** | 3.12+ | https://python.org |
| **Obsidian** | qualquer recente | https://obsidian.md |
| **Figma Desktop** | qualquer recente | https://figma.com/downloads |
| **Claude Code CLI** | mais recente | `npm install -g @anthropic-ai/claude-code` |
| **Ollama** | mais recente | https://ollama.com (para aprimorador) |

---

## 1. Clonar / copiar vault

```powershell
# Se vault estiver em repositório git
git clone <URL-DO-REPO> "C:\Users\<usuario>\Documents\Cérebro"

# Ou copiar pasta manualmente para Documents/Cérebro
```

---

## 2. Instalar dependências do vault

```powershell
# Vault (Playwright para automação web)
cd "C:\Users\<usuario>\Documents\Cérebro"
npm install

# Scripts Python do vault
cd "C:\Users\<usuario>\Documents\Cérebro\99_System\scripts"
pip install -r requirements.txt
```

**requirements.txt inclui:**
- `anthropic>=0.40.0` — SDK Claude API
- `python-dotenv>=1.0.0` — variáveis de ambiente
- `watchdog>=4.0.0` — monitoramento de arquivos (inbox_watcher)
- `pymupdf>=1.24.0` — leitura/resumo de PDFs
- `schedule>=1.2.0` — agendamento de scripts

---

## 3. Configurar Figma Bridge

```powershell
# Instalar dependências do bridge
cd "C:\Users\<usuario>\Documents\figma-claude-bridge\bridge"
npm install

# Testar servidor
node server.js
# Deve mostrar:
# [bridge] HTTP  -> http://localhost:4444/execute
# [bridge] WS   -> ws://localhost:4445
```

### Instalar plugin no Figma Desktop

1. Abrir Figma Desktop
2. Menu → Plugins → Development → Import plugin from manifest...
3. Selecionar: `Documents/figma-claude-bridge/plugin/manifest.json`
4. Plugin "Claude Bridge" aparece em Plugins → Development

### Testar conexão completa

```powershell
# 1. Iniciar bridge (se não estiver rodando)
cd "C:\Users\<usuario>\Documents\figma-claude-bridge\bridge"
node server.js

# 2. No Figma Desktop: abrir qualquer arquivo → Plugins → Development → Claude Bridge → Run
# Plugin deve mostrar "Connected to bridge"

# 3. Testar
curl http://localhost:4444/ping
# → {"ok":true,"pluginConnected":true}
```

---

## 4. Variáveis de ambiente obrigatórias

Criar arquivo `.env` em `C:\Users\<usuario>\.claude\` OU configurar nas variáveis de ambiente do sistema:

```env
# Claude / Anthropic
ANTHROPIC_API_KEY=sk-ant-...

# Figma
FIGMA_API_KEY=figd_...

# Paperclip (task manager local)
PAPERCLIP_API_URL=http://127.0.0.1:3100
PAPERCLIP_API_KEY=...
PAPERCLIP_COMPANY_ID=...
PAPERCLIP_AGENT_ID=...
```

> **Onde pegar as chaves:**
> - `ANTHROPIC_API_KEY` → console.anthropic.com
> - `FIGMA_API_KEY` → figma.com → Account Settings → Access Tokens (scopes: file_content:read+write)
> - `PAPERCLIP_*` → Luiz tem as chaves salvas; checar `~/.claude/settings.local.json` do computador antigo

---

## 5. Configurar Claude Code

```powershell
# Login Claude Code
claude login

# Verificar que o vault é reconhecido como projeto
cd "C:\Users\<usuario>\Documents\Cérebro"
claude --version
```

### Hooks (inicialização automática)

Os hooks em `~/.claude/hooks/` iniciam automaticamente:
- **Figma MCP** (porta 3333) — leitura de arquivos Figma via API
- **Figma Bridge** (porta 4444) — execução de código Plugin API

Copiar pasta `~/.claude/` do computador antigo OU reconfigurar manualmente:

```powershell
# Verificar que hooks estão carregados
# Abrir sessão Claude Code no vault — deve iniciar servidores automaticamente
```

---

## 6. Instalar modelo Ollama (aprimorador)

```powershell
# Instalar Mistral (modelo principal do aprimorador)
ollama pull mistral

# Verificar
ollama list
# deve mostrar: mistral   ...
```

---

## 7. Abrir Obsidian no vault

1. Abrir Obsidian
2. "Open folder as vault"
3. Selecionar: `C:\Users\<usuario>\Documents\Cérebro`
4. Instalar plugins obrigatórios (Obsidian vai sugerir automaticamente via `.obsidian/`):
   - Kanban
   - Dataview
   - Templater
   - Calendar

---

## 8. Verificação final

```powershell
# Checklist rápido
curl http://localhost:3333/mcp    # Figma MCP ativo
curl http://localhost:4444/ping   # Bridge ativo
curl http://localhost:3100/api/agents/me  # Paperclip ativo (se em uso)
ollama list                       # Mistral disponível
claude --version                  # Claude Code instalado
```

**Em Claude Code — primeiro `/inicio`:**
- Deve carregar CLAUDE.md, TAREFAS.md, KANBAN.md
- Deve mostrar pendências em aberto
- Deve detectar domínio e oferecer menu

---

## Ordem resumida

```
1. Git + Node.js + Python + Obsidian + Figma Desktop + Claude Code + Ollama
2. Clonar vault → npm install → pip install -r requirements.txt
3. figma-claude-bridge/bridge → npm install
4. Instalar plugin Claude Bridge no Figma Desktop
5. Configurar variáveis de ambiente (.env ou sistema)
6. claude login
7. ollama pull mistral
8. Abrir Obsidian no vault
9. Verificar todos os serviços
```
