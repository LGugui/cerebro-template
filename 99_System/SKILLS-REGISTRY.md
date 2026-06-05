---
tipo: sistema
dominio: geral
tipo_nota: recurso
status_nota: ativo
atualizado: 2026-06-02
---

# Skills Registry — Vault Cérebro

Todas as skills disponíveis no Claude Code, organizadas por categoria e domínio.  
Usar como referência para escolher a skill certa. Skills com `*` são as mais usadas neste vault.

---

## 1. Sessão & Vault

Skills do ciclo de vida de uma sessão de trabalho.

| Skill | Gatilho | Output |
|---|---|---|
| `/inicio` * | início de sessão, "menu", "começar" | menu interativo com contexto por domínio |
| `/encerrar` * | "encerrar", "fechar sessão", "pronto" | log TAREFAS.md + session-summary.md |
| `/status` | "status", "como está", snapshot | relatório visual de tarefas e domínios |
| `/briefing` | "briefing", "prioridades de hoje" | 3 prioridades do dia |
| `/revisao-semanal` | fim de semana, "revisão semanal" | síntese semanal do vault |
| `/processar-inbox` * | "processar inbox", "classificar" | arquivos movidos + tarefas criadas |
| `/obsidian` | "auditar vault", "gerar MOC" | auditoria / MOC atualizado |
| `/melhorar` * | "melhora X", "o que posso melhorar" | diagnóstico ranqueado impacto×esforço |
| `/context-save` | "salvar contexto", fim de sessão longa | contexto salvo para retomar |
| `/context-restore` | "restaurar contexto", início com contexto salvo | contexto restaurado |
| `/standup-notes` | "standup", "daily" | notas de standup formatadas |
| `/pesquisar` * | "/pesquisar TEMA", "busca web X" | nota em `05_Research/` + update MAPA |
| `/absorver` * | URLs, repos GitHub, textos, dados brutos, código front-end, screenshots | extrai conhecimento útil, descarta ruído, salva nota estruturada; aciona `/visual-intelligence` automaticamente para entradas visuais/código |
| `/visual-intelligence` * | CSS, Tailwind, tokens JS, componentes React/Vue, scripts Figma, URLs, screenshots, wireframes | extrai paleta/tipografia/espaçamento/componentes via código; gera Estrutura + Visual detalhado + Localização + Guia de Replicação + Aprimoramentos |

---

## 2. Projetos & Tarefas

Skills para gestão de projetos e tarefas no vault + Paperclip.

