---
tipo: sistema
atualizado: 2026-05-31
tags: [sistema, ia, comandos, figma, bridge]
---

# COMANDOS PADRÃO — Para Todas as IAs

> Leia este arquivo sempre que envolver ferramentas locais (Figma, bridge, servidores locais).  
> Estas instruções valem para **Claude, Gemini, Codex, Cursor, Windsurf** — qualquer IA operando neste vault.

---

## 1. Figma Desktop — Bridge Local

**Nunca peça URL de arquivo Figma. Nunca use API online se bridge estiver ativo.**

### Como funciona

```
Figma Desktop (arquivo aberto)
      ↕ Plugin "Claude Bridge" (ws://localhost:4445)
Bridge Node.js (http://localhost:4444)
      ↕ POST /execute { code }
IA executa Plugin API direto no arquivo aberto
```

### Verificar conexão (sempre checar antes de executar)

```bash
curl -s http://localhost:4444/ping
# Resposta esperada: {"ok":true,"pluginConnected":true}
```

Se `pluginConnected: false` → pedir ao usuário: *"Abra o Figma Desktop, vá em Plugins → Development → Claude Bridge → Run"*

Se servidor offline (connection refused) → pedir: *"Inicie o bridge: `cd Documents/figma-claude-bridge/bridge && npm start`"*

### Ler arquivo aberto (sem fileKey, sem URL)

```bash
curl -s -X POST http://localhost:4444/execute \
  -H "Content-Type: application/json" \
  -d "{\"code\": \"return { nome: figma.root.name, paginas: figma.root.children.map(p => ({ id: p.id, nome: p.name, nos: p.children.length })) }\"}"
```

### Ler página atual

```bash
curl -s -X POST http://localhost:4444/execute \
  -H "Content-Type: application/json" \
  -d "{\"code\": \"return figma.currentPage.children.map(n => ({ id: n.id, nome: n.name, tipo: n.type, x: n.x, y: n.y, w: n.width, h: n.height }))\"}"
```

### Executar código Plugin API (inline — código pequeno)

```bash
curl -s -X POST http://localhost:4444/execute \
  -H "Content-Type: application/json" \
  -d "{\"code\": \"SEU_CODIGO_PLUGIN_API_AQUI\"}"
```

O `code` é JavaScript puro com `return` para retornar dados. Não use `figma.closePlugin()` nem `figma.notify()`.

### Executar código Plugin API via arquivo (Windows PowerShell — PADRÃO PARA CÓDIGO LONGO)

**CRÍTICO:** nunca use `Get-Content` diretamente no `ConvertTo-Json` — retorna PSObject com metadata, JSON infla para 2.5MB e o bridge falha com `"expecting ']'"`.

```powershell
# CORRETO — cast [string] obrigatório
$code = [string](Get-Content "C:\caminho\script.js" -Raw -Encoding UTF8)
$body = @{ code = $code } | ConvertTo-Json -Compress -Depth 5
$resp = Invoke-RestMethod -Uri "http://localhost:4444/execute" -Method Post -Body $body -ContentType "application/json; charset=utf-8"

# ERRADO — PSObject inclui ReadCount e outros metadados
$code = Get-Content "script.js" -Raw  # retorna PSObject, não string pura
$body = @{ code = $code } | ConvertTo-Json  # JSON fica com 2.5MB+
```

Para capturar erros do bridge (status 500):
```powershell
try {
  $resp = Invoke-RestMethod ...
  $resp
} catch {
  $stream = $_.Exception.Response.GetResponseStream()
  $reader = New-Object System.IO.StreamReader($stream)
  $reader.ReadToEnd()  # mostra o erro JSON do bridge
}
```

### Regras de execução Plugin API via bridge

- Use `return` para retornar dados (não `console.log`)
- Cores: range 0–1 (não 0–255) — ex: vermelho = `{r:1, g:0, b:0}`
- Sempre `await` em chamadas async (`loadFontAsync`, `setCurrentPageAsync`, etc.)
- Para trocar página: `await figma.setCurrentPageAsync(pagina)` (setter síncrono não funciona)
- Texto: carregar fonte antes de editar — `await figma.loadFontAsync({family, style})`
- Retorne sempre os IDs dos nodes criados/modificados
- Código é atômico — se errar, nada é executado; corrija e reexecute

### Arquivos do bridge

| Arquivo | Função |
|---|---|
| `Documents/figma-claude-bridge/bridge/server.js` | Servidor Node.js (HTTP 4444 + WS 4445) |
| `Documents/figma-claude-bridge/plugin/` | Plugin Figma (manifest + code.js + ui.html) |
| `Documents/figma-claude-bridge/*.js` | Scripts de build (wireframe, páginas, etc.) |

---

## 2. Padrão de Sessão com Figma

Quando usuário disser "figma", "conectei ao figma", "liga o figma" ou similar:

