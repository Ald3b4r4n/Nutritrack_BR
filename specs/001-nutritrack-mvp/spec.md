# Feature Specification: NutriTrack BR MVP

**Feature Branch**: `001-nutritrack-mvp`  
**Created**: 2026-05-01  
**Status**: Draft  
**Input**: User description: "Crie a especificação inicial do MVP do aplicativo Flutter NutriTrack BR"

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Dashboard e Diário Alimentar Básico (Priority: P1)

Como usuário, quero visualizar um painel inicial resumido e registrar os alimentos que consumi no Café da Manhã, Almoço, Jantar e Lanches, para ter controle da minha ingestão calórica e de macronutrientes do dia.

**Why this priority**: É o coração do aplicativo. Sem o diário alimentar e a visualização dos macros, não há acompanhamento nutricional.

**Independent Test**: Pode ser testado adicionando alimentos mockados às refeições, verificando se o resumo diário (calorias, proteínas, carboidratos, gorduras, fibras, sódio) é atualizado corretamente no dashboard e na tela do diário, inclusive sem conexão à internet.

**Acceptance Scenarios**:
1. **Given** que o usuário está no diário, **When** ele toca em "Adicionar item" no Almoço e seleciona um alimento, **Then** o alimento deve ser vinculado ao almoço e os macros somados ao total do dia.
2. **Given** que o usuário adicionou um alimento errado, **When** ele tenta editar a quantidade ou remover, **Then** as alterações devem refletir no cálculo total imediatamente.
3. **Given** o app offline, **When** o usuário abre o histórico de ontem e adiciona um item, **Then** o dado deve ser salvo e calculado localmente.

---

### User Story 2 - Busca, Cadastro de Alimentos e Código de Barras (Priority: P1)

Como usuário, quero buscar alimentos textualmente ou por código de barras, e poder cadastrar um novo alimento caso não encontre nas bases integradas (TBCA, USDA, etc.), para registrar exatamente o que comi.

**Why this priority**: Complementa o diário. Sem uma base e a opção de cadastro/código de barras, a entrada de dados se torna frustrante.

**Independent Test**: Pode ser testado buscando alimentos textualmente, usando a câmera para escanear um código de barras simulado (retornando "não encontrado") e preenchendo o formulário de cadastro de alimento personalizado.

**Acceptance Scenarios**:
1. **Given** que o usuário está na tela de busca, **When** ele digita o nome de um alimento, **Then** a lista deve exibir os resultados filtrados pelas fontes (TBCA, USDA, proprietária).
2. **Given** um produto embalado, **When** o usuário escaneia o código de barras, **Then** o app deve buscar na base local/proprietária e preencher os dados ou abrir o formulário rápido de criação vinculado àquele código.
3. **Given** a necessidade de adicionar uma receita própria, **When** o usuário cadastra o alimento, **Then** o alimento fica salvo na base local para uso futuro e é listado em seus "alimentos recentes" ao ser consumido.

---

### User Story 3 - Controle de Água (Priority: P2)

Como usuário, quero registrar rapidamente a quantidade de água que bebi no dia, por meio de botões de acesso rápido, para alcançar minha meta diária de hidratação.

**Why this priority**: Hidratação é parte vital do acompanhamento, de rápida implementação e alto valor de engajamento diário.

**Independent Test**: Pode ser testado clicando nos atalhos do dashboard (+200ml, +300ml, etc.) e verificando o incremento da barra de progresso.

**Acceptance Scenarios**:
1. **Given** uma meta de água de 2000ml, **When** o usuário clica em "+500 ml", **Then** a interface deve mostrar o progresso atualizado de 500/2000ml de forma visual e satisfatória.
2. **Given** o usuário quer inserir um copo diferente, **When** ele clica em "valor personalizado" e digita 150ml, **Then** os 150ml são somados ao total diário.

---

### User Story 4 - Peso e Evolução (Priority: P2)

Como usuário, quero registrar meu peso atual e minha meta, para poder acompanhar minha evolução através de um histórico e tendência sem me sentir julgado.

**Why this priority**: O acompanhamento de peso é um motivador contínuo para usuários de dieta, devendo ser feito de forma empática e cuidadosa (Princípio XVI).

**Independent Test**: Registrar diversos pesos em dias diferentes e validar a construção da lista/gráfico de histórico.

**Acceptance Scenarios**:
1. **Given** o acesso à aba de peso, **When** o usuário cadastra o peso de hoje, **Then** o valor atualiza o dashboard e entra no histórico.
2. **Given** múltiplos registros de peso no mês, **When** o usuário acessa a evolução, **Then** deve ver a tendência visualmente clara e informativa.

---

### User Story 5 - Planos Alimentares Simples (Priority: P3)

Como usuário, quero criar e salvar planos e metas distribuídas por refeição, para ter um guia diário e saber minha aderência ao longo da semana.

**Why this priority**: Útil para planejamento semanal, reduzindo a fricção diária de entrada de dados, mas não bloqueia o fluxo principal do diário livre.

**Independent Test**: Criação de um template "Dieta Segunda-feira" e aplicação dele a um dia do calendário.

