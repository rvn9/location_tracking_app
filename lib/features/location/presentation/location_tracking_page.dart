import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_tracking_app/features/location/application/is_tracking_location.dart';
import 'package:location_tracking_app/features/location/data/datasources/local_data_source/location_manager.dart';
import 'package:location_tracking_app/features/location/presentation/location_card.dart';

class LocationTrackingPage extends ConsumerWidget {
  const LocationTrackingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastKnownLocation = ref
        .watch(locationManagerProvider)
        .lastKnownPosition;
    final locationAsync = ref.watch(locationStreamProvider);
    final isTrackingState = ref.watch(isTrackingLocationProvider);
    final isTracking = isTrackingState.value ?? false;
    final manager = ref.read(locationManagerProvider);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('Location Tracking App'),
        actions: [
          IconButton(
            tooltip: isTracking ? 'Stop tracking' : 'Start tracking',
            icon: isTrackingState.isLoading
                ? const SizedBox.square(
                    dimension: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Icon(isTracking ? Icons.location_off : Icons.location_on),
            onPressed: isTrackingState.isLoading
                ? null
                : () => isTracking ? manager.stop() : manager.start(),
          ),
        ],
      ),
      body: locationAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (position) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              LocationCard(
                title: 'Current Location',
                icon: Icons.my_location,
                color: Colors.blue,
                location: position,
                emptyMessage: 'Waiting for location...',
              ),
              const SizedBox(height: 16),
              LocationCard(
                title: 'Last Known Location',
                icon: Icons.location_history,
                color: Colors.orange,
                location: lastKnownLocation,
                emptyMessage: 'No last known location yet',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
