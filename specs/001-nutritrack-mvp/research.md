# Research & Decisions: NutriTrack BR MVP

## 1. Riverpod vs Bloc
- **Decisão**: `flutter_riverpod` (Riverpod)
- **Motivo**: O Riverpod moderno (com annotations / Riverpod Generator) elimina boilerplate excessivo, sendo altamente testável por natureza (ProviderScope sobrescreve providers no test sem necessidade de injeção complexa). Ele se integra muito bem à Clean Architecture (providers podem expor UseCases).
- **Alternativas rejeitadas**: BLoC requer muito boilerplate de eventos e states, o que para um app focado no MVP pode atrasar a entrega. O Riverpod atende com a mesma segurança de tipos.

## 2. Persistência Offline: Drift/SQLite vs Outros
- **Decisão**: `drift` (SQLite)
- **Motivo**: O app tem dependência forte de relacionamentos entre tabelas (Ex: MealRecord ↔ FoodItem, BarcodeEntity ↔ FoodItem) e buscas complexas (Full Text Search para encontrar alimentos rapidamente em uma base grande como TBCA/USDA). O Drift suporta streams de dados para rebuild automático da UI e gerencia relacionamentos e migrações tipadas.
- **Alternativas rejeitadas**:
  - Isar: Excelente performance, mas é um banco NoSQL com relacionamentos diferentes do SQL.
  - Hive: Pode ser complexo para queries textuais avançadas e agregações matemáticas.

## 3. Biblioteca de Código de Barras
- **Decisão**: `mobile_scanner`
- **Motivo**: Baseada no Google ML Kit, é rápida e amplamente utilizada.
- **Estratégia de teste/mocks**: O serviço de leitura será injetado e mockado nos testes. Em testes de Widget, um retorno com uma String EAN13 válida será simulada.

## 4. Estratégia TBCA / USDA / Base Proprietária
- **Decisão**: Haverá um Enum `FoodSource`. A UI terá filtro de abas por essas fontes. Em caso de alimentos editados pelo usuário, ele passa a ser cadastrado como `FoodSource.custom`, não sobrescrevendo o registro base importado. A base seed pode ser embarcada num arquivo SQLite pre-populado copiado na primeira abertura do app.

## 5. UI Premium e Assets (Nano Banana/Gemini Image)
- **Decisão**: Foco em flat design, cores neutras vibrantes, glassmorphism sutil. Os assets gerados via Gemini Image ficarão restritos aos "Empty States" e ícones decorativos, localizados em `assets/images/illustrations/`.

## 6. Skills do Antigravity Awesome Skills
- **Skills planejadas**:
  - `devcontainer-setup`: Para um ambiente de dev reproduzível (útil em times).
  - `context7-auto-research`: Para eventuais dúvidas em atualizações do Riverpod/Drift durante o TDD.
  - O uso dessas skills será registrado ao longo das execuções em `tasks.md`.

## 7. Geração de APK
- **Decisão**: Foi criado o requisito no `quickstart.md` estipulando um comando em cadeia (`flutter analyze && flutter test && flutter build apk --debug`) que deverá ser executado pelo agente na última task de cada implementação para validar a entrega funcional.

## 8. Segurança e Privacidade
- **Decisão**: Dados armazenados unicamente no SQLite do próprio celular do usuário. Não haverá telemetria com payload de dados sensíveis, garantindo privacidade by-design no MVP.

## 9. CI/CD Local
- O app requer análise estática (`flutter analyze`) antes dos commits. Scripts pre-push (ou orientação pro agente rodá-los) asseguram a qualidade exigida.
