import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nutritrack_br/application/providers/dashboard_provider.dart';

/// Tela principal do NutriTrack BR — exibe o resumo consolidado do dia.
/// Consome exclusivamente o DashboardProvider para dados.
/// Linguagem neutra, informativa e encorajadora.
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateTime.now();
    // Forçamos a meia noite para usar como key do dia
    final dateKey = DateTime(today.year, today.month, today.day);
    final summaryAsync = ref.watch(dashboardSummaryProvider(dateKey));

    return Scaffold(
      appBar: AppBar(title: const Text('NutriTrack BR')),
      body: summaryAsync.when(
        data: (summary) => _buildDashboardContent(context, summary),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('Erro ao carregar painel: $error')),
      ),
    );
  }

  Widget _buildDashboardContent(
    BuildContext context,
    DashboardSummary summary,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCalorieCard(context, summary),
          const SizedBox(height: 16),
          _buildMacroSection(context, summary),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildWaterCard(context, summary)),
              const SizedBox(width: 16),
              Expanded(child: _buildWeightCard(context, summary)),
            ],
          ),
          const SizedBox(height: 24),
          Text('Ações Rápidas', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _QuickActionBtn(
                icon: Icons.add_circle,
                label: 'Refeição',
                semanticLabel: 'Adicionar refeição ao diário',
                onTap: () => context.go('/diary'),
              ),
              _QuickActionBtn(
                icon: Icons.local_drink,
                label: 'Água',
                semanticLabel: 'Registrar água',
                onTap: () => context.go('/water'),
              ),
              _QuickActionBtn(
                icon: Icons.monitor_weight,
                label: 'Peso',
                semanticLabel: 'Registrar peso',
                onTap: () => context.go('/weight'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalorieCard(BuildContext context, DashboardSummary summary) {
    final theme = Theme.of(context);
    final double progress = summary.targetCalories > 0
        ? (summary.consumedCalories / summary.targetCalories).clamp(0.0, 1.0)
        : 0;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Calorias do Dia', style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            Semantics(
              label:
                  '${summary.consumedCalories.toStringAsFixed(0)} de ${summary.targetCalories.toStringAsFixed(0)} calorias consumidas',
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 10,
                      backgroundColor:
                          theme.colorScheme.surfaceContainerHighest,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        summary.consumedCalories.toStringAsFixed(0),
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '/ ${summary.targetCalories.toStringAsFixed(0)} kcal',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMacroSection(BuildContext context, DashboardSummary summary) {
    final theme = Theme.of(context);
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Macronutrientes', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            _MacroRow(
              label: 'Proteínas',
              value: summary.consumedProtein,
              color: const Color(0xFF42A5F5), // azul
            ),
            const SizedBox(height: 8),
            _MacroRow(
              label: 'Carboidratos',
              value: summary.consumedCarbs,
              color: const Color(0xFFFFA726), // laranja
            ),
            const SizedBox(height: 8),
            _MacroRow(
              label: 'Gorduras',
              value: summary.consumedFat,
              color: const Color(0xFFEF5350), // vermelho suave
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWaterCard(BuildContext context, DashboardSummary summary) {
    final theme = Theme.of(context);
    return Semantics(
      label:
          'Água: ${summary.consumedWaterMl} de ${summary.targetWaterMl} mililitros',
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(Icons.water_drop, color: theme.colorScheme.primary),
              const SizedBox(height: 8),
              Text('Água', style: theme.textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(
                '${summary.consumedWaterMl} / ${summary.targetWaterMl} ml',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeightCard(BuildContext context, DashboardSummary summary) {
    final theme = Theme.of(context);
    final weightText = summary.currentWeightKg != null
        ? '${summary.currentWeightKg!.toStringAsFixed(1)} kg'
        : 'Sem registro';

    return Semantics(
      label: 'Peso atual: $weightText',
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(Icons.monitor_weight, color: theme.colorScheme.tertiary),
              const SizedBox(height: 8),
              Text('Peso Atual', style: theme.textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(weightText, style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

/// Linha de exibição de macro com valor e barra de cor.
class _MacroRow extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const _MacroRow({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(label, style: theme.textTheme.bodyMedium),
        const Spacer(),
        Text(
          '${value.toStringAsFixed(1)}g',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

/// Botão de ação rápida com ícone, texto e Semantics.
class _QuickActionBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String semanticLabel;
  final VoidCallback onTap;

  const _QuickActionBtn({
    required this.icon,
    required this.label,
    required this.semanticLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      button: true,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          minimumSize: const Size(48, 48), // min touch target
        ),
      ),
    );
  }
}
