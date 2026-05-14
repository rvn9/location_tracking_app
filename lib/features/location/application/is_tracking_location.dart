import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_tracking_location.g.dart';

@Riverpod(keepAlive: true)
class IsTrackingLocation extends _$IsTrackingLocation {
  @override
  FutureOr<bool> build() async {
    return state.value ?? false;
  }

  void setIsTrackingLocation({required bool isTracking}) {
    state = AsyncData(isTracking);
  }

  void toggleIsTrackingLocation() {
    final currentValue = state.value ?? false;
    state = AsyncData(!currentValue);
  }
}
