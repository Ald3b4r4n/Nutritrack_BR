import 'package:nutritrack_br/application/providers/repository_providers.dart';
import 'package:nutritrack_br/application/usecases/diary/add_meal_entry_usecase.dart';
import 'package:nutritrack_br/application/usecases/diary/get_daily_meals_usecase.dart';
import 'package:nutritrack_br/application/usecases/diary/remove_meal_entry_usecase.dart';
import 'package:nutritrack_br/application/usecases/diary/update_meal_entry_usecase.dart';
import 'package:nutritrack_br/domain/entities/meal_entry.dart';
import 'package:nutritrack_br/domain/entities/meal_entry_details.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'diary_provider.g.dart';

@riverpod
class DiaryNotifier extends _$DiaryNotifier {
  @override
  FutureOr<List<MealEntryDetails>> build(DateTime date) async {
    return _fetchMeals(date);
  }

  Future<List<MealEntryDetails>> _fetchMeals(DateTime d) async {
    final repo = ref.read(mealRepositoryProvider);
    final usecase = GetDailyMealsUseCase(repo);
    final result = await usecase(d);
    return result.fold(
      (l) => throw Exception(l.message), // Lança para o AsyncError
      (r) => r,
    );
  }

  Future<void> addEntry(MealEntry entry) async {
    final repo = ref.read(mealRepositoryProvider);
    final usecase = AddMealEntryUseCase(repo);
    final result = await usecase(entry: entry, date: date);
    
    if (result.isRight()) {
      // Recarrega o estado em vez de adicionar localmente (pois precisamos do FoodItem pra calcular o details)
      ref.invalidateSelf();
    } else {
      // Lidar com erro se necessário
    }
  }

  Future<void> removeEntry(String entryId) async {
    final repo = ref.read(mealRepositoryProvider);
    final usecase = RemoveMealEntryUseCase(repo);
    final result = await usecase(entryId);

    if (result.isRight()) {
      ref.invalidateSelf();
    }
  }

  Future<void> updateEntry(MealEntry entry) async {
    final repo = ref.read(mealRepositoryProvider);
    final usecase = UpdateMealEntryUseCase(repo);
    final result = await usecase(entry);

    if (result.isRight()) {
      ref.invalidateSelf();
    }
  }
}
