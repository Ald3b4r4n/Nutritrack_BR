import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      child: Column(
        children: [
          Text(title),
          TextButton(
            onPressed: () {},
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}
