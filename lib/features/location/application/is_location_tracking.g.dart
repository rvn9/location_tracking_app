// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_location_tracking.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IsLocationTracking)
final isLocationTrackingProvider = IsLocationTrackingProvider._();

final class IsLocationTrackingProvider
    extends $AsyncNotifierProvider<IsLocationTracking, bool> {
  IsLocationTrackingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isLocationTrackingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isLocationTrackingHash();

  @$internal
  @override
  IsLocationTracking create() => IsLocationTracking();
}

String _$isLocationTrackingHash() =>
    r'bb93c9af150837de1428f679cbc7d4604afb163c';

abstract class _$IsLocationTracking extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
