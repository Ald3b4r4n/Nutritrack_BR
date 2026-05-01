# Tasks: NutriTrack BR MVP

**Input**: Design documents from `/specs/001-nutritrack-mvp/`
**Prerequisites**: plan.md, spec.md, research.md, data-model.md, quickstart.md, contracts/future_sync.md

---

## Fase 0 — Preparação do ambiente e validação do projeto Flutter

- [x] **T001** Validar ambiente Flutter
  - **Tipo**: Validação
  - **Arquivos-alvo**: N/A
  - **Dependências**: Nenhuma
  - **Critério de aceite**: Retornar sem erros críticos no doctor.
  - **Comando**: `flutter doctor`
- [x] **T002** Consultar e documentar Antigravity Awesome Skills
  - **Tipo**: Documentação
  - **Arquivos-alvo**: `docs/antigravity-skills.md`
  - **Dependências**: T001
  - **Critério de aceite**: Documento criado justificando o uso de skills como `devcontainer-setup`, `context7-auto-research` e garantindo ausência de conflitos com a Constitution.
- [x] **T003** Instalar dependências base
  - **Tipo**: Configuração
  - **Arquivos-alvo**: `pubspec.yaml`
  - **Dependências**: T002
  - **Critério de aceite**: Dependências do Flutter (riverpod, drift, mobile_scanner, dartz, go_router, mocktail) instaladas sem conflitos de versão.
  - **Comando**: `flutter pub get`
- [x] **T004** Configurar Lint e Analyze
  - **Tipo**: Configuração
  - **Arquivos-alvo**: `analysis_options.yaml`
  - **Dependências**: T003
  - **Critério de aceite**: Regras de linting rigorosas configuradas.
  - **Comando**: `flutter analyze`

---

## Fase 1 — Fundação arquitetural e qualidade

- [x] **T005** [P] Configurar estrutura de pastas Clean Architecture
  - **Tipo**: Configuração
  - **Arquivos-alvo**: `lib/core/`, `lib/domain/`, `lib/application/`, `lib/data/`, `lib/presentation/`
  - **Dependências**: T004
  - **Critério de aceite**: Esqueleto de pastas criado refletindo o `plan.md`.
- [x] **T006** Configurar Core e Tratamento de Erros
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/core/error/failures.dart`
  - **Dependências**: T005
  - **Critério de aceite**: Classes base de `Failure` e `Exception` criadas.
- [x] **T007** Configurar setup inicial do Riverpod
  - **Tipo**: Configuração
  - **Arquivos-alvo**: `lib/main.dart`
  - **Dependências**: T006
  - **Critério de aceite**: `ProviderScope` envelopando a raiz do app.
- [x] **T008** Configurar rotas com GoRouter
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/core/routes/app_router.dart`
  - **Dependências**: T007
  - **Critério de aceite**: Rota inicial mapeada com sucesso.

---

## Fase 2 — Design system, tema e assets base

- [x] **T009** Criar documentação de Assets e Identidade Visual (Nano Banana)
  - **Tipo**: Documentação
  - **Arquivos-alvo**: `docs/assets-prompts.md`
  - **Dependências**: T004
  - **Critério de aceite**: Documento define prompts iniciais de ícone, backgrounds e empty states (exigência de identidade própria sem copiar concorrentes).
- [x] **T010** Implementar Theme Material 3 (Claro e Escuro)
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/core/theme/app_theme.dart`
  - **Dependências**: T005
  - **Critério de aceite**: Tokens de cor, tipografia e radius configurados com suporte a dark mode.
- [x] **T011** Implementar Componentes Base de UI
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/presentation/widgets/`
  - **Dependências**: T010
  - **Critério de aceite**: Card de refeição base, botão primário, empty state ilustrativo criados.
- [ ] **T012** Configurar i18n inicial (PT-BR)
  - **Tipo**: Configuração
  - **Arquivos-alvo**: `lib/main.dart`, `l10n/`
  - **Dependências**: T011
  - **Critério de aceite**: Localizations delegate configurado para pt_BR.

---

## Fase 3 — Banco local Drift/SQLite e modelos de domínio

- [ ] **T013** Criar Value Objects de Domínio
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/domain/value_objects/`
  - **Dependências**: T005
  - **Critério de aceite**: VO de macros, porção e data criados (sem depender de Drift).
- [ ] **T014** Criar Entidades de Domínio
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/domain/entities/`
  - **Dependências**: T013
  - **Critério de aceite**: Todas as 16 entidades listadas em `data-model.md` criadas.
