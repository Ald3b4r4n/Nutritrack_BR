// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FoodSearchNotifier)
final foodSearchProvider = FoodSearchNotifierProvider._();

final class FoodSearchNotifierProvider
    extends $AsyncNotifierProvider<FoodSearchNotifier, List<FoodItem>> {
  FoodSearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'foodSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$foodSearchNotifierHash();

  @$internal
  @override
  FoodSearchNotifier create() => FoodSearchNotifier();
}

String _$foodSearchNotifierHash() =>
    r'741ff08519f9d9ee2cba4185fdcac75c52b52692';

abstract class _$FoodSearchNotifier extends $AsyncNotifier<List<FoodItem>> {
  FutureOr<List<FoodItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<FoodItem>>, List<FoodItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<FoodItem>>, List<FoodItem>>,
              AsyncValue<List<FoodItem>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
