// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(locationManager)
final locationManagerProvider = LocationManagerProvider._();

final class LocationManagerProvider
    extends
        $FunctionalProvider<LocationManager, LocationManager, LocationManager>
    with $Provider<LocationManager> {
  LocationManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationManagerHash();

  @$internal
  @override
  $ProviderElement<LocationManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocationManager create(Ref ref) {
    return locationManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationManager>(value),
    );
  }
}

String _$locationManagerHash() => r'7726f1a0162ebb7c055cec9a2e2a48a35241884c';

@ProviderFor(locationStream)
final locationStreamProvider = LocationStreamProvider._();

final class LocationStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<bg.Location?>,
          bg.Location?,
          Stream<bg.Location?>
        >
    with $FutureModifier<bg.Location?>, $StreamProvider<bg.Location?> {
  LocationStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationStreamProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationStreamHash();

  @$internal
  @override
  $StreamProviderElement<bg.Location?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<bg.Location?> create(Ref ref) {
    return locationStream(ref);
  }
}

String _$locationStreamHash() => r'c0f308f1ca5e3a7aaa0610ac208c50a7374f036e';