- [ ] **T015** [OBRIGATÓRIO] Testes do Banco Local Drift
  - **Tipo**: Teste
  - **Arquivos-alvo**: `test/data/database/app_database_test.dart`
  - **Dependências**: T014
  - **Critério de aceite**: Inserção e recuperação de `FoodItem` testadas em memória. (Red)
  - **Comando**: `flutter test`
- [ ] **T016** Implementar Banco Drift, Tabelas e DAOs
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/data/database/`, `lib/data/daos/`
  - **Dependências**: T015
  - **Critério de aceite**: Schema criado com `drift`, DAOs funcionais passando nos testes de T015. (Green/Refactor)
  - **Comando**: `dart run build_runner build`
- [ ] **T017** Implementar Mappers Domínio ↔ Drift
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/data/mappers/`
  - **Dependências**: T016
  - **Critério de aceite**: Conversão isolada de dados garantida.

---

## Fase 4 — Diário alimentar

- [ ] **T018** [OBRIGATÓRIO] Teste de Usecase: Adicionar/Editar Alimento na Refeição
  - **Tipo**: Teste
  - **Arquivos-alvo**: `test/application/usecases/meal_diary_usecases_test.dart`
  - **Dependências**: T017
  - **Critério de aceite**: Teste garantindo cálculo correto de macros ao adicionar alimento. (Red)
- [ ] **T019** Implementar MealRepository e Usecases do Diário
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/data/repositories/`, `lib/application/usecases/diary/`
  - **Dependências**: T018
  - **Critério de aceite**: Usecases passando nos testes. (Green)
- [ ] **T020** Implementar State Provider do Diário (Riverpod)
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/application/providers/diary_provider.dart`
  - **Dependências**: T019
  - **Critério de aceite**: Provider reativo retornando estado das refeições do dia.
- [ ] **T021** [OBRIGATÓRIO] Widget Test: Tela do Diário
  - **Tipo**: Teste
  - **Arquivos-alvo**: `test/widget/presentation/diary/diary_screen_test.dart`
  - **Dependências**: T020
  - **Critério de aceite**: Validar presença de Cafe, Almoco, Jantar, Lanches e botão "Adicionar". (Red)
- [ ] **T022** Implementar Tela e Widgets do Diário Alimentar
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/presentation/diary/`
  - **Dependências**: T021
  - **Critério de aceite**: Tela exibe refeições e macros diários; testes visuais passando. (Green)
- [ ] **T023** Build APK de Validação (Diário)
  - **Tipo**: Build
  - **Arquivos-alvo**: `build/app/outputs/flutter-apk/app-debug.apk`
  - **Dependências**: T022
  - **Critério de aceite**: APK compilado com sucesso demonstrando o diário.
  - **Comando**: `flutter analyze && flutter test && flutter build apk --debug`

---

## Fase 5 — Busca/cadastro de alimentos e fontes nutricionais

- [ ] **T024** [OBRIGATÓRIO] Teste de Usecase: Buscar e Filtrar Alimentos (TBCA/USDA/Proprietário)
  - **Tipo**: Teste
  - **Arquivos-alvo**: `test/application/usecases/food_search_usecases_test.dart`
  - **Dependências**: T017
  - **Critério de aceite**: Busca retorna mock filtrado por origem e nome. (Red)
- [ ] **T025** [OBRIGATÓRIO] Teste de Usecase: Cadastrar Alimento Customizado
  - **Tipo**: Teste
  - **Arquivos-alvo**: `test/application/usecases/food_create_usecase_test.dart`
  - **Dependências**: T017
  - **Critério de aceite**: Garantir salvamento de FoodSource.custom e macros corretos. (Red)
- [ ] **T026** Implementar Repositório e Usecases de Alimentos
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/data/repositories/`, `lib/application/usecases/food/`
  - **Dependências**: T024, T025
  - **Critério de aceite**: Usecases aprovados nos testes, usando SQLite (FTS se necessário). (Green)
