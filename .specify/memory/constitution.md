<!--
Sync Impact Report:
- Version change: N/A -> 1.0.0 (Initial Ratification)
- Modified principles: Added 17 principles specific to NutriTrack BR.
- Added sections: Governance, Core Principles.
- Templates requiring updates: ✅ tasks-template.md (updated to make TDD mandatory)
-->

# NutriTrack BR Constitution

## Core Principles

### I. Spec-Driven Development obrigatório
Todo desenvolvimento deve seguir o fluxo do GitHub Spec Kit. Nenhuma implementação relevante deve ocorrer sem `spec.md`, `plan.md` e `tasks.md` atualizados. Cada mudança deve estar vinculada a uma task rastreável. O agente deve respeitar a ordem: constitution, specify, plan, tasks e implement.

### II. TDD obrigatório
Testes devem ser escritos antes da implementação sempre que tecnicamente possível. O ciclo Red → Green → Refactor deve ser seguido. Nenhuma funcionalidade crítica deve ser considerada concluída sem testes. Testes unitários, widget tests e integration tests devem fazer parte do fluxo. Correções de bugs devem começar com teste de regressão.

### III. Flutter com arquitetura limpa
O app deve usar Flutter estável, Dart com null safety e boas práticas modernas. A arquitetura deve separar claramente presentation, application/usecases, domain, data e infrastructure. Regras de negócio devem ficar fora da UI. Widgets não devem conter lógica de domínio. Código deve ter nomes claros, funções pequenas e responsabilidades bem definidas.

### IV. Offline-first e persistência segura
O app deve funcionar sem internet para diário alimentar, água, peso, alimentos recentes e planos salvos. A persistência local deve usar SQLite/Drift ou alternativa equivalente justificada no `plan.md`. SQL Server ou banco similar só deve ser usado via backend/API, nunca com conexão direta do app mobile ao banco. Dados locais devem ser estruturados para futura sincronização.

### V. Privacidade e dados sensíveis
Dados de alimentação, peso, hábitos e metas devem ser tratados como dados sensíveis. O projeto deve evitar coleta desnecessária. Deve existir preocupação com exportação, exclusão e proteção dos dados do usuário. Logs não devem expor dados pessoais, peso, refeições ou histórico alimentar. Qualquer sincronização futura deve respeitar segurança, autenticação e autorização.

### VI. Bases nutricionais rastreáveis
Todo alimento deve indicar sua fonte nutricional: TBCA, USDA, base proprietária ou cadastro do usuário. O app deve preservar metadados de fonte, data de importação, versão e confiabilidade quando disponíveis. A base proprietária deve permitir cadastro e edição controlada. Conflitos entre fontes devem ser resolvidos de forma explícita e documentada.

### VII. Experiência mobile premium
A interface deve ser moderna, fluida, clara e acessível. A tela de diário alimentar deve organizar refeições como Café da Manhã, Almoço, Jantar e Lanches/Outros, com botão evidente para adicionar item. O app deve ter tema claro e escuro. Deve haver feedback visual para ações importantes. Estados vazios, erros e carregamentos devem ter tratamento visual adequado. O app deve ser utilizável por pessoas não técnicas.

### VIII. Acessibilidade
O app deve respeitar contraste adequado, labels semânticos, tamanho mínimo de toque e fontes legíveis. Toda tela importante deve ser testada ou revisada quanto à acessibilidade. Ícones importantes não podem ser o único meio de transmitir informação. O app deve evitar linguagem punitiva, humilhante ou que incentive comportamento alimentar extremo.

### IX. Performance e consumo eficiente
O app deve ser fluido em aparelhos intermediários. Busca de alimentos deve usar índices locais adequados. Listas grandes devem usar paginação, lazy loading ou estratégias equivalentes. Imagens geradas devem ser otimizadas para mobile. O app não deve carregar assets pesados desnecessariamente.

### X. Uso obrigatório de skills do Antigravity Awesome Skills
O projeto deve consultar o catálogo [antigravity-awesome-skills](https://github.com/sickn33/antigravity-awesome-skills/blob/main/CATALOG.md). Devem ser instaladas e usadas skills que agreguem ao projeto. O uso das skills deve ser documentado em arquivo próprio, explicando quais foram usadas e por quê. Sempre que uma skill for usada, o agente deve registrar impacto, arquivos afetados e decisões tomadas.

### XI. Uso responsável de Nano Banana/Gemini Image
Nano Banana/Gemini Image deve ser usado para criar ícones, backgrounds, ilustrações de telas vazias, banners e assets visuais, garantindo identidade própria. É proibido copiar layout proprietário ou identidade visual do FatSecret ou outros apps. Todo asset deve ser otimizado. Prompts devem ser versionados/documentados.

### XII. APK de teste ao final de cada implementação completa
Ao final de cada implementação funcional concluída (estado compilável), o agente deve gerar um APK de teste para validação manual, somente após testes passarem. O comando de build deve ser documentado e o caminho do APK informado no resumo final. Falhas de build devem ser registradas.

### XIII. CI e qualidade contínua
O projeto deve ter lint, format, análise estática e testes automatizados. O CI deve validar build e testes antes de considerar qualquer fase concluída. Dependências devem ser mantidas no mínimo. Falhas de análise estática exigem justificativa documentada.

### XIV. Documentação obrigatória
O projeto deve manter README.md, quickstart.md, architecture.md ou equivalente. Decisões técnicas devem ser registradas em ADRs ou no plan. Documentação em português do Brasil, clara e objetiva.

### XV. Controle de escopo
O MVP deve priorizar diário alimentar, busca/cadastro de alimentos, água, peso, barcode e planos alimentares básicos. Extensões futuras devem ser controladas. O agente não deve expandir escopo sem registrar impacto e justificativa.

### XVI. Segurança alimentar e linguagem responsável
O app deve apresentar dados como informação de apoio, não diagnóstico médico. Não incentivar restrição extrema. Recomendações devem ser informativas e conservadoras.

### XVII. Governança de implementação
Cada execução termina com resumo de tasks, testes, comandos, arquivos, resultados e APK. O agente deve evitar alterações fora do escopo, planejar grandes refatorações e sugerir commits coerentes.

## Governança e Revisões
As regras definidas nesta constitution são superiores a outras práticas. Alterações exigem documentação, aprovação e atualização nos templates dependentes do Spec Kit (plan, spec, tasks).
Versionamento semântico será adotado:
- MAJOR: Remoção de princípios ou mudanças incompatíveis.
- MINOR: Novos princípios adicionados.
- PATCH: Clarificações e correção de textos.

**Version**: 1.0.0 | **Ratified**: 2026-05-01 | **Last Amended**: 2026-05-01
