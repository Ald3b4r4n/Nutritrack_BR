import 'package:nutritrack_br/application/providers/repository_providers.dart';
import 'package:nutritrack_br/application/usecases/food/create_food_usecase.dart';
import 'package:nutritrack_br/application/usecases/food/search_foods_usecase.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart';
import 'package:nutritrack_br/domain/value_objects/food_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_search_provider.g.dart';

@riverpod
class FoodSearchNotifier extends _$FoodSearchNotifier {
  @override
  FutureOr<List<FoodItem>> build() async {
    // Estado inicial: lista vazia até o usuário buscar
    return [];
  }

  Future<void> search(String query, {FoodSource? source}) async {
    state = const AsyncLoading();
    final repo = ref.read(foodRepositoryProvider);
    final usecase = SearchFoodsUseCase(repo);
    final result = await usecase(query, source: source);
    state = result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (foods) => AsyncData(foods),
    );
  }

  Future<void> createFood(FoodItem food) async {
    final repo = ref.read(foodRepositoryProvider);
    final usecase = CreateFoodUseCase(repo);
    final result = await usecase(food);
    if (result.isRight()) {
      // Recarrega a busca após cadastro
      ref.invalidateSelf();
    }
  }
}