| Skill | Gatilho | Output | Domínio |
|---|---|---|---|
| `/novo-projeto` * | "novo projeto", "estrutura SDD" | `04_Projects/[nome]/` completo | todos |
| `/nova-feature` * | "nova feature", "nova funcionalidade" | `specs/feature-[nome].md` + KANBAN | dev, comercial |
| `/nova-tarefa` * | "nova tarefa", "adicionar ao kanban" | bloco equipes/*.md + KANBAN + Paperclip | todos |
| `/adr` * | "criar ADR", "registrar decisão" | `07_Decisions/ADR-NNN.md` | todos |
| `/paperclip` | sync Paperclip, heartbeat, checkout | issue atualizada via API | todos |
| `/paperclip-converting-plans-to-tasks` | "converter plano em tasks" | issues criadas no Paperclip | todos |
| `/agile-sprint-planning` | planejamento de sprint | sprint board + backlog | dev |
| `/project-estimation` | "estimar projeto", "quanto tempo leva" | estimativa com breakdown | dev |
| `/requirements-gathering` | "levantar requisitos" | documento de requisitos | todos |
| `/technical-roadmap-planning` | "roadmap técnico" | roadmap com fases e marcos | dev |
| `/release-planning` | "planejar release", "planejar versão" | plano de release | dev |

---

## 3. Desenvolvimento — Código

Skills de implementação, frameworks e arquitetura.

### Revisão & Qualidade
| Skill | Uso |
|---|---|
| `/code-review` * | revisar diff, PR, arquivo — `--fix` aplica correções |
| `/simplify` | limpar código após implementação |
| `/full-review` | revisão profunda multi-arquivo |
| `/security-review` | auditoria de segurança |
| `/review` | revisão geral |
| `/verify` | verificar que mudança funciona no app real |
| `/run` | iniciar app e testar comportamento |

### Implementação
| Skill | Domínio |
|---|---|
| `/tdd-cycle` | ciclo Red-Green-Refactor | dev |
| `/doc-generate` | gerar documentação de código | dev |
| `/debug-trace` | rastrear bug com logs e traces | dev |
| `/refactor-legacy-code` | refatorar código legado | dev |
| `/design-patterns-implementation` | aplicar padrões GoF | dev |
| `/init` | inicializar projeto com estrutura padrão | dev |

### APIs & Backend
| Skill | Stack |
|---|---|
| `/rest-api-design` | design RESTful + OpenAPI |
| `/graphql-implementation` | GraphQL schema + resolvers |
| `/grpc-service-development` | gRPC protos + serviços |
| `/nodejs-express-server` | Node.js + Express |
| `/fastapi-development` | Python + FastAPI |
| `/flask-api-development` | Python + Flask |
| `/django-application` | Python + Django |
| `/spring-boot-application` | Java + Spring Boot |
| `/ruby-rails-application` | Ruby on Rails |

### Frontend
| Skill | Stack |
|---|---|
| `/react-component-architecture` * | React + componentes |
| `/vue-application-structure` | Vue 3 |
| `/angular-module-design` | Angular |
| `/shadcn-ui` * | shadcn/ui + Radix |
| `/tailwind-design-system` | Tailwind CSS |
| `/frontend-state-management` | Zustand, Redux, Jotai |
| `/frontend-routing` | React Router, TanStack Router |
| `/progressive-web-app` | PWA + service workers |
| `/server-side-rendering` | SSR + hydration |

### Mobile
| Skill | Stack |
|---|---|
| `/react-native-app` | React Native |
| `/flutter-development` | Flutter + Dart |
| `/ios-swift-development` | Swift + SwiftUI |
| `/android-kotlin-development` | Kotlin + Jetpack |

### Banco de Dados
| Skill | Uso |
|---|---|
| `/database-schema-design` | modelagem de schema |
| `/database-indexing-strategy` | estratégia de índices |
| `/database-query-optimization` | queries lentas |
| `/database-migration-management` | migrations versionadas |
| `/database-schema-documentation` | documentar schema |
| `/sql-query-optimization` | SQL específico |
| `/nosql-database-design` | MongoDB, DynamoDB, etc. |
| `/database-sharding` | sharding horizontal |
| `/database-monitoring` | métricas e alertas |

### Testes
| Skill | Tipo |
|---|---|
| `/unit-testing-framework` | unitários |
| `/integration-testing` | integração |
| `/e2e-testing-automation` | end-to-end (Playwright, Cypress) |
| `/frontend-testing` | componentes React |
| `/api-contract-testing` | testes de contrato |
| `/mutation-testing` | mutation testing |
| `/property-based-testing` | testes baseados em propriedade |
| `/visual-regression-testing` | regressão visual |
| `/performance-testing` | carga e stress |
| `/stress-testing` | stress testing |
| `/continuous-testing` | CI testing pipeline |
| `/test-data-generation` | gerar dados de teste |
| `/mocking-stubbing` | mocks e stubs |

---

## 4. Design & Figma

Skills de design, UI/UX e Figma. **Usar bridge local — ver `COMANDOS-PADRAO.md`.**

### Figma (plugin local — sem URL)
| Skill | Uso |
|---|---|
| `/figma` ou `figma:figma-use` * | executar qualquer código Plugin API no arquivo aberto |
| `figma:figma-generate-design` * | gerar telas/layouts a partir de design system |
| `figma:figma-generate-library` * | criar componentes, variantes, tokens |
| `figma:figma-generate-diagram` | diagramas e fluxos no Figma |
| `figma:figma-create-new-file` | criar novo arquivo Figma |
| `figma:figma-use-figjam` | FigJam — quadros colaborativos |
| `figma:figma-use-slides` | Figma Slides — apresentações |
| `figma:figma-code-connect` | conectar código React a componentes Figma |

### UI/UX & Design System
| Skill | Uso |
|---|---|
| `/visual-intelligence` * | **extração via código** (CSS/Tailwind/tokens/React/Figma scripts) + URLs/screenshots; entrega: Estrutura + Visual detalhado + Localização + **Guia de Replicação** + **Aprimoramentos**; ativada por `/absorver` automaticamente |
| `/design-system-creation` | criar design system do zero |
| `/wireframe-prototyping` | wireframes e protótipos |
| `/design-handoff` | handoff dev com specs e assets |

> **Fluxo de criação:** `[[fluxo-criacao-design-figma]]` — processo híbrido (2 perguntas + referências automáticas + execução bridge)
| `/information-architecture` | IA de conteúdo e navegação |
| `/interaction-design` | microinterações e fluxos |
| `/mobile-first-design` | design mobile-first |
| `/responsive-web-design` | layouts responsivos |
| `/user-persona-creation` | criar personas de usuário |
| `/user-story-writing` | escrever user stories |
| `/user-research-analysis` | analisar pesquisa com usuários |
| `/accessibility-compliance` | WCAG e acessibilidade |
| `/color-accessibility` | contraste e cor acessível |
| `/web-design-guidelines` | diretrizes de design web |
| `/landing-page-design` | design de landing pages |
| `/layout-analyzer` | analisar layout existente |
| `/kpi-dashboard-design` | design de dashboards |
| `/brand-designer` | identidade visual e branding |
| `/brand-guidelines-generator` | manual de marca |

---

## 5. IA & Claude API

Skills para construir aplicações com IA e Claude.

| Skill | Uso |
|---|---|
| `/claude-api` * | Claude API / Anthropic SDK, prompt caching, tool use, batch |
| `/ai-agent-builder` | construir agentes autônomos |
| `vercel:ai-sdk` | Vercel AI SDK + streaming |
| `vercel:ai-gateway` | AI Gateway da Vercel |
| `vercel:chat-sdk` | chat com streaming |
| `/recommendation-engine` | sistema de recomendação |
| `/recommendation-system` | ML recomendação |
| `/ml-model-training` | treinar modelos ML |
| `/ml-model-explanation` | explicabilidade de modelos |
| `/model-deployment` | deploy de modelos |
| `/model-monitoring` | monitorar modelos em prod |
| `/ml-pipeline-automation` | pipeline ML automatizado |
| `/natural-language-processing` | NLP: classificação, extração |
| `/computer-vision` | visão computacional |
| `/neural-network-design` | arquitetura de redes neurais |
| `/anomaly-detection` | detecção de anomalias |
| `/sentiment-analysis` | análise de sentimento |
| `/classification-modeling` | modelos de classificação |
| `/regression-modeling` | modelos de regressão |
| `/clustering-analysis` | clustering não supervisionado |
| `/time-series-analysis` | séries temporais |
| `/feature-engineering` | engenharia de features |

---

## 6. Deploy & Infraestrutura

### Vercel
| Skill | Uso |
|---|---|
| `vercel:deploy` * | deploy de projeto |
| `vercel:bootstrap` | criar projeto Vercel do zero |
| `vercel:env` | gerenciar variáveis de ambiente |
| `vercel:status` | status de deploys |
| `vercel:nextjs` * | Next.js na Vercel |
| `vercel:shadcn` | shadcn/ui + Vercel |
| `vercel:vercel-functions` | Vercel Functions |
| `vercel:vercel-storage` | KV, Postgres, Blob |
| `vercel:routing-middleware` | middleware e rewrites |
| `vercel:runtime-cache` | caching no edge |
| `vercel:next-cache-components` | cache components Next.js |
| `vercel:turbopack` | Turbopack |
| `vercel:next-forge` | next-forge boilerplate |
| `vercel:next-upgrade` | upgrade versão Next.js |
| `vercel:vercel-firewall` | firewall e WAF |

### CI/CD
| Skill | Uso |
|---|---|
| `/cicd-pipeline-setup` | setup pipeline completo |
| `/github-actions-workflow` * | GitHub Actions |
| `/gitlab-cicd-pipeline` | GitLab CI |
| `/jenkins-pipeline` | Jenkins |
| `/blue-green-deployment` | deploy blue-green |
| `/canary-deployment` | deploy canário |
| `/deployment-automation` | automação de deploy |

### Container & Orquestração
| Skill | Uso |
|---|---|
| `/docker-containerization` | Dockerizar aplicação |
| `/kubernetes-deployment` | deploy no K8s |
| `/container-registry-management` | gerenciar imagens |

### Cloud
| Skill | Provider |
|---|---|
| `/aws-ec2-setup` | AWS EC2 |
| `/aws-lambda-functions` | AWS Lambda |
| `/aws-s3-management` | AWS S3 |
| `/aws-rds-database` | AWS RDS |
| `/aws-cloudfront-cdn` | AWS CloudFront |
| `/azure-app-service` | Azure App Service |
| `/azure-functions` | Azure Functions |
| `/gcp-cloud-functions` | GCP Cloud Functions |
| `/gcp-cloud-run` | GCP Cloud Run |
| `/terraform-infrastructure` | IaC Terraform |
| `/ansible-automation` | Ansible playbooks |

### Monitoramento
| Skill | Uso |
|---|---|
| `/grafana-dashboard` | dashboards Grafana |
| `/prometheus-monitoring` | métricas Prometheus |
| `/uptime-monitoring` | monitoramento de uptime |
| `/log-aggregation` | agregação de logs |
| `/distributed-tracing` | tracing distribuído |
| `/correlation-tracing` | correlação de traces |
| `/infrastructure-monitoring` | monitorar infra |
| `/synthetic-monitoring` | testes sintéticos |
| `/error-tracking` | rastrear erros em prod |
| `/alert-management` | gerenciar alertas |

---

## 7. Automação & Integrações

### Google Workspace
| Skill | Uso |
|---|---|
| `/gmail-workflows` * | Gmail: criar draft, buscar, rotular |
| `/calendar-automation` * | Google Calendar: criar eventos, sugerir horários |
| `/sheets-automation` | Google Sheets |

### Comunicação
| Skill | Plataforma |
|---|---|
| `/slack-workflows` | Slack |
| `/microsoft-teams-automation` | Teams |
| `/telegram-bot` | Telegram |
| `/discord-bot` | Discord |
| `/whatsapp-automation` | WhatsApp |
| `/twilio-sms-automation` | SMS via Twilio |

### Gestão de Projetos
| Skill | Plataforma |
|---|---|
| `/notion-automation` | Notion |
| `/airtable-automation` | Airtable |
| `/asana-automation` | Asana |
| `/trello-automation` | Trello |
| `/jira-automation` | Jira |
| `/linear-automation` | Linear |
| `/clickup-automation` | ClickUp |
| `/monday.com-automation` | Monday.com |

### CRM & Vendas
| Skill | Plataforma |
|---|---|
| `/crm-automation` | CRM genérico |
| `/crm-builder` | construir CRM |
| `/pipedrive-automation` | Pipedrive |
| `/intercom-automation` | Intercom |
| `/zendesk-automation` | Zendesk |
| `/hubspot` | HubSpot |

### Webhooks & Workflows
| Skill | Uso |
|---|---|
| `/n8n-workflow` * | n8n fluxos de automação |
| `/webhook-automation` | automação via webhooks |
| `/webhook-development` | criar endpoints de webhook |
| `/webhook-integration` | integrar webhooks |
| `/apple-shortcuts-integration` | Shortcuts iOS/macOS |
| `/home-assistant-automation` | Home Assistant |

### Financeiro & Pagamentos
| Skill | Uso |
|---|---|
| `/stripe-payments` | Stripe — pagamentos |
| `/subscription-management` | assinaturas |
| `/payment-gateway-integration` | gateway genérico |
| `/quickbooks-automation` | QuickBooks |
| `/docusign-automation` | DocuSign |
| `/invoice-automation` | faturas automáticas |

### Social & Marketing
| Skill | Plataforma |
|---|---|
| `/linkedin-automation` | LinkedIn |
| `/twitter-x-automation` | X/Twitter |
| `/youtube-automation` | YouTube |
| `/tiktok-marketing` | TikTok |
| `/facebook-meta-ads` | Meta Ads |
| `/google-ads-manager` | Google Ads |
| `/mailchimp-automation` | Mailchimp |
| `/email-marketing` | email marketing genérico |
| `/social-publisher` | publicador multi-plataforma |
| `/podcast-automation` | automação de podcast |
| `/shopify-automation` | Shopify |
| `/woocommerce-automation` | WooCommerce |
| `/amazon-seller` | Amazon Seller Central |

---

## 8. Dados & Analytics

| Skill | Uso |
|---|---|
| `/data-analysis` * | análise exploratória de dados |
| `/data-visualization` | gráficos e dashboards de dados |
| `/data-pipeline` | pipeline de dados |
| `/etl-pipeline` | ETL completo |
| `/exploratory-data-analysis` | EDA detalhada |
| `/statistical-hypothesis-testing` | testes estatísticos |
| `/correlation-analysis` | análise de correlação |
| `/cohort-analysis` | análise de coorte |
| `/funnel-analysis` | análise de funil |
| `/a-b-test-analysis` | análise de A/B test |
| `/saas-metrics` | métricas SaaS (MRR, churn, LTV) |
| `/survival-analysis` | análise de sobrevivência |
| `/causal-inference` | inferência causal |
| `/dimensionality-reduction` | PCA, t-SNE, UMAP |
| `/data-cleaning-pipeline` | limpeza de dados |
| `/data-migration-scripts` | migração de dados |
| `/data-replication-setup` | replicação de dados |
| `/batch-processing-jobs` | jobs em lote |
| `/query-caching-strategies` | cache de queries |
| `/stored-procedures` | procedures SQL |

---

## 9. Arquivos & Documentos

| Skill | Formato | Capacidades |
|---|---|---|
| `/pdf` * | PDF | extração, formulário, converter, merge, split, OCR, watermark, comprimir |
| `/docx` * | DOCX | editar, gerar, comentários, aceitar alterações |
| `/xlsx` * | XLSX | editar planilhas, fórmulas, análise |
| `/pdf-extraction` | PDF | extração estruturada |
| `/pdf-ocr-extraction` | PDF | OCR em PDFs escaneados |
| `/pdf-to-docx` | PDF→DOCX | conversão |
| `/smart-ocr` | imagem/PDF | OCR inteligente |
| `/table-extractor` | qualquer | extrair tabelas |
| `/doc-parser` | qualquer | parsear documentos |
| `/doc-pipeline` | qualquer | pipeline de documentos |
| `/markdown-documentation` | MD | documentação em Markdown |
| `/office-mcp` | Office | Office via MCP |
| `/office-to-md` | Office→MD | converter para Markdown |
| `/md-to-office` | MD→Office | converter de Markdown |
| `/chat-with-pdf` | PDF | conversar com conteúdo do PDF |
| `/batch-convert` | qualquer | converter arquivos em lote |

---

## 10. Segurança

| Skill | Uso |
|---|---|
| `/security-review` * | auditoria de segurança de código |
| `/penetration-testing` | teste de penetração (contexto autorizado) |
| `/vulnerability-scanning` | scan de vulnerabilidades |
| `/api-security-hardening` | hardening de APIs |
| `/security-headers-configuration` | headers HTTP de segurança |
| `/csrf-protection` | proteção CSRF |
| `/xss-prevention` | prevenção XSS |
| `/sql-injection-prevention` | prevenção SQL injection |
| `/oauth-implementation` | OAuth 2.0 |
| `/api-authentication` | auth de APIs |
| `/session-management` | gestão de sessões |
| `/data-encryption` | criptografia de dados |
| `/secrets-management` | gestão de secrets |
| `/secrets-rotation` | rotação de secrets |
| `/zero-trust-architecture` | arquitetura zero trust |
| `/security-compliance-audit` | auditoria de conformidade |
| `/security-documentation` | documentação de segurança |
| `/security-monitoring` | monitoramento de segurança |
| `/security-testing` | testes de segurança |
| `/network-security-groups` | grupos de segurança de rede |
| `/suspicious-email-analyzer` | analisar email suspeito |
| `/access-control-rbac` | RBAC |

---

## 11. Conteúdo & Texto

| Skill | Uso |
|---|---|
| `/pesquisar` | pesquisa web + nota no vault |
| `/deep-research` | pesquisa profunda multi-fonte |
| `/academic-search` | busca acadêmica |
| `/web-search` | busca web genérica |
| `/news-monitor` | monitorar notícias |
| `/content-research-writer` | pesquisar e escrever conteúdo |
| `/seo-optimizer` | otimização SEO |
| `/landing-page-copywriter` | copy de landing page |
| `/ads-copywriter` | copy de anúncios |
| `/email-drafter` | redigir emails |
| `/email-classifier` | classificar emails |
| `/proposal-writer` | escrever propostas |
| `/cover-letter` | carta de apresentação |
| `/cv-builder` | currículo |
| `/resume-tailor` | adaptar currículo para vaga |
| `/weekly-report` | relatório semanal |
| `/report-generator` | gerar relatórios |
| `/meeting-notes` | notas de reunião |
| `/infographic` | criar infográfico |
| `/ai-slides` | apresentações com IA |
| `/html-slides` | slides em HTML |
| `/dev-slides` | slides para devs |
| `/md-slides` | slides em Markdown |
| `/ppt-visual` | apresentação visual |
| `/diagram-creator` | criar diagramas |
| `/architecture-diagrams` | diagramas de arquitetura |

---

## 12. Comercial & Negócios (domínio deste vault)

| Skill | Uso | Projeto |
|---|---|---|
| `/company-research` | pesquisar empresa | prospecção |
| `/competitive-analysis` | análise competitiva | comercial |
| `/competitor-analysis` | análise de concorrente | comercial |
| `/lead-qualification` | qualificar leads | WH Technology |
| `/lead-research-assistant` | pesquisar leads | WH Technology |
| `/lead-routing` | roteamento de leads | WH Technology |
| `/sales-qualification` | qualificar vendas | WH Technology |
| `/sales-enablement` | habilitar vendas | WH Technology |
| `/customer-success` | sucesso do cliente | WH Technology |
| `/gap-analysis` | análise de gaps | comercial |
| `/business-case-development` | desenvolver caso de negócio | BlackCore |
| `/financial-modeling` | modelagem financeira | BlackCore |
| `/investment-memo` | memo de investimento | BlackCore |
| `/dcf-valuation` | avaliação DCF | BlackCore |
| `/risk-assessment` | avaliação de risco | todos |
| `/contract-review` | revisar contratos | jurídico |
| `/contract-template` | template de contrato | jurídico |
| `/nda-generator` | gerar NDA | jurídico |
| `/job-description-generator` | descrição de vaga | RH |
| `/applicant-screening` | triagem de candidatos | RH |
| `/offer-letter-generator` | carta de oferta | RH |

---

## Guia Rápido de Escolha

```
Iniciar sessão                 → /inicio
Pesquisar tema na web          → /pesquisar TEMA
Nova tarefa                    → /nova-tarefa
Nova feature com spec          → /nova-feature
Novo projeto completo          → /novo-projeto
Revisar código                 → /code-review
Trabalhar no Figma             → /figma (bridge local)
Extrair padrão visual/código   → /visual-intelligence
Absorver URL/repo/código       → /absorver (aciona visual-intelligence auto)
Fazer deploy Vercel            → vercel:deploy
Automação com Claude API       → /claude-api
PDF / DOCX / XLSX              → /pdf | /docx | /xlsx
Análise de dados               → /data-analysis
Fechar sessão                  → /encerrar
```

---

## 13. Claude Code — Comandos Nativos & Modelos

### Comandos built-in (não são skills customizadas)

| Comando | Função |
|---|---|
| `/help` | mostrar ajuda e lista de comandos |
| `/clear` | limpar conversa atual |
| `/compact` | compactar contexto para economizar tokens |
| `/cost` | mostrar custo da sessão atual |
| `/config` | configurar settings (tema, modelo, etc.) |
| `/doctor` | diagnosticar problemas de configuração |
| `/init` | inicializar projeto com CLAUDE.md |
| `/login` / `/logout` | autenticação |
| `/memory` | gerenciar memória persistente |
| `/model` | trocar modelo ativo |
| `/pr-comments` | ver comentários de PR inline |
| `/status` | status do projeto (git, tasks) |
| `/terminal-setup` | configurar terminal e shell |
| `/vim` | ativar modo vim no editor |
| `/fast` | alternar fast mode (Opus com output mais rápido) |

### Modo Caveman (ativo neste vault)

| Comando | Efeito |
|---|---|
| `/caveman` | ativar modo caveman (nível full) |
| `/caveman lite` | resposta concisa, mantém artigos |
| `/caveman full` | remove artigos, filler, floreios |
| `/caveman ultra` | fragmentos máximos, sem verbos auxiliares |
| `stop caveman` / `normal mode` | desativar |

Configurado via hook `SessionStart` em `~/.claude/hooks/` — ativo automaticamente.

### Modelos disponíveis (família Claude 4)

| Modelo | ID | Uso ideal |
|---|---|---|
| **Opus 4.8** | `claude-opus-4-8` | tarefas complexas, raciocínio profundo, produção |
| **Sonnet 4.6** | `claude-sonnet-4-6` | padrão — equilíbrio qualidade/custo |
| **Haiku 4.5** | `claude-haiku-4-5-20251001` | rápido, tarefas simples, alto volume |

Trocar modelo: `/model` ou `claude --model claude-opus-4-8`

### Skills de infraestrutura Claude Code

| Skill | Uso |
|---|---|
| `/loop` | executar skill em loop com intervalo (`/loop 5m /foo`) |
| `/schedule` | agendar execução recorrente de rotinas |
| `/code-review ultra` | revisão profunda multi-agente na nuvem |
| `/fewer-permission-prompts` | reduzir prompts de permissão |
| `/update-config` | configurar settings.json e hooks |
| `/keybindings-help` | customizar atalhos de teclado |
| `/caveman:cavecrew` | orquestrar equipe de subagentes |
| `update-config` | automações via hooks (SessionStart, PostToolUse, etc.) |

### Subagentes disponíveis (Agent tool)

| Agente | Especialidade |
|---|---|
| `caveman:cavecrew-builder` | edits cirúrgicos 1-2 arquivos |
| `caveman:cavecrew-investigator` | localizar código (read-only) |
| `caveman:cavecrew-reviewer` | revisar diffs e branches |
| `Explore` | busca ampla no codebase |
| `Plan` | arquitetura e planos de implementação |
| `claude-code-guide` | dúvidas sobre Claude Code / API |
| `vercel:ai-architect` | apps IA na Vercel |
| `vercel:deployment-expert` | deploy e CI/CD Vercel |
| `revisor` | verificar critérios de aceitação de nota vault |

---

## 14. Outras IAs — Capacidades & Arquivos de Entrada

### Gemini CLI (Google)

**Arquivo lido:** `GEMINI.md` (na raiz do vault) → redireciona para `AI-INSTRUCTIONS.md`

| Capacidade | Notas |
|---|---|
| Geração e edição de código | suporte multi-linguagem |
| Análise de arquivos locais | lê diretório de trabalho |
| Busca web (Google Search) | integrada nativamente |
| Geração de imagens | via Imagen |
| Execução de código | sandbox Python |
| Contexto de 1M tokens | arquivos grandes / vaults completos |
| Integração Google Workspace | Drive, Docs, Sheets, Gmail |

**Comandos principais:**
```bash
gemini                         # iniciar sessão interativa
gemini -p "prompt"             # prompt direto
gemini --model gemini-2.5-pro  # modelo específico
```

### Codex CLI (OpenAI)

**Arquivo lido:** `AGENTS.md` (na raiz do vault)

| Capacidade | Notas |
|---|---|
| Geração e edição de código | executa comandos shell |
| Execução de código | sandbox local seguro |
| Modo full-auto | executa tarefas sem confirmação |
| Modo suggest | apenas sugere, não executa |
| Suporte a GPT-4o / o3 | troca de modelo via flag |

**Comandos principais:**
```bash
codex                          # iniciar sessão interativa
codex "faça X"                 # tarefa direta
codex --approval-mode full-auto # sem confirmação
codex --model o3               # trocar modelo
```

### Cursor

**Arquivo lido:** `AGENTS.md` ou `.cursor/rules` (`.cursorrules` legado)

| Capacidade | Notas |
|---|---|
| IDE completo com IA | baseado no VS Code |
| Chat com codebase | indexa todo o projeto |
| Edit em linha | Cmd+K / Ctrl+K |
| Composer | editar múltiplos arquivos |
| Agent mode | executa sequência de ações |
| @ mentions | `@arquivo`, `@docs`, `@web` |
| `.cursorrules` | instrução específica por projeto |

### Windsurf (Codeium)

**Arquivo lido:** `AGENTS.md` ou `.windsurf/rules`

| Capacidade | Notas |
|---|---|
| IDE baseado em VS Code | |
| Cascade (agente) | raciocínio multi-step |
| Flows | automatizar fluxos de trabalho |
| Codebase indexing | busca semântica |

### Compatibilidade de arquivos por IA

| Arquivo | Claude Code | Gemini CLI | Codex CLI | Cursor | Windsurf |
|---|---|---|---|---|---|
| `CLAUDE.md` | ✅ principal | ❌ | ❌ | via AGENTS | via AGENTS |
| `AGENTS.md` | ✅ (lê) | ❌ | ✅ principal | ✅ | ✅ |
| `GEMINI.md` | ❌ | ✅ principal | ❌ | ❌ | ❌ |
| `.cursorrules` | ❌ | ❌ | ❌ | ✅ legado | ❌ |
| `AI-INSTRUCTIONS.md` | via redirect | via redirect | via redirect | via redirect | via redirect |

---

## 15. Estrutura dos Arquivos .md do Vault

### Frontmatter Schema v2 (obrigatório em notas novas)

```yaml
---
data: YYYY-MM-DD           # data de criação
tipo: recurso | projeto | moc | área | referencia | sistema
dominio: dev | direito | comercial | pessoal | geral
tipo_nota: conceito | procedimento | caso | recurso | projeto | moc | sistema
nivel: básico | intermediário | avançado
status_nota: ativo | referência | arquivo
área: direito | trabalho | programação | ideias | pessoal  # legado
projeto: nome-do-projeto   # se aplicável
tags: []
---
```

**Regras de campos:**
- `dominio` → filtro principal quando IA carrega contexto
- `tipo_nota: conceito` → o que algo é; `procedimento` → como fazer; `caso` → exemplo real
- `nivel: avançado` → carregado com prioridade em sessões especializadas
- `status_nota: ativo` → carregado por padrão; `referência` → só quando buscado; `arquivo` → ignorado

### Nomenclatura de arquivos

```
kebab-case sem acentos e sem espaços
Correto:   introducao-ao-direito-civil.md
Correto:   feature-vault-reader.md
Errado:    Introdução ao Direito Civil.md
Errado:    feature vault reader.md
```

### Templates disponíveis (`12_Modelos/`)

| Template | Uso | Campos chave |
|---|---|---|
| `template-projeto.md` | projeto genérico | objetivo, tarefas, notas |
| `template-projeto-sdd.md` | projeto com spec SDD | visão, critério sucesso, fora do escopo |
| `template-projeto-ia.md` | projeto de IA | stack, agentes, métricas |
| `template-adr.md` | decisão técnica | contexto, decisão, consequências |
| `template-estudo.md` | material de estudo | conceitos, exercícios, referências |
| `template-ideia.md` | captura de ideia | problema, solução, próximo passo |
| `template-recurso.md` | link/ferramenta/referência | URL, por que relevante, uso |
| `template-daily.md` | daily note | data, prioridades, log |
| `template-lead.md` | lead genérico | contato, empresa, status, próximos passos |
| `template-lead-kermartin.md` | lead WH Technology | campos específicos Kermartin |
| `template-contato.md` | pessoa/entidade | cargo, empresa, histórico |
| `template-habito.md` | hábito/rotina | frequência, meta, log |
| `template-revisao-semanal.md` | revisão semanal | conquistas, pendências, foco próxima semana |
| `template-revisao-mensal.md` | revisão mensal | métricas, retrospectiva, metas |
| `template-session-summary.md` | log de sessão IA | o que foi feito, decisões, pendências |

### Estrutura de nota de projeto (`04_Projects/[nome]/`)

```
04_Projects/nome-do-projeto/
├── CLAUDE.md          ← obrigatório: stack, convenções, o que NÃO fazer
├── specs/             ← specs de features (feature-[nome].md)
├── decisions/         ← ADRs do projeto (ADR-001-*.md)
└── [outras notas]
```

### Wikilinks

```markdown
[[Nome da Nota]]                    # link básico
[[Nome da Nota|Texto exibido]]      # link com alias
[[pasta/Nome da Nota]]              # link com caminho (evitar — usar só nome)
```

### Estrutura de pasta do vault

| Pasta | Tipo de conteúdo | Quando usar |
|---|---|---|
| `00_Inbox` | captura crua, não processada | chegou sem classificação |
| `02_Knowledge` | conhecimento consolidado permanente | aprendizado validado |
| `03_Entities` | pessoas, empresas, ferramentas | entidade recorrente |
| `04_Projects` | projetos ativos | trabalho em andamento |
| `05_Research` | pesquisas exploratórias | ainda não consolidado |
| `07_Decisions` | decisões com rastreabilidade | ADRs, escolhas importantes |
| `10_Learning` | estudos em progresso | curso, livro, skill |
| `12_Modelos` | templates reutilizáveis | nunca editar diretamente |
| `14_Indexes` | MOCs e mapas de navegação | índices (MAPA.md, IDX-*) |
| `15_Arquivo` | histórico e itens concluídos | nunca deletar — arquivar aqui |
| `99_System` | regras, sistema, instruções de IA | só editar com intenção clara |

---

## Relacionado

- [[99_System/COMANDOS-PADRAO]] — comandos de ferramentas locais (Figma bridge)
- [[99_System/SETUP]] — instalação em novo computador
- [[99_System/AI-INSTRUCTIONS]] — regras de comportamento da IA
- [[99_System/CLAUDE]] — contexto completo do vault
- [[14_Indexes/MAPA]] — índice central de navegação