- [ ] **T027** Implementar Seed/Importador Conceitual Inicial
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/data/database/seeds.dart`
  - **Dependências**: T026
  - **Critério de aceite**: Mock script que popula alimentos do USDA/TBCA localmente ao iniciar.
- [ ] **T028** [OBRIGATÓRIO] Widget Test: Tela de Busca e Cadastro
  - **Tipo**: Teste
  - **Arquivos-alvo**: `test/widget/presentation/search/food_search_screen_test.dart`
  - **Dependências**: T027
  - **Critério de aceite**: Campo de busca e formulário de cadastro testados. (Red)
- [ ] **T029** Implementar Tela de Busca e Cadastro de Alimentos
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/presentation/search/`
  - **Dependências**: T028
  - **Critério de aceite**: Interface renderiza lista, badges de fonte e botão "Criar novo". Fluxo atrelado ao Diário Alimentar (T022). (Green)
- [ ] **T030** Build APK de Validação (Busca/Cadastro)
  - **Tipo**: Build
  - **Arquivos-alvo**: `build/app/outputs/flutter-apk/app-debug.apk`
  - **Dependências**: T029
  - **Critério de aceite**: APK validando busca.

---

## Fase 6 — Código de barras

- [ ] **T031** [OBRIGATÓRIO] Teste de Integração: Scanner Mockado
  - **Tipo**: Teste
  - **Arquivos-alvo**: `test/application/services/barcode_scanner_test.dart`
  - **Dependências**: T029
  - **Critério de aceite**: Testar sucesso (retorna código) e falha (permissão ou erro). (Red)
- [ ] **T032** Implementar Adapter de mobile_scanner
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/infrastructure/scanner/mobile_scanner_adapter.dart`
  - **Dependências**: T031
  - **Critério de aceite**: Encapsulamento da lib externa. Testes passam com mock. (Green)
- [ ] **T033** Implementar Lógica de Vínculo de Barcode (Usecase)
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/application/usecases/food/link_barcode_usecase.dart`
  - **Dependências**: T032
  - **Critério de aceite**: Usecase vincula código EAN a um alimento do banco local.
- [ ] **T034** Implementar Tela de Câmera/Leitura
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/presentation/scanner/`
  - **Dependências**: T033
  - **Critério de aceite**: Tela com overlay de scanner e tratamento de permissões. Fluxo para cadastro rápido caso não ache o código na base.
- [ ] **T035** Build APK de Validação (Scanner)
  - **Tipo**: Build
  - **Arquivos-alvo**: `build/app/outputs/flutter-apk/app-debug.apk`
  - **Dependências**: T034
  - **Critério de aceite**: APK gerado com permissões de câmera injetadas no manifesto.

---

## Fase 7 — Água

- [ ] **T036** [OBRIGATÓRIO] Teste de Usecase: Registro e Meta de Água
  - **Tipo**: Teste
  - **Arquivos-alvo**: `test/application/usecases/water_usecases_test.dart`
  - **Dependências**: T017
  - **Critério de aceite**: Testar soma de registros diários (ex: 200ml + 300ml) contra a meta. (Red)
- [ ] **T037** Implementar Usecases e Repositório de Água
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/data/repositories/`, `lib/application/usecases/water/`
  - **Dependências**: T036
  - **Critério de aceite**: Integração testada com Drift. (Green)
- [ ] **T038** Implementar Tela/Widget de Água
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/presentation/water/`
  - **Dependências**: T037
  - **Critério de aceite**: UI com botões rápidos (+200, +300, custom) e barra de progresso responsiva.

---

## Fase 8 — Peso e evolução

- [ ] **T039** [OBRIGATÓRIO] Teste de Usecase: Histórico de Peso
  - **Tipo**: Teste
  - **Arquivos-alvo**: `test/application/usecases/weight_usecases_test.dart`
  - **Dependências**: T017
  - **Critério de aceite**: Testar listagem ordenada e cálculo de tendência não-punitiva. (Red)
- [ ] **T040** Implementar Usecases e Repositório de Peso
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/application/usecases/weight/`
  - **Dependências**: T039
  - **Critério de aceite**: Dados inseridos no SQLite com sucesso. (Green)
- [ ] **T041** Implementar Tela de Peso e Gráfico
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/presentation/weight/`
  - **Dependências**: T040
  - **Critério de aceite**: Apresentar gráfico simples de tendência temporal. Textos informativos de IMC formatados corretamente.
- [ ] **T042** Build APK de Validação (Água e Peso)
  - **Tipo**: Build
  - **Arquivos-alvo**: `build/app/outputs/flutter-apk/app-debug.apk`
  - **Dependências**: T038, T041
  - **Critério de aceite**: APK contemplando os módulos de acompanhamento.

---

## Fase 9 — Planos alimentares simples

- [ ] **T043** [OBRIGATÓRIO] Teste de Usecase: Criação de Plano e Metas
  - **Tipo**: Teste
  - **Arquivos-alvo**: `test/application/usecases/meal_plan_test.dart`
  - **Dependências**: T017
  - **Critério de aceite**: Testar gravação de templates por refeição e aplicação a dia da semana. (Red)
- [ ] **T044** Implementar Usecases de Planos Alimentares
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/application/usecases/plan/`
  - **Dependências**: T043
  - **Critério de aceite**: Regras de negócio de aderência e ativação de templates funcionais. (Green)
