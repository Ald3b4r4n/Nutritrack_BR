import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Tela de registro de ingestão de água.
/// Linguagem neutra e encorajadora — sem punição ou julgamento.
class WaterScreen extends ConsumerWidget {
  const WaterScreen({super.key});

  static const int _dailyGoalMl = 2000;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // Para o MVP placeholder, exibimos a interface funcional
    // sem conectar ao provider real (que será integrado ao dashboard).
    return Scaffold(
      appBar: AppBar(title: const Text('Hidratação')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Progresso visual
            const _WaterProgressIndicator(
              currentMl: 0,
              goalMl: _dailyGoalMl,
            ),
            const SizedBox(height: 32),
            Text(
              'Adicionar água',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            // Botões rápidos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _QuickAddButton(label: '+200 ml', amountMl: 200, onPressed: () {}),
                _QuickAddButton(label: '+300 ml', amountMl: 300, onPressed: () {}),
                _QuickAddButton(label: '+500 ml', amountMl: 500, onPressed: () {}),
              ],
            ),
            const SizedBox(height: 16),
            // Valor personalizado
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              label: const Text('Valor personalizado'),
            ),
            const Spacer(),
            Text(
              'Cada gole conta. Mantenha-se hidratado no seu ritmo.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _WaterProgressIndicator extends StatelessWidget {
  final int currentMl;
  final int goalMl;

  const _WaterProgressIndicator({
    required this.currentMl,
    required this.goalMl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = goalMl > 0 ? (currentMl / goalMl).clamp(0.0, 1.0) : 0.0;
    final percentage = (progress * 100).toInt();

    return Column(
      children: [
        SizedBox(
          width: 160,
          height: 160,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: progress,
                strokeWidth: 12,
                backgroundColor:
                    theme.colorScheme.primaryContainer.withAlpha(80),
                color: theme.colorScheme.primary,
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.water_drop,
                        size: 32, color: theme.colorScheme.primary),
                    const SizedBox(height: 4),
                    Text(
                      '$percentage%',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '$currentMl / $goalMl ml',
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class _QuickAddButton extends StatelessWidget {
  final String label;
  final int amountMl;
  final VoidCallback onPressed;

  const _QuickAddButton({
    required this.label,
    required this.amountMl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
