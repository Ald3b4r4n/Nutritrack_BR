import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart';
import 'package:nutritrack_br/domain/value_objects/food_source.dart';

/// Tela de busca e cadastro de alimentos.
class FoodSearchScreen extends ConsumerStatefulWidget {
  const FoodSearchScreen({super.key});

  @override
  ConsumerState<FoodSearchScreen> createState() => _FoodSearchScreenState();
}

class _FoodSearchScreenState extends ConsumerState<FoodSearchScreen> {
  final _searchController = TextEditingController();
  FoodSource? _selectedSource;
  List<FoodItem> _results = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Alimentos')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Nome do alimento...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _results = []);
                        },
                      )
                    : null,
                border: const OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
              onSubmitted: (_) {},
            ),
          ),
          // Filter chips por fonte
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 8,
              children: [
                for (final source in FoodSource.values)
                  FilterChip(
                    label: Text(source.label),
                    selected: _selectedSource == source,
                    onSelected: (selected) {
                      setState(() {
                        _selectedSource = selected ? source : null;
                      });
                    },
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _results.isEmpty
                ? Center(
                    child: Text(
                      'Busque um alimento acima',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      final food = _results[index];
                      return _FoodListTile(food: food);
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Futura navegação para tela de cadastro
        },
        icon: const Icon(Icons.add),
        label: const Text('Criar novo'),
      ),
    );
  }
}

class _FoodListTile extends StatelessWidget {
  final FoodItem food;

  const _FoodListTile({required this.food});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final n = food.nutrients;

    return ListTile(
      title: Text(food.name),
      subtitle: Text(
        '${n.calories.toStringAsFixed(0)} kcal · '
        'P ${n.protein.toStringAsFixed(1)}g · '
        'C ${n.carbohydrates.toStringAsFixed(1)}g · '
        'G ${n.fat.toStringAsFixed(1)}g',
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: _badgeColor(food.source).withAlpha(30),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          food.source.label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: _badgeColor(food.source),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Color _badgeColor(FoodSource source) {
    switch (source) {
      case FoodSource.tbca:
        return const Color(0xFF2E7D32); // green
      case FoodSource.usda:
        return const Color(0xFF1565C0); // blue
      case FoodSource.proprietary:
        return const Color(0xFFE65100); // orange
      case FoodSource.custom:
        return const Color(0xFF6A1B9A); // purple
    }
  }
}