- [ ] **T045** Implementar Telas de Planos
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/presentation/plans/`
  - **Dependências**: T044
  - **Critério de aceite**: UI para criar templates e ativá-los no calendário.

---

## Fase 10 — Dashboard

- [ ] **T046** [OBRIGATÓRIO] Teste Integrado: Agregação do Dashboard Diário
  - **Tipo**: Teste
  - **Arquivos-alvo**: `test/application/providers/dashboard_provider_test.dart`
  - **Dependências**: T020, T037, T040, T044
  - **Critério de aceite**: Verificar junção dos streams de calorias, água e peso num único state. (Red)
- [ ] **T047** Implementar Dashboard Provider (Riverpod)
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/application/providers/dashboard_provider.dart`
  - **Dependências**: T046
  - **Critério de aceite**: Provider retorna objeto de resumo do dia de forma eficiente. (Green)
- [ ] **T048** Implementar Tela Inicial (Dashboard)
  - **Tipo**: Implementação
  - **Arquivos-alvo**: `lib/presentation/dashboard/dashboard_screen.dart`
  - **Dependências**: T047
  - **Critério de aceite**: Renderização de anéis de progresso, atalhos rápidos e resumo consolidado, utilizando assets ilustrativos gerados.
- [ ] **T049** Build APK de Validação (Dashboard e Planos)
  - **Tipo**: Build
  - **Arquivos-alvo**: `build/app/outputs/flutter-apk/app-debug.apk`
  - **Dependências**: T045, T048
  - **Critério de aceite**: APK do core product completo.

---

## Fase 11 — Acessibilidade, performance e privacidade

- [ ] **T050** Auditoria de Acessibilidade (Labels e Contraste)
  - **Tipo**: Refatoração
  - **Arquivos-alvo**: `lib/presentation/`
  - **Dependências**: T048
  - **Critério de aceite**: Adição de `Semantics()` em áreas cruciais. Ferramentas de análise do Flutter não reportam quebra de contraste.
- [ ] **T051** Remoção de Logs Sensíveis e Otimização
  - **Tipo**: Refatoração
  - **Arquivos-alvo**: `lib/core/`
  - **Dependências**: T050
  - **Critério de aceite**: Em produção, logs de peso, dados alimentares e refeições não são gravados (revisar logger). Queries pesadas garantidas como assíncronas em Isolates se aplicável.

---

## Fase 12 — APK de validação, documentação final e checklist

- [ ] **T052** Geração do APK de Release Final
  - **Tipo**: Build
  - **Arquivos-alvo**: `build/app/outputs/flutter-apk/app-release.apk`
  - **Dependências**: T051
  - **Critério de aceite**: Todos os testes automáticos (unitários, widget e integrations) executados com sucesso `flutter test` e build realizado.
  - **Comando**: `flutter analyze && flutter test && flutter build apk --release`
- [ ] **T053** Preencher Resumo de Execução do Agente
  - **Tipo**: Documentação
  - **Arquivos-alvo**: N/A (Console/Artifacts)
  - **Dependências**: T052
  - **Critério de aceite**: Registrar caminho do APK gerado, bugs contornados, dependências e checklist de validação manual para o humano seguir.

---

## Sugestão de Commits por Fase

- `build: prepare initial flutter environment and quality gates`
- `feat: implement core clean architecture and providers`
- `style: apply material 3 theme and design system tokens`
- `feat(data): setup drift local database and domain entities`
- `feat(diary): implement food diary with macro calculations and offline storage`
- `feat(search): add local tbca/usda food search and custom creation`
- `feat(scanner): implement mobile barcode scanner with local mapping`
- `feat(water): add daily water intake tracking and UI`
- `feat(weight): add weight logging and safe evolution chart`
- `feat(plans): add meal planning templates`
- `feat(dashboard): integrate daily aggregation on main dashboard screen`
- `perf: audit accessibility and sanitize sensitive logs`
- `release: v1.0.0-mvp with final release apk`
