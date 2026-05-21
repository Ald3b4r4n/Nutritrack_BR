# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0-mvp] - 2026-05-21

### Added
- **Diário Alimentar**: Funcionalidade central de registros por refeição (offline-first).
- **Busca de Alimentos e Código de Barras**: Scanner embutido e pesquisa por fontes TBCA, USDA e customizadas.
- **Água e Peso**: Módulos simplificados de ingestão de água e evolução de peso não-punitiva.
- **Planos Alimentares**: Criação de metas nutricionais reaproveitáveis.
- **Dashboard**: Consolidado visual do progresso diário (calorias, macros e atalhos de registro).
- **Architecture**: Implementação usando Riverpod (State) e Drift (SQLite).
- **Quality**: 125 testes implementados com sucesso (TDD base), `flutter analyze` validado.
- **Builds**: APKs de Debug e Release gerados e aprovados.

### Contexto
* O projeto atinge o estado de Minimum Viable Product (MVP) conforme definido no [NutriTrack BR Constitution](.specify/memory/constitution.md) e [Spec v1.0.0](specs/001-nutritrack-mvp/spec.md).
