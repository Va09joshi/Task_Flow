import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/presentation/widgets/custom_app_bar.dart';

class DebugSettingsScreen extends ConsumerStatefulWidget {
  const DebugSettingsScreen({super.key});

  @override
  ConsumerState<DebugSettingsScreen> createState() => _DebugSettingsScreenState();
}

class _DebugSettingsScreenState extends ConsumerState<DebugSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final dataSource = ref.watch(mockDataSourceProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Debug Settings'),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const Text(
            'Mock Data Simulation',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Offline Mode'),
            subtitle: const Text('Simulate no internet connection'),
            value: dataSource.offlineMode,
            onChanged: (val) {
              setState(() => dataSource.offlineMode = val);
            },
          ),
          SwitchListTile(
            title: const Text('Simulate 404 Not Found'),
            subtitle: const Text('Force entity lookups to fail'),
            value: dataSource.simulate404,
            onChanged: (val) {
              setState(() => dataSource.simulate404 = val);
            },
          ),
          SwitchListTile(
            title: const Text('Simulate Network Timeout'),
            subtitle: const Text('Throw a connection timeout exception'),
            value: dataSource.simulateTimeout,
            onChanged: (val) {
              setState(() => dataSource.simulateTimeout = val);
            },
          ),
          SwitchListTile(
            title: const Text('Simulate Validation Error'),
            subtitle: const Text('Force a mock API validation error on login'),
            value: dataSource.simulateValidationError,
            onChanged: (val) {
              setState(() => dataSource.simulateValidationError = val);
            },
          ),
        ],
      ),
    );
  }
}
