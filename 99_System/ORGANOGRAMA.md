---
tipo: sistema
atualizado: 2026-05-13
tags: [organograma, estrutura, navegação]
---

# ORGANOGRAMA — Estrutura do Vault Cérebro

> Mapa visual completo: pastas, fluxos e hierarquia de agentes.
> Cores = categorias do Graph View e painel lateral.

---

## 🗂️ Estrutura PARA e Fluxo de Conhecimento

```mermaid
graph TD
    LUIZ[👤 Luiz] -->|captura| INBOX
    INBOX[🟠 01 - Inbox] -->|processa| CEO

    CEO[🔴 99_System / CEO] -->|distribui| PROJETOS
    CEO -->|distribui| AREAS
    CEO -->|distribui| RECURSOS
    CEO -->|arquiva| ARQUIVO

    PROJETOS[🟢 03 - Projetos]
    PROJETOS --> P1[Kermartin]
    PROJETOS --> P2[estagio-juridico]
    PROJETOS --> P3[faculdade-direito]
    PROJETOS --> P4[C# / Unity]

    AREAS[🔵 04 - Áreas]
    AREAS --> A1[Direito]
    AREAS --> A2[Comercial]
    AREAS --> A3[Programação]
    AREAS --> A4[Pessoal]

    RECURSOS[🟣 05 - Recursos]
    RECURSOS --> R1[Dev]
    RECURSOS --> R2[Direito]
    RECURSOS --> R3[Geral]

    IDEIAS[🩷 06 - Ideias] -->|madura| PROJETOS
    IDEIAS -->|referência| RECURSOS

    PROJETOS -->|conclui| ARQUIVO[⚫ 07 - Arquivo]
    AREAS -->|backlink| PROJETOS
    RECURSOS -->|alimenta| AREAS

    DIARIO[🟡 02 - Diário] -->|contexto diário| CEO

    style CEO fill:#D32F2F,color:#fff
    style INBOX fill:#F57C00,color:#fff
    style DIARIO fill:#F9A825,color:#000
    style PROJETOS fill:#2E7D32,color:#fff
    style AREAS fill:#1565C0,color:#fff
    style RECURSOS fill:#6A1B9A,color:#fff
    style IDEIAS fill:#AD1457,color:#fff
    style ARQUIVO fill:#424242,color:#fff
```

---

## 🤖 Hierarquia de Agentes

```mermaid
graph TD
    LUIZ[👤 Luiz — dono]
    CEO[🔴 CEO — orquestrador]

    LUIZ --> CEO

    CEO --> GJ[⚖️ gerente-juridico]
    CEO --> GC[💼 gerente-comercial]
    CEO --> GD[💻 gerente-dev]
    CEO --> GP[📚 gerente-pesquisa]
    CEO --> GPES[🏠 gerente-pessoal]

    GJ --> EX1[executor]
    GJ --> RV1[revisor]
    GJ --> PS1[pesquisador]

    GC --> EX2[executor]
    GD --> EX3[executor]
    GP --> EX4[executor]
    GPES --> EX5[executor]
```

---

## 🔄 Fluxo de uma Tarefa

```mermaid
flowchart LR
    A["📥 Luiz\njoga na Inbox"] --> B["🤖 CEO\nanálisa e distribui"]
    B --> C["👔 Gerente\nplaneja"]
    C --> D["⚙️ Executor\nexecuta"]
    D --> E["🔍 Revisor\nvalida"]
    E -->|aprovado| F["✅ Concluída\nKANBAN atualizado"]
    E -->|reprovado| D
    B --> KANBAN["📋 KANBAN.md\ncard criado"]
    F --> KANBAN
```

---

## 🎨 Legenda de Cores

| Cor | Pasta | Tipo |
|-----|-------|------|
| 🔴 Vermelho `#D32F2F` | `99_System` | Sistema / Controle |
| 🟠 Laranja `#F57C00` | `01 - Inbox` | Captura |
| 🟡 Amarelo `#F9A825` | `02 - Diário` | Temporal |
| 🟢 Verde `#2E7D32` | `03 - Projetos` | Projetos |
| 🔵 Azul `#1565C0` | `04 - Áreas` | Áreas de vida |
| 🟣 Roxo `#6A1B9A` | `05 - Recursos` | Referências |
| 🩷 Rosa `#AD1457` | `06 - Ideias` | Ideias brutas |
| ⚫ Cinza `#424242` | `07 - Arquivo` | Arquivado |

---

## 🗺️ Links Rápidos

- [[14_Indexes/MAPA]] — índice navegável
- [[99_System/TAREFAS]] — status e log de sessões
- [[99_System/KANBAN]] — painel visual de tarefas
- [[01_Dashboard/000-Dashboard]] — dashboard com Dataview
- [[04_Projects/moc-projetos]] — índice de todos os projetos
- [[10_Learning/Direito/moc-direito]] — MOC Jurídico
- [[10_Learning/Programação/moc-programacao]] — MOC Programação
- [[03_Entities/moc-comercial]] — MOC Comercial
- [[03_Entities/moc-pessoal]] — MOC Pessoal
