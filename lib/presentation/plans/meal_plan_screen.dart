import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutritrack_br/application/providers/meal_plan_provider.dart';

/// Tela de acompanhamento e criação de planos alimentares.
/// Foco em simplicidade e linguagem não-punitiva.
class MealPlanScreen extends ConsumerWidget {
  const MealPlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activePlanState = ref.watch(activeMealPlanProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Plano Alimentar')),
      body: activePlanState.when(
        data: (fullPlan) {
          if (fullPlan == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.event_note,
                    size: 64,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Você ainda não tem um plano ativo.',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Crie um modelo simples para organizar suas refeições.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: () {
                      // TODO: Navegar para tela de criação de plano
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Criar Plano'),
                  ),
                ],
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text(
                'Plano Atual: ${fullPlan.plan.name}',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Aderência é um guia, não uma regra inflexível. O importante é o equilíbrio geral.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              // Exemplo de exibição do plano (placeholder para a lista de dias)
              Card(
                child: ListTile(
                  leading: const Icon(Icons.calendar_month),
                  title: Text('${fullPlan.days.length} dias configurados'),
                  subtitle: Text(
                    '${fullPlan.entries.length} refeições planejadas no total',
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Expandir detalhes do plano
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) =>
            Center(child: Text('Erro ao carregar o plano: $err')),
      ),
    );
  }
}
