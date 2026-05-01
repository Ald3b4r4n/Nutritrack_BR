// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WaterNotifier)
final waterProvider = WaterNotifierFamily._();

final class WaterNotifierProvider
    extends $AsyncNotifierProvider<WaterNotifier, List<WaterLog>> {
  WaterNotifierProvider._({
    required WaterNotifierFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'waterProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waterNotifierHash();

  @override
  String toString() {
    return r'waterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WaterNotifier create() => WaterNotifier();

  @override
  bool operator ==(Object other) {
    return other is WaterNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waterNotifierHash() => r'7796baffce38f81b82a445a95d87e132583e9313';

final class WaterNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WaterNotifier,
          AsyncValue<List<WaterLog>>,
          List<WaterLog>,
          FutureOr<List<WaterLog>>,
          DateTime
        > {
  WaterNotifierFamily._()
    : super(
        retry: null,
        name: r'waterProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaterNotifierProvider call(DateTime date) =>
      WaterNotifierProvider._(argument: date, from: this);

  @override
  String toString() => r'waterProvider';
}

abstract class _$WaterNotifier extends $AsyncNotifier<List<WaterLog>> {
  late final _$args = ref.$arg as DateTime;
  DateTime get date => _$args;

  FutureOr<List<WaterLog>> build(DateTime date);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<WaterLog>>, List<WaterLog>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<WaterLog>>, List<WaterLog>>,
              AsyncValue<List<WaterLog>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
