---
name: processar-inbox
description: Processa todas as notas de 01 - Inbox/, classifica e move para a pasta correta. Ativar quando Luiz disser "processar inbox", "limpar inbox", "/processar-inbox" ou pedir triagem das notas capturadas.
---

# Skill: processar-inbox

Processa todas as notas em `01 - Inbox/`, classifica por tipo e destino, aguarda confirmação antes de mover.

## Passos

1. **Listar** todos os arquivos em `00_Inbox/`
2. **Ler** o conteúdo de cada nota
3. **Classificar** cada nota:
   - Pasta de destino: `04_Projects/`, `02_Knowledge/`, `10_Learning/` ou `11_Conteudo/`
   - Equipe responsável: juridica / comercial / dev / pesquisa / pessoal
   - Tipo: tarefa → criar card no KANBAN.md e bloco no arquivo da equipe; conhecimento → mover com frontmatter YAML
4. **Apresentar plano** ao Luiz antes de qualquer movimentação — formato tabela: Nota | Destino | Equipe | Tipo | Ação
5. **Aguardar confirmação** — não mover nada antes da aprovação
6. **Executar** as movimentações aprovadas:
   - Adicionar frontmatter YAML se ausente
   - Renomear para kebab-case sem acentos se necessário
   - Criar bloco de tarefa no arquivo da equipe se tipo = tarefa
   - Criar card no KANBAN.md na coluna 🔵 Ativa se tipo = tarefa
7. **Atualizar** `14_Indexes/MAPA.md` com links das notas relevantes movidas

## Restrições

- NUNCA mover sem confirmação do Luiz
- NUNCA deletar notas da inbox — apenas mover para `15_Arquivo/` se forem logs/obsoletas
- Respeitar todas as regras do CLAUDE.md
- Não modificar arquivos em `99_System/` sem avisar
