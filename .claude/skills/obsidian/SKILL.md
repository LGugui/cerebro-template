---
name: obsidian
description: Menu interativo para aprimorar o vault Obsidian. Ativar quando Luiz disser "/obsidian", "aprimorar vault", "auditar notas", "sugerir conexoes" ou "gerar MOC".
---

# Skill: obsidian

Menu interativo com 4 acoes de manutencao e melhoria do vault.

## Perguntas (verificar antes de agir)

Se o usuário não especificou a ação diretamente, apresentar o menu (Passo 1).
Se especificou ação mas não o alvo, perguntar:
- Para "aprimorar nota" ou "sugerir conexões": "Qual nota? (caminho relativo ou nome)"
- Para "gerar MOC": "Qual domínio? (dev / direito / comercial / pessoal / pesquisa)"
- Para "auditar": "Auditoria geral ou foco em área específica?"

## Passo 1 - Apresentar menu

Perguntar ao Luiz qual acao deseja:

**Opcoes:**
1. **Auditar vault** - encontrar problemas: notas sem frontmatter, links quebrados, notas orfas, arquivos na pasta errada
2. **Aprimorar nota** - melhorar uma nota especifica: frontmatter, wikilinks, estrutura, atomicidade
3. **Sugerir conexoes** - analisar uma nota e sugerir wikilinks para outras notas relevantes do vault
4. **Gerar/atualizar MOC** - criar ou atualizar indice de uma area

---

## Acao 1 - Auditar vault

### O que verificar

**A. Notas sem frontmatter**
- Glob `**/*.md` excluindo `99_System/`, `12_Modelos/`, `15_Arquivo/`, `.claude/` e `.obsidian/`
- Para cada nota: verificar se comeca com `---`
- Listar as que nao tem

**B. Notas orfas** (sem nenhum wikilink apontando para elas)
- Focar em `02_Knowledge/`, `04_Projects/`, `10_Learning/`, `11_Conteudo/`
- Verificar se o nome do arquivo aparece em algum `[[link]]` no vault

**C. Links quebrados**
- Buscar padrao `\[\[.*?\]\]` nas notas
- Verificar se o arquivo referenciado existe no vault

**D. Notas fora de lugar**
- Verificar se ha notas em `00_Inbox/` com mais de 7 dias
- Verificar se ha dashboards duplicados em `01_Dashboard/`
- Verificar se ha MOCs fora de `14_Indexes/`

### Formato do relatorio

```
AUDITORIA DO VAULT - DD/MM/YYYY

SEM FRONTMATTER (X notas)
- caminho/nota.md

POSSIVEIS ORFAS (X notas)
- caminho/nota.md - nenhum link aponta para ela

LINKS QUEBRADOS (X ocorrencias)
- caminho/nota.md -> [[link-inexistente]]

INBOX ANTIGA (X notas > 7 dias)
- 00_Inbox/nota.md - criada em DD/MM

Duplicidades e inconsistencias
- ...
```

Apos o relatorio, perguntar: "Quer que eu corrija algum desses problemas agora?"

---

## Acao 2 - Aprimorar nota

### Coleta

Perguntar: "Qual nota quer aprimorar? (caminho relativo ou nome do arquivo)"

### O que verificar e corrigir

1. **Frontmatter** - verificar se tem os campos padrao do vault:
   ```yaml
   ---
   data: YYYY-MM-DD
   area: direito | trabalho | programacao | ideias | pessoal
   projeto: nome (se aplicavel)
   status: ativo | pausado | concluido | referencia
   tags: []
   ---
   ```
2. **Wikilinks** - identificar mencoes a conceitos, pessoas, projetos ou notas que deveriam ser `[[links]]`.
3. **Estrutura** - verificar H1, secoes logicas e proximos passos explicitos quando fizer sentido.
4. **Atomicidade** - se a nota cobre mais de um tema central, sugerir divisao.
5. **Nome do arquivo** - verificar se esta em kebab-case sem acentos.

### Formato da resposta

Mostrar o diff das alteracoes propostas antes de aplicar. Pedir confirmacao.

---

## Acao 3 - Sugerir conexoes

### Coleta

Perguntar: "Qual nota quer analisar? (caminho relativo ou nome)"

### O que fazer

1. Ler a nota alvo
2. Ler `14_Indexes/MAPA.md` e, se necessario, o MOC mais proximo do tema
3. Identificar conceitos, temas, projetos, pessoas e entidades na nota alvo
4. Buscar notas no vault que tratam desses mesmos temas
5. Para cada conexao sugerida, explicar por que faz sentido

### Formato da resposta

```
CONEXOES SUGERIDAS PARA: nome-da-nota.md

[[nota-a]] -> motivo da conexao
[[nota-b]] -> motivo da conexao
[[nota-c]] -> motivo da conexao
```

Perguntar: "Quer que eu adicione esses wikilinks na nota agora?"

---

## Acao 4 - Gerar/atualizar MOC

### Coleta

Perguntar: "Qual area quer indexar?"
Opcoes: Direito / Programacao / Comercial / Pessoal / Pesquisa / Outra

### Mapeamento de pastas por area

| Area | Pastas a escanear |
|---|---|
| Direito | `02_Knowledge/Direito/`, `04_Projects/estagio/`, `04_Projects/faculdade/`, `10_Learning/Direito/` |
| Programacao | `10_Learning/Programacao/`, `10_Learning/Desenvolvimento/`, `04_Projects/csharp-unity/` |
| Comercial | `04_Projects/kermartin/`, `02_Knowledge/Vendas/`, `03_Entities/wh-technology.md` |
| Pessoal | `03_Entities/luiz-fernando.md`, `09_Operations/` |
| Pesquisa | `05_Research/` |

### O que fazer

1. Escanear as pastas da area escolhida
2. Listar todas as notas com titulo e descricao curta
3. Agrupar por subtema
4. Verificar se ja existe um MOC para a area em `14_Indexes/`
5. Se existir, atualizar links faltantes; se nao existir, criar `14_Indexes/moc-{area}.md`

### Formato do MOC gerado

```markdown
---
tipo: moc
area: {area}
atualizado: YYYY-MM-DD
---

# MOC - {Area}

> Indice navegavel de todas as notas de {area} no vault.

## {Subtema 1}
- [[nota-a]] - descricao curta
- [[nota-b]] - descricao curta
```

---

## Referencias Vault (sugerir ao completar)

Ao concluir qualquer acao:
- Se auditoria: sugerir `/melhorar` para correcoes mais complexas, `/nova-tarefa` para problemas que viram tarefas
- Se MOC gerado: sugerir adicionar link em `14_Indexes/MAPA.md`
- Se conexoes sugeridas e aceitas: confirmar que wikilinks foram adicionados

## Restricoes

- Nunca deletar notas sem confirmacao explicita; preferir arquivar
- Sempre mostrar diff antes de editar notas existentes
- Ao concluir qualquer acao: perguntar "Quer voltar ao menu ou encerrar?"
