---
tipo: sistema
dominio: geral
tipo_nota: procedimento
nivel: avancado
status_nota: ativo
atualizado: 2026-05-31
tags: [sistema, ia, projetos, expansao, fusao, melhoria]
---

# Protocolo de Expansao de Projetos

Este protocolo permite que IAs do vault proponham evolucao, aprimoramento, novo uso ou uniao de projetos existentes. Nao autoriza mudanca de escopo sem aprovacao do Luiz.

## Objetivo

Permitir que a IA:

- identifique oportunidades novas em projetos existentes;
- proponha novos objetivos para um projeto;
- sugira uniao de dois ou mais projetos;
- sugira recorte, desdobramento ou spin-off quando fizer sentido;
- mantenha rastreabilidade e separacao entre proposta e execucao.

## Tipos de movimento

| Tipo | Quando usar | Resultado esperado |
|---|---|---|
| Evolucao | o projeto atual continua valido, mas pode ganhar nova capacidade | roteiro incremental |
| Aprimoramento | existe problema claro de qualidade, ergonomia ou confiabilidade | melhoria pontual ou tecnica |
| Novo uso | o mesmo projeto pode atender outro objetivo | novo caso de uso documentado |
| Uniao | dois projetos compartilham motor, dados ou interface | consolidacao planejada |
| Spin-off | um subdominio cresceu demais e merece projeto proprio | desmembramento com fronteira clara |
| Reposicionamento | o projeto muda de foco principal | redefinicao de objetivo e escopo |

## Gatilhos de proposta

A IA pode propor uma expansao quando perceber:

- reutilizacao clara do mesmo motor tecnico;
- alto grau de sobreposicao entre projetos;
- necessidade de reduzir duplicacao;
- mesma fonte de dados servindo a mais de um objetivo;
- oportunidade comercial ou operacional nova;
- uma arquitetura ficando grande demais para um unico escopo;
- sinal de que um projeto pode virar plataforma, modulo ou familia de produtos.

## Regra de autorizacao

Antes de alterar escopo, nome, objetivo, estrutura ou relacoes entre projetos, a IA deve:

1. Registrar a proposta em texto claro.
2. Explicar o motivo tecnico e operacional.
3. Mostrar impacto em cada projeto afetado.
4. Pedir autorizacao explicita do Luiz.
5. Aguardar resposta antes de editar qualquer spec, ADR, tarefa ou nota de projeto.

Sem autorizacao, a IA pode apenas:

- sugerir;
- comparar alternativas;
- criar nota de proposta;
- apontar risco e beneficio;
- listar possiveis fusoes ou desdobramentos.

## Estrutura da proposta

Toda proposta deve responder:

- O que muda.
- Por que mudar.
- Quais projetos sao afetados.
- O que ganha.
- O que perde.
- Quanto custa em complexidade.
- Qual opcao minima segura existe.
- Qual decisao o Luiz precisa tomar.

## Formato recomendado

```md
# Proposta de Evolucao

## Contexto

## Oportunidade identificada

## Projetos afetados

## Opcao A - manter separado

## Opcao B - evoluir

## Opcao C - unir

## Riscos

## Recomendacao tecnica

## Autorizacao solicitada
```

## Regras de integridade

- Nunca alterar escopo por inferencia silenciosa.
- Nunca unir projetos so por parecidos.
- Nunca quebrar o historico do vault.
- Nunca apagar uma identidade de projeto sem registrar decisao.
- Sempre registrar ADR quando a mudanca for estrutural.
- Sempre manter links entre projeto original e nova proposta.

## Quando criar nova nota

Criar uma nota em `05_Research/` ou `07_Decisions/` quando a expansao ainda estiver em analise.
Criar ou atualizar `04_Projects/[projeto]/` quando o Luiz aprovar a nova direcao.

