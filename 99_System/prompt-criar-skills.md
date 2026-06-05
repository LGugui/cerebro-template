tCrie as seguintes skills no vault em `.claude/skills/`. Cada skill deve ser uma pasta com um arquivo `SKILL.md` dentro.

---

## Skill 1 — processar-inbox

Pasta: `.claude/skills/processar-inbox/SKILL.md`

Esta skill processa todas as notas da pasta `00_Inbox/` do vault.

Ao ser invocada deve:
1. Listar todos os arquivos em `00_Inbox/`
2. Ler o conteúdo de cada nota
3. Para cada nota decidir:
   - Qual pasta de destino (03 - Projetos, 04 - Áreas, 05 - Recursos, 06 - Ideias)
   - Qual equipe responsável (juridica, comercial, dev, pesquisa, pessoal)
   - Se é uma tarefa → criar card no KANBAN.md e bloco no arquivo da equipe
   - Se é conhecimento → mover para a pasta correta com frontmatter YAML
4. Apresentar o plano antes de mover qualquer coisa
5. Aguardar confirmação do Luiz
6. Executar as movimentações aprovadas
7. Atualizar MAPA.md com novas notas relevantes

---

## Skill 2 — revisao-semanal

Pasta: `.claude/skills/revisao-semanal/SKILL.md`

Esta skill gera uma revisão semanal completa do vault.

Ao ser invocada deve:
1. Ler as daily notes dos últimos 7 dias em `00_Inbox/`
2. Ler TAREFAS.md para ver o que foi concluído na semana
3. Ler os arquivos de equipe para ver progresso das tarefas ativas
4. Gerar uma nota de revisão semanal em `00_Inbox/revisoes/YYYY-MM-DD-revisao-semanal.md` com:
   - Resumo do que foi feito
   - Tarefas concluídas por equipe
   - Tarefas que avançaram
   - Bloqueios identificados
   - Foco sugerido para a próxima semana
5. Adicionar link da revisão no MAPA.md

---

## Skill 3 — nova-tarefa

Pasta: `.claude/skills/nova-tarefa/SKILL.md`

Esta skill guia a criação de uma nova tarefa completa no sistema.

Ao ser invocada deve:
1. Perguntar ao Luiz, uma pergunta por vez:
   - Qual o título da tarefa?
   - Qual a descrição?
   - Qual a equipe? (juridica / comercial / dev / pesquisa / pessoal)
   - Qual a prioridade? (alta / media / baixa)
   - Tem prazo? Se sim, qual?
   - Tem algum bloqueio já conhecido?
2. Com as respostas, gerar automaticamente:
   - ID da tarefa no formato correto (T-XXX-001)
   - Bloco completo no arquivo da equipe correspondente
   - Card no KANBAN.md na coluna 🔵 Ativa
   - Entrada no relatório de status do TAREFAS.md
3. Confirmar ao Luiz o que foi criado e onde

---

## Skill 4 — status

Pasta: `.claude/skills/status/SKILL.md`

Esta skill gera um relatório rápido do estado atual do vault.

Ao ser invocada deve:
1. Ler TAREFAS.md
2. Ler os 5 arquivos de equipe em `99_System/equipes/`
3. Gerar um relatório visual no terminal com:
   - Total de tarefas por status (ativa, em andamento, revisão, bloqueada, concluída)
   - Total por equipe
   - Tarefas com prazo nos próximos 7 dias
   - Bloqueios ativos
   - Última sessão registrada
4. Não criar nem modificar nenhum arquivo — apenas exibir

---

## Regras gerais para todas as skills

- Cada SKILL.md deve ter frontmatter YAML com `name` e `description`
- A description deve explicar quando a skill é ativada automaticamente
- Todas devem seguir as regras do CLAUDE.md (não deletar, não modificar 99_System sem avisar, etc.)
- Após criar as 4 skills, liste os caminhos criados e confirme que estão prontas para uso
