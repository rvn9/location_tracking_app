// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_tracking_location.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IsTrackingLocation)
final isTrackingLocationProvider = IsTrackingLocationProvider._();

final class IsTrackingLocationProvider
    extends $AsyncNotifierProvider<IsTrackingLocation, bool> {
  IsTrackingLocationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isTrackingLocationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isTrackingLocationHash();

  @$internal
  @override
  IsTrackingLocation create() => IsTrackingLocation();
}

String _$isTrackingLocationHash() =>
    r'5b6a1321dc5b05012cbdc2158c094cb580bb5d91';

abstract class _$IsTrackingLocation extends $AsyncNotifier<bool> {
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
