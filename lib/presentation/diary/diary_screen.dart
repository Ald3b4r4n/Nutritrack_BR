import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DiaryScreen extends ConsumerWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diário Alimentar')),
      body: ListView(
        children: const [
          _MealSection(title: 'Café da manhã'),
          _MealSection(title: 'Almoço'),
          _MealSection(title: 'Jantar'),
          _MealSection(title: 'Lanches'),
        ],
      ),
    );
  }
}

class _MealSection extends StatelessWidget {
  final String title;

  const _MealSection({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Semantics(
              label: 'Adicionar alimento em $title',
              child: TextButton.icon(
                onPressed: () => context.push('/search'),
                icon: const Icon(Icons.add),
                label: const Text('Adicionar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
