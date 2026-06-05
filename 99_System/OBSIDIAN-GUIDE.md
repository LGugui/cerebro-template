---
tipo: sistema
atualizado: 2026-05-13
---

# Guia do Sistema — O que é este vault e como funciona

## O que é o Obsidian
Obsidian é app de notas local. Todas as notas são arquivos `.md` (Markdown) salvos em pasta no computador. Não há banco de dados — só arquivos de texto. Qualquer IA pode ler, criar e editar notas diretamente pelo sistema de arquivos.

## O que é Markdown
```
# Título
## Subtítulo
**negrito**  *itálico*
- item de lista
1. lista numerada
[[Nome da Nota]]   ← wikilink para outra nota do vault
#tag               ← tag inline
```código```
```

## Frontmatter YAML
Todo arquivo deste vault começa com metadados entre `---`:
```yaml
---
data: 2026-05-13
área: trabalho
projeto: kermartin
status: ativo
tags: [comercial, vendas]
---
```
Esses metadados permitem filtrar e consultar notas sem ler o conteúdo.

## Sistema de pastas (PARA)
- **Projetos** (`03`) — têm objetivo claro e prazo
- **Áreas** (`04`) — responsabilidades contínuas sem prazo
- **Recursos** (`05`) — referências e material de apoio
- **Arquivo** (`07`) — tudo concluído

## MOCs — Maps of Content
MOCs são notas-índice que apontam para outras notas do mesmo tema. Permitem ao agente encontrar qualquer nota sem ler todos os arquivos.

```markdown
# MOC — Direito Empresarial
- [[titulos-de-credito]]
- [[cheque-lei-7357]]
- [[letra-de-cambio]]
```

## Notas atômicas
Cada nota contém **uma única ideia**. Títulos descritivos, arquivo em kebab-case:
- ✅ `principio-da-autonomia-cambiaria.md`
- ❌ `notas-de-direito.md` (muito genérico)

## Wikilinks
Use `[[nome-do-arquivo]]` para conectar notas. O Obsidian cria backlinks automáticos, formando rede de conhecimento navegável pelo grafo.

## Regras deste vault
1. Nunca deletar — arquivar em `15_Arquivo/`
2. Inbox é temporária — processar regularmente
3. Nomes de arquivo sem acentos, em kebab-case
4. Atualizar TAREFAS.md ao fim de cada sessão com o agente
5. CLAUDE.md é lido automaticamente — manter atualizado

## Arquivos de sistema (`99_System/`)
| Arquivo | Função |
|---------|--------|
| `CLAUDE.md` | Contexto permanente do agente — lido a cada sessão |
| `QUEM-SOU.md` | Identidade e contexto pessoal do Luiz |
| `MAPA.md` | Índice navegável de todo o vault |
| `TAREFAS.md` | Central de tarefas + log de sessões |
| `OBSIDIAN-GUIDE.md` | Este arquivo — explica o sistema |
| `_templates/` | Templates reutilizáveis para novos tipos de nota |
