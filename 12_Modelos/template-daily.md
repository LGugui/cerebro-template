---
data: <% tp.date.now("YYYY-MM-DD") %>
tipo: diário
tags: [diário]
dominio: pessoal
tipo_nota: sistema
nivel: básico
status_nota: ativo
---

# <% tp.date.now("YYYY-MM-DD") %>

## Foco do dia

<% tp.file.cursor() %>

---

## Tarefas

- [ ] 

---

## Notas / Reflexões

---

*Ontem: [[00_Inbox/<% tp.date.now("YYYY-MM-DD", -1) %>]]*
