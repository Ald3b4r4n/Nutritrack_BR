// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DiaryNotifier)
final diaryProvider = DiaryNotifierFamily._();

final class DiaryNotifierProvider
    extends $AsyncNotifierProvider<DiaryNotifier, List<MealEntryDetails>> {
  DiaryNotifierProvider._({
    required DiaryNotifierFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'diaryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$diaryNotifierHash();

  @override
  String toString() {
    return r'diaryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DiaryNotifier create() => DiaryNotifier();

  @override
  bool operator ==(Object other) {
    return other is DiaryNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$diaryNotifierHash() => r'46130406e173ec8f53f49655802d84816d66e0dc';

final class DiaryNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          DiaryNotifier,
          AsyncValue<List<MealEntryDetails>>,
          List<MealEntryDetails>,
          FutureOr<List<MealEntryDetails>>,
          DateTime
        > {
  DiaryNotifierFamily._()
    : super(
        retry: null,
        name: r'diaryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DiaryNotifierProvider call(DateTime date) =>
      DiaryNotifierProvider._(argument: date, from: this);

  @override
  String toString() => r'diaryProvider';
}

abstract class _$DiaryNotifier extends $AsyncNotifier<List<MealEntryDetails>> {
  late final _$args = ref.$arg as DateTime;
  DateTime get date => _$args;

  FutureOr<List<MealEntryDetails>> build(DateTime date);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<MealEntryDetails>>, List<MealEntryDetails>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<MealEntryDetails>>,
                List<MealEntryDetails>
              >,
              AsyncValue<List<MealEntryDetails>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
