# NutriTrack BR 🇧🇷

O NutriTrack BR é um aplicativo de diário alimentar, água, peso e planos nutricionais, desenvolvido em Flutter com uma arquitetura Clean, Riverpod e Drift (SQLite). O foco deste MVP é funcionar de maneira **100% offline-first**, garantindo privacidade, performance e segurança dos dados.

## Funcionalidades Entregues no MVP (v1.0.0)

- **Diário alimentar**: Registro de refeições para o Café da Manhã, Almoço, Jantar e Lanches, com cálculo de macros (Kcal, Carb, Prot, Gord, Fibras, Sódio) em tempo real.
- **Busca/cadastro de alimentos**: Pesquisa textual rápida em bases nutricionais.
- **Fontes de Alimentos**: Suporte integrado para separar alimentos do TBCA, USDA e base customizada/proprietária.
- **Barcode**: Scanner nativo de código de barras para encontrar ou vincular produtos aos dados locais.
- **Água**: Registro simplificado e barra de progresso para hidratação.
- **Peso**: Histórico e evolução de peso sem métricas punitivas.
- **Planos Alimentares**: Criação de templates de metas diárias.
- **Dashboard Central**: Visão consolidada em anéis de progresso do dia atual.
- **Offline-first**: Todo o estado e banco de dados é salvo no aparelho do usuário (SQLite via Drift).

## Status e Qualidade

- **Testes**: 125/125 executados com sucesso (100% de cobertura requerida para casos de uso).
- **Código Limpo**: `flutter analyze` reporta 0 issues (com regras estritas).
- **Builds (APKs)**:
  - Debug: `build/app/outputs/flutter-apk/app-debug.apk`
  - Release: `build/app/outputs/flutter-apk/app-release.apk`

## Começando (Quickstart)

Consulte a especificação e o [Quickstart Oficial](specs/001-nutritrack-mvp/quickstart.md) para instalar e compilar o projeto em sua máquina.

### Ambiente Validado
- Flutter SDK (v3.44.0) instalado em `C:\flutter`
- Android SDK instalado em `D:\Android_SDK`
- Java JDK 17 instalado em `D:\Android_SDK\jdk17`
