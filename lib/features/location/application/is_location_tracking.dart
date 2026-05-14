import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_location_tracking.g.dart';

@Riverpod(keepAlive: true)
class IsLocationTracking extends _$IsLocationTracking {
  @override
  FutureOr<bool> build() async {
    return state.value ?? false;
  }

  void setIsLocationTracking({required bool isTracking}) {
    state = AsyncData(isTracking);
  }

  void toggleIsLocationTracking() {
    final currentValue = state.value ?? false;
    state = AsyncData(!currentValue);
  }
}
