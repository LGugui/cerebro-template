---
curado: 2026-05-26
---
﻿---
data: YYYY-MM-DD
tipo: projeto
área: programação
status: ativo
tags: [ia, projeto]
dominio: dev
tipo_nota: projeto
nivel: avançado
status_nota: ativo
---

# [Nome do Projeto de IA]

> SDD completo para projetos de IA. Preencher todas as seções antes de implementar.
> Referência: [[10_Learning/Desenvolvimento/IA e Automação/sdd-projetos-ia]]

---

## 1. Visão

**Problema:** [problema específico que o sistema resolve]

**Solução em 1 frase:** [o que o agente/modelo faz]

**Critério de sucesso mensurável:** [ex: "precisão ≥ 90%", "cria 5 notas/dia relevantes"]

**Fora do escopo:**
- [o que este projeto explicitamente NÃO faz]

---

## 2. Diagnóstico

- **Tipo de IA:** LLM / classificador / agente / RAG / visão / outro
- **Tamanho:** mini (< 5 features) / médio (5–15) / grande (15+)
- **Inferência:** real-time / batch / edge / local
- **LLM:** local (Ollama) / cloud (Groq, Anthropic, OpenAI)
- **Integrações externas:** [listar]
- **Agente único ou multiagente?** [decisão]

---

## 3. Domain Model

| Termo | Definição |
|-------|-----------|
| [termo] | [definição no contexto deste projeto] |

---

## 4. Design do Modelo *(seção crítica)*

| Campo | Decisão |
|-------|---------|
| Tipo de modelo | [LLM, classificação, RAG, etc.] |
| Modelo base | [mistral, llama3, claude, etc.] |
| Fine-tuning? | sim / não — motivo |
| Estratégia | [prompting / RAG / agente] |

### 4.1. Datasets
- **Origem:** [onde os dados vêm]
- **Tamanho:** [quantidade estimada]
- **Divisão:** train / val / test
- **Curadoria:** [como selecionar e limpar dados]

### 4.2. Métricas de avaliação
- [ex: precisão, recall, F1, latência, custo por token]

### 4.3. Estratégia de inferência
- [batch / real-time | local / cloud | cache de respostas?]

---

## 5. Arquitetura / Stack

- **Stack:** [Python, framework, banco, cloud]
- **Localização:** [caminho local ou repo]

### Módulos

| Arquivo | Responsabilidade |
|---------|-----------------|
| `main.py` | [orquestrador] |
| [módulo] | [responsabilidade] |

### Fluxo de dados

```
[Fonte] → [Pré-processamento] → [Modelo] → [Saída] → [Armazenamento]
```

---

## 6. Design de Dados

- **Fontes:** [APIs, arquivos, banco, streams]
- **Pré-processamento:** [normalização, tokenização, limpeza]
- **Armazenamento:** [SQL / NoSQL / vetorial / arquivo]
- **Governança:** [LGPD, retenção, anonimização se aplicável]

---

## 7. Ética e Alinhamento

- **Viés potencial:** [grupos sub-representados nos dados?]
- **Explicabilidade:** [como o modelo decide? usuário precisa entender?]
- **Guardrails:** [regras que impedem ações destrutivas]
- **Alinhamento:** [comportamento esperado vs comportamento indesejado]

---

## 8. Parâmetros de qualidade

| Parâmetro | Valor | Efeito |
|-----------|-------|--------|
| [nome] | [valor] | [o que controla] |

---

## 9. Plano de Testes

- [ ] Testes de unidade — componentes isolados
- [ ] Testes de integração — pipeline completo
- [ ] Avaliação do modelo — test set com métricas
- [ ] Teste de robustez — edge cases, dados ruidosos
- [ ] Teste de guardrails — verifica que proteções funcionam

---

## 10. Deploy e Manutenção

- **Estratégia:** [local / Docker / cloud / GitHub Actions]
- **Monitoramento:** [o que observar em produção]
- **Retreinamento:** [gatilho: performance < X% | frequência: semanal]
- **Rollback:** [como reverter para versão anterior]

---

## 11. Roadmap de Features

| # | Feature | Status | Spec |
|---|---------|--------|------|
| 1 | [nome] | Backlog | `specs/feature-[nome].md` |

---

## 12. Decisões (ADRs)

| ADR | Decisão | Status |
|-----|---------|--------|
| ADR-001 | [decisão principal de arquitetura] | Aceito |

---

## 13. O que NÃO fazer

- NÃO [guardrail principal]
- NÃO usar APIs pagas sem aprovação
- NÃO deletar dados sem backup

---

## 14. Log de Progresso

| Data | Fase | O que foi feito |
|------|------|----------------|
| YYYY-MM-DD | Setup | Spec inicial criada |

---

## Relacionado

- [[10_Learning/Desenvolvimento/IA e Automação/sdd-projetos-ia]] — referência do framework
- [[04_Projects/[projeto]/specs/]] — feature specs
- [[07_Decisions/]] — ADRs
