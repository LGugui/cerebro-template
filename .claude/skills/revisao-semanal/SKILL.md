---
name: revisao-semanal
description: Gera revisão semanal completa do vault com base nas daily notes e arquivos de equipe. Ativar quando Luiz disser "revisão semanal", "fechar semana", "/revisao-semanal" ou pedir balanço da semana.
---

# Skill: revisao-semanal

Gera nota de revisão semanal em `02 - Diário/revisoes/` consolidando o progresso de todas as equipes.

## Passos

1. **Ler daily notes** dos últimos 7 dias em `00_Inbox/` (arquivos YYYY-MM-DD.md)
2. **Ler** `99_System/TAREFAS.md` — identificar tarefas concluídas na semana
3. **Ler** os 5 arquivos de equipe em `99_System/equipes/`:
   - `juridica-tarefas.md`
   - `comercial-tarefas.md`
   - `dev-tarefas.md`
   - `pesquisa-tarefas.md`
   - `pessoal-tarefas.md`
4. **Gerar nota** em `00_Inbox/revisoes/YYYY-MM-DD-revisao-semanal.md` com:

```markdown
---
data: YYYY-MM-DD
área: pessoal
status: referência
tags: [revisão, semanal]
---

# Revisão Semanal — DD/MM/YYYY

## Resumo da semana
[2-3 frases do que aconteceu]

## Tarefas concluídas por equipe
### ⚖️ Jurídica
- ...

### 💼 Comercial
- ...

### 💻 Dev
- ...

### 📚 Pesquisa
- ...

### 🏠 Pessoal
- ...

## Tarefas que avançaram (não concluídas)
- ...

## Bloqueios identificados
- ...

## Foco sugerido para a próxima semana
1. ...
2. ...
3. ...
```

5. **Adicionar link** da nota criada no `14_Indexes/MAPA.md` na seção Diário

## Restrições

- Não modificar notas de projeto ou equipe — apenas ler
- Se não houver daily notes suficientes, gerar revisão com dados disponíveis e informar o Luiz
