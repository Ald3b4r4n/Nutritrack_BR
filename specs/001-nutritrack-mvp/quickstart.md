# Quickstart: NutriTrack BR MVP

## Pré-requisitos
- Flutter SDK (stable >= 3.0.0) instalado em `C:\flutter`
- Android SDK instalado em `D:\Android_SDK`
- Java JDK 17 instalado em `D:\Android_SDK\jdk17`
- Ambiente de desenvolvimento configurado (Android Studio ou VS Code)
- Emulador Android ou dispositivo físico para testes e builds
- Recomendado: Skill `devcontainer-setup` (Antigravity) instalada.

> [!NOTE]
> **Ambiente Validado**: O Flutter, o Android SDK e o JDK 17 foram configurados corretamente nos caminhos acima. As variáveis de ambiente `ANDROID_HOME` e `JAVA_HOME` estão apontando para o disco `D:`.
## Comandos de Instalação
```bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```
*(Nota: O build_runner é crucial para gerar os DAOs do Drift, os providers do Riverpod e os mocks para testes).*

## Comandos de Análise e Qualidade (Lint)
```bash
dart format . --set-exit-if-changed
flutter analyze
```

## Comandos de Teste
```bash
# Rodar todos os testes unitários e de widget
flutter test

# Testar com cobertura (recomendado)
flutter test --coverage

# Rodar testes de integração (requer emulador/device ativo)
flutter test integration_test/
```

## Geração do APK de Teste (OBRIGATÓRIO)
Após a conclusão de cada funcionalidade relevante, e desde que o `flutter analyze` e `flutter test` passem sem erros, deve-se gerar o APK para validação manual.

```bash
flutter build apk --debug
# ou, se aplicável ao final da release
flutter build apk --release
```

**Localização esperada do APK gerado**:
- Debug: `build/app/outputs/flutter-apk/app-debug.apk`
- Release: `build/app/outputs/flutter-apk/app-release.apk`

*Aviso: O agente deve reportar falhas de build de imediato, e indicar o caminho do APK validado no resumo da sua task final.*

## Fluxo Básico de Desenvolvimento com TDD
1. **Red**: Escreva o teste (unitário, widget ou integration) descrevendo o comportamento esperado para a camada selecionada. Rode o teste. Ele deve falhar.
2. **Green**: Implemente o código mínimo necessário no Flutter para o teste passar.
3. **Refactor**: Otimize o código recém-escrito (isolamento, Clean Architecture, renomear variáveis), garantindo que os testes continuem verdes.
4. Nenhuma feature é dada como concluída até estar coberta por testes no MVP.

## Observações de Ambiente
- **Offline-first**: Nenhuma API HTTP será conectada na fase MVP (exceto se mockada ou puramente conceitual). O banco `drift` SQLite armazena tudo.
- **Assets e Imagens**: Quaisquer imagens (Nano Banana) devem ser armazenadas em `assets/images/` e referenciadas em `pubspec.yaml`.
- **Privacidade e Logs**: Em produção, logs devem omitir informações sobre peso ou hábitos alimentares. Em debug, utilize libraries apropriadas em vez de `print()`.
