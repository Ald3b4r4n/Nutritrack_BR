// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_plan_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ActiveMealPlanNotifier)
final activeMealPlanProvider = ActiveMealPlanNotifierProvider._();

final class ActiveMealPlanNotifierProvider
    extends $AsyncNotifierProvider<ActiveMealPlanNotifier, FullMealPlan?> {
  ActiveMealPlanNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeMealPlanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeMealPlanNotifierHash();

  @$internal
  @override
  ActiveMealPlanNotifier create() => ActiveMealPlanNotifier();
}

String _$activeMealPlanNotifierHash() =>
    r'0d4de1a3cdd159615dac9a109684505d8b7d4604';

abstract class _$ActiveMealPlanNotifier extends $AsyncNotifier<FullMealPlan?> {
  FutureOr<FullMealPlan?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<FullMealPlan?>, FullMealPlan?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FullMealPlan?>, FullMealPlan?>,
              AsyncValue<FullMealPlan?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