**Acceptance Scenarios**:
1. **Given** a tela de planos, **When** o usuário cria um plano com metas por refeição e salva como "Template 1", **Then** o plano fica disponível para ser ativado em dias futuros.
2. **Given** um plano ativado no dia de hoje, **When** o usuário registra alimentos, **Then** a aderência (consumido vs. planejado no plano) deve ser calculada e exibida.

---

## Edge Cases

- O que acontece se o usuário escanear um código de barras de um produto não alimentício? O app deve permitir ignorar e não salvar automaticamente o código corrompido, avisando que não foi encontrado e abrindo a tela de cadastro opcional.
- O que acontece se houver conflito entre bases de dados nutricionais para o mesmo nome de alimento? O app deve listar ambos, explicitando a fonte (ex: "Maçã - Fonte: USDA" vs "Maçã - Fonte: TBCA") e os metadados associados.
- Como o sistema lida com datas futuras? O usuário pode adicionar planos/alimentos no futuro, mas o foco do dashboard deve retornar sempre ao "Hoje".
- Limite de medidas extremas: O app deve avisar (de forma informativa) caso seja inserida uma quantidade excepcionalmente alta de ingestão (ex: 50.000 kcal ou 15L de água), mitigando erros de digitação, sem bloquear definitivamente a ação de forma punitiva.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: O sistema MUST permitir adição, edição e remoção offline de alimentos consumidos no Café da Manhã, Almoço, Jantar e Lanches.
- **FR-002**: O sistema MUST calcular macros diários (Kcal, Carb, Prot, Gord, Fibras, Sódio) em tempo real, baseando-se no diário offline.
- **FR-003**: O sistema MUST fornecer pesquisa unificada de alimentos filtrando por fontes (TBCA, USDA, Proprietária, Customizada do Usuário).
- **FR-004**: O sistema MUST permitir cadastro e edição de alimentos próprios, com unidades flexíveis (g, ml, porções caseiras).
- **FR-005**: O sistema MUST utilizar a câmera nativa para escanear código de barras e buscar itens correspondentes na base local.
- **FR-006**: O sistema MUST manter um banco local contendo o histórico de códigos de barras escaneados.
- **FR-007**: O sistema MUST suportar registro rápido de água (200, 300, 500ml e customizado) e acompanhamento visual da meta.
- **FR-008**: O sistema MUST permitir acompanhamento de peso temporal e configurar meta, apresentando IMC apenas de modo consultivo/informativo, sem linguagem restritiva.
- **FR-009**: O sistema MUST suportar criação, repetição e aplicação de planos alimentares templates ao calendário de dias da semana.
- **FR-010**: O sistema MUST exibir um Dashboard central com resumo calórico/macro, progresso da água e atalhos de ações (alimento, água, peso).
- **FR-011**: O sistema MUST operar totalmente de forma offline-first, persistindo dados no dispositivo usando SQLite/Drift ou equivalente, garantindo proteção e privacidade aos dados sensíveis.
- **FR-012**: O sistema MUST gerar um APK de teste para validação manual após cada entrega de funcionalidade concluída.
- **FR-013**: O sistema MUST integrar o uso de componentes criados por ferramentas como Nano Banana / Gemini Image garantindo assets originais e otimizados (ícones, backgrounds, banners).
- **FR-014**: O sistema MUST documentar o uso de Antigravity Awesome Skills aplicadas ao projeto.

### Key Entities

- **MealRecord**: Relaciona uma data, refeição (Enum: Cafe, Almoco, Jantar, Lanches), quantidade e um FoodItem.
- **FoodItem**: Dados do alimento contendo Nome, Macros básicos, Unidades e Meta-dados de Fonte (TBCA, USDA, Local).
- **BarcodeEntity**: Associação de um código EAN/UPC a um FoodItem específico.
- **WaterLog**: Registro de ingestão contendo volume em ML e data/hora.
- **WeightLog**: Registro de medição contendo kg, data e opcionalmente notas.
- **MealPlan**: Agrupamento de restrições/metas calóricas por refeição e sua atribuição a dias específicos.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: O tempo de busca local e retorno de um alimento deve ser inferior a 300ms em aparelhos intermediários.
- **SC-002**: O tempo para encontrar ou detectar a ausência de um código de barras pela câmera deve ser inferior a 2 segundos em condições normais de iluminação.
- **SC-003**: O aplicativo deve ser capaz de ser iniciado totalmente sem internet, carregando os dados do Dashboard diário (já armazenados) instantaneamente.
- **SC-004**: Toda imagem/background incluída com Nano Banana/Gemini Image não deve exceder os tamanhos e limites adequados, mantendo o bundle do App responsivo.
- **SC-005**: Geração do APK ocorre de forma consistente, documentada sem falhas ou regressões de linting e testes automatizados.

## Assumptions

- Presume-se que o banco de dados da TBCA e USDA (ou recortes relevantes para o MVP) poderá ser empacotado como asset inicial do app ou pré-populado na instalação (seed de dados) para garantir o modo offline imediato.
- Presume-se que o usuário possui aparelho com câmera funcional e concede as permissões necessárias para o scanner de código de barras.
- A sincronização na nuvem e o login social/backend centralizado estão fora de escopo para este MVP, o que significa que se o usuário desinstalar o app, poderá perder os dados a menos que seja exportado (funcionalidade opcional para o futuro).
