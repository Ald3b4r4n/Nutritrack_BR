# Implementation Plan: NutriTrack BR MVP

**Branch**: `001-nutritrack-mvp` | **Date**: 2026-05-01 | **Spec**: [spec.md](spec.md)
**Input**: Feature specification from `/specs/001-nutritrack-mvp/spec.md`

## Summary

O MVP construirá um app mobile Flutter com arquitetura limpa e funcionamento 100% offline-first. Ele incluirá o diário alimentar (com cálculo de macros), controle de água, peso, leitura de código de barras e pesquisa de alimentos textualmente em bases nutricionais locais (TBCA, USDA e customizadas).

## Technical Context

**Language/Version**: Dart (SDK >= 3.0.0, null safety)  
**Primary Dependencies**: Flutter (Stable, Material 3), flutter_riverpod, drift (SQLite), mobile_scanner, dartz, go_router.  
**Storage**: Drift (SQLite)  
**Testing**: flutter_test, integration_test, mocktail  
**Target Platform**: Android e iOS (foco inicial Android via APK)
**Project Type**: mobile-app  
**Performance Goals**: App responsivo, retornos de consultas de alimentos locais em < 300ms, sem travamento de UI.  
**Constraints**: 100% offline-first, ausência de conexão direta com banco remoto, dados privados no aparelho.  
**Scale/Scope**: MVP focado em uso individual, com meta de escalabilidade futura com sincronização.

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- **I. Spec-Driven**: PASS - Seguindo rigorosamente o fluxo do Spec Kit.
- **II. TDD obrigatório**: PASS - Ciclo Red-Green-Refactor detalhado no quickstart.
- **III. Arquitetura Limpa**: PASS - Estrutura em domain, data, application, presentation.
- **IV. Offline-first**: PASS - Drift/SQLite como fonte primária e única de dados no MVP.
- **V. Privacidade**: PASS - Nenhum dado enviado externamente.
- **VI. Bases rastreáveis**: PASS - Enum e entidades de metadados para Fonte.
- **VII. Experiência premium**: PASS - Theme definido com design system próprio.
- **VIII. Acessibilidade**: PASS - Semantics aplicados nas UI.
- **IX. Performance**: PASS - Uso de `lazy loading` e índices no SQLite.
- **X. Uso obrigatório de skills**: PASS - Skills como `devcontainer-setup` e documentações do Antigravity serão acionadas.
- **XI. Uso responsável de Nano Banana**: PASS - Diretório `assets/images` com padronização.
- **XII. APK de teste**: PASS - Scripts de build e comandos de testes validados.
- **XIII. CI e qualidade contínua**: PASS - Uso de `flutter analyze` obrigatório antes de build.
- **XIV. Documentação obrigatória**: PASS - `quickstart.md` gerado.
- **XV. Controle de escopo**: PASS - Funcionalidades atreladas estritamente ao MVP.
- **XVI. Segurança alimentar**: PASS - Linguagem descritiva e não normativa.
- **XVII. Governança**: PASS - Tudo atrelado às metas e tasks futuras.

## Project Structure

### Documentation (this feature)

```text
specs/001-nutritrack-mvp/
├── plan.md              # This file
├── research.md          # Output
├── data-model.md        # Output
├── quickstart.md        # Output
└── contracts/           # Output
    └── future_sync.md
```

### Source Code (repository root)

```text
lib/
├── core/               # Theme, constants, utils, errors, DI setup
├── domain/             # Entities, repositories interfaces, failure definitions
├── data/               # Models, repositories implementations, local DB (Drift)
├── application/        # Usecases, state providers (Riverpod), application logic
└── presentation/       # UI, Widgets, Controllers
    ├── diário/
    ├── pesquisa/
    ├── agua/
    ├── peso/
    └── planos/

test/
├── unit/
│   ├── domain/
│   ├── application/
│   └── data/
├── widget/
│   └── presentation/
└── integration/
```

**Structure Decision**: Clean Architecture clássica adaptada para Riverpod. 
- **domain**: Entidades Dart puras, Value Objects e interfaces de repositórios. Isolamento total do Flutter.
- **data**: Modelos DAO do Drift, mapeadores para o domain e implementação de repositórios.
- **application**: Casos de uso orquestrando entidades, gerenciando estado via Riverpod, agnósticos da tela.
- **presentation**: Telas e Widgets Flutter ouvindo o estado via `ref.watch()`. Nenhuma lógica de negócio ou query ao banco residirá aqui.
