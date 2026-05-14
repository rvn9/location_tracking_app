import 'package:flutter/material.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_tracking_app/features/location/data/datasources/local_data_source/location_manager.dart';
import 'package:location_tracking_app/features/location/presentation/location_tracking_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bg.BackgroundGeolocation.registerHeadlessTask(
    backgroundGeolocationHeadlessTask,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const LocationTrackingPage());
  }
}
