import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:location_tracking_app/features/location/application/is_tracking_location.dart';
import 'package:location_tracking_app/utils/in_memory_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_manager.g.dart';

@pragma('vm:entry-point')
void backgroundGeolocationHeadlessTask(bg.HeadlessEvent headlessEvent) async {
  if (headlessEvent.name == bg.Event.LOCATION) {
    final location = headlessEvent.event as bg.Location;
    debugPrint('[HeadlessTask] location: $location');
  }
}

class LocationManager {
  LocationManager(this._ref);

  final Ref _ref;
  final _currentPosition = InMemoryStore<bg.Location?>(null);
  final _lastKnownPosition = InMemoryStore<bg.Location?>(null);
  Timer? _timer;

  bool _initialized = false;

  Stream<bg.Location?> positionStream() => _currentPosition.stream;
  bg.Location? get currentPosition => _currentPosition.value;
  bg.Location? get lastKnownPosition => _lastKnownPosition.value;

  bool get isTracking => _ref.read(isTrackingLocationProvider).value ?? false;

  void _setTracking(bool value) => _ref
      .read(isTrackingLocationProvider.notifier)
      .setIsTrackingLocation(isTracking: value);

  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;
    try {
      // Request permission
      await bg.BackgroundGeolocation.requestPermission();

      // Listen to location changes
      bg.BackgroundGeolocation.onLocation((bg.Location location) {
        if (location.sample == true) return;
        _currentPosition.value = location;
        if (!location.isMoving) _lastKnownPosition.value = location;
      }, (bg.LocationError error) => debugPrint(error.toString()));

      // Initialize background geolocation
      await bg.BackgroundGeolocation.ready(
        bg.Config(
          debug: true,
          desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
          app: bg.AppConfig(
            startOnBoot: true,
            stopOnTerminate: false,
            enableHeadless: true,
            notification: bg.Notification(
              title: 'Location Tracking',
              text: 'Location is being tracked in the background',
            ),
          ),
          geolocation: bg.GeoConfig(
            distanceFilter: 10,
            pausesLocationUpdatesAutomatically: false,
            showsBackgroundLocationIndicator: true,
          ),
          activityType: bg.Config.ACTIVITY_TYPE_OTHER,
        ),
      );

      final state = await bg.BackgroundGeolocation.state;

      // Start tracking if not already enabled
      if (!state.enabled) {
        await bg.BackgroundGeolocation.start();
      } else {
        start();
      }
    } catch (e) {
      debugPrint('[LocationManager] init failed: $e');
    }
  }

  // Start timer to update last known location every 5 seconds
  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPosition.value != null) {
        _lastKnownPosition.value = _currentPosition.value;
      }
    });
  }

  Future<void> start() async {
    if (isTracking) return;
    try {
      await bg.BackgroundGeolocation.changePace(true);
      _setTracking(true);
      _startTimer();
    } catch (e) {
      debugPrint('[LocationManager] start failed: $e');
    }
  }

  Future<void> stop() async {
    if (!isTracking) return;
    _setTracking(false);
    try {
      await bg.BackgroundGeolocation.changePace(false);
      _timer?.cancel();
    } catch (e) {
      debugPrint('[LocationManager] stop failed: $e');
    }
  }

  void dispose() {
    _timer?.cancel();
    _currentPosition.close();
    _lastKnownPosition.close();
  }
}

@Riverpod(keepAlive: true)
LocationManager locationManager(Ref ref) {
  final manager = LocationManager(ref);
  ref.onDispose(manager.dispose);
  manager.init();
  return manager;
}

@Riverpod(keepAlive: true)
Stream<bg.Location?> locationStream(Ref ref) {
  final manager = ref.read(locationManagerProvider);
  return manager.positionStream();
}
