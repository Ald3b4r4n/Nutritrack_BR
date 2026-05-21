// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboardSummary)
final dashboardSummaryProvider = DashboardSummaryFamily._();

final class DashboardSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<DashboardSummary>,
          DashboardSummary,
          FutureOr<DashboardSummary>
        >
    with $FutureModifier<DashboardSummary>, $FutureProvider<DashboardSummary> {
  DashboardSummaryProvider._({
    required DashboardSummaryFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'dashboardSummaryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dashboardSummaryHash();

  @override
  String toString() {
    return r'dashboardSummaryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<DashboardSummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DashboardSummary> create(Ref ref) {
    final argument = this.argument as DateTime;
    return dashboardSummary(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DashboardSummaryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dashboardSummaryHash() => r'af785b70e25d2d23db6e9ad6d7ce48207136c860';

final class DashboardSummaryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<DashboardSummary>, DateTime> {
  DashboardSummaryFamily._()
    : super(
        retry: null,
        name: r'dashboardSummaryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DashboardSummaryProvider call(DateTime date) =>
      DashboardSummaryProvider._(argument: date, from: this);

  @override
  String toString() => r'dashboardSummaryProvider';
}