1. `curl http://localhost:4444/ping` — checar status
2. Se conectado → executar leitura inicial do arquivo aberto
3. Perguntar o que fazer (ou executar pedido direto se já especificado)
4. **Nunca pedir URL** enquanto bridge estiver ativo

---

## 3. Servidores Locais Conhecidos

| Serviço | Porta | Checar |
|---|---|---|
| Figma Bridge HTTP | `localhost:4444` | `GET /ping` |
| Figma Bridge WS | `localhost:4445` | (interno, plugin conecta aqui) |
| Figma MCP (leitura) | `localhost:3333` | `figma-developer-mcp` — usa fileKey de URL |
| Paperclip | `localhost:3100` | `GET /api/agents/me` |

**Prioridade:** bridge local > MCP > API online  
Se bridge ativo → use bridge. Se bridge offline e MCP ativo → use MCP (precisa fileKey). Se ambos offline → peça URL.

---

## 4. Executar Script de Build Figma

Quando houver script `.js` em `Documents/figma-claude-bridge/`:

```bash
# Bridge deve estar rodando e plugin conectado
cd "Documents/figma-claude-bridge"
node nome-do-script.js
```

Scripts disponíveis: `wireframe.js`, `page-capa.js`, `page-sistema-visual.js`, `page-componentes.js`, `page-telas.js`, `page-assets-componentes.js`, `create-spec-pages.js`

---

## 5. Capacidades do Sistema

O que este vault + ambiente é capaz de fazer. Use como referência ao planejar tarefas.

### Design / Figma
| Capacidade | Como |
|---|---|
| Criar wireframes completos | Bridge + Plugin API JS → gera frames, texto, layout |
| Criar design specs (6 páginas) | `node create-spec-pages.js` |
| Criar sistemas visuais (tokens, cores, tipografia) | `node page-sistema-visual.js` |
| Criar componentes e variantes | Plugin API via bridge |
| Ler estrutura de qualquer arquivo aberto | `GET /ping` + `POST /execute` sem URL |
| Baixar assets de arquivos online | `mcp__figma__download_figma_images` (precisa URL) |

### Vault / Conhecimento
| Capacidade | Como |
|---|---|
| Organizar e classificar notas | Agentes CEO + equipes + `/inicio` |
| Pesquisa profunda no vault | `/pesquisar` + agente pesquisador |
| Curadoria automática | `vault-curator.py` + aprimorador |
| Monitorar inbox e processar | `inbox_watcher.py` + `/processar-inbox` |
| Daily notes automáticas | `daily_note.py` |
| Resumir PDFs | `resumir_pdf.py` + `pymupdf` |
| Sincronizar vault com git | `git_sync.py` |

### Agentes
| Agente | Função |
|---|---|
| CEO | Orquestra equipes, distribui tarefas, monitora KANBAN |
| gerente-dev / executor / revisor | Ciclo completo de desenvolvimento |
| gerente-comercial | CRM, leads, prospecção |
| gerente-juridico | Pesquisa e organização jurídica |
| pesquisador | Busca contexto no vault antes de agir |
| aprimorador | Enriquece notas com Ollama+Mistral local |

### Projetos ativos
| Projeto | Stack |
|---|---|
| Figma Claude Bridge | Node.js, WebSocket, Plugin API |
| Aprimorador vault | Python, Ollama, Mistral |
| Radar 3D WiFi CSI | Python, ESP32-S3, CFAR, DBSCAN |
| CRM WH Technology | Supabase, Vercel, C# (Kermartin) |
| Agente financeiro | Python, backtest, paper trading |
| C# / Unity | .NET 10, Unity 6 |
| Blackcore | B2B tech, múltiplas frentes |

### Automações e integrações
| Integração | Status |
|---|---|
| Gmail (criar, buscar, rotular) | MCP Google Gmail ativo |
| Google Calendar (criar, listar, sugerir horário) | MCP Google Calendar ativo |
| Paperclip task manager | `localhost:3100` — sync automático via hook |
| Playwright (automação web) | `npm install` no vault |
| Figma MCP leitura | `localhost:3333` — inicia via hook |
| Figma Bridge escrita | `localhost:4444` — inicia via hook |

### Skills disponíveis no Claude Code
Digitar `/` no Claude Code para ver lista completa. Principais:
- `/inicio` — menu de início de sessão
- `/pesquisar` — pesquisa profunda
- `/nova-tarefa` — criar tarefa com Paperclip sync
- `/novo-projeto` — diagnóstico + estrutura SDD
- `/encerrar` — encerrar sessão com log
- `/figma` — skill Figma completa (design, wireframe, library)
- `/adr` — registrar decisão técnica
- `/revisao-semanal` — revisão semanal do vault

---

## 6. Setup novo computador

Ver `99_System/SETUP.md` — instruções completas de instalação na ordem correta.

---

*Última atualização: 2026-05-31*
