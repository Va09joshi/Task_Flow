import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';

final debugSimulate404Provider = StateProvider<bool>((ref) {
  return false;
});

final debugSimulateTimeoutProvider = StateProvider<bool>((ref) {
  return false;
});

final debugSimulateValidationErrorProvider = StateProvider<bool>((ref) {
  return false;
});

final debugOfflineModeProvider = StateProvider<bool>((ref) {
  return false;
});

// A provider that listens to these changes and syncs them with MockDataSource
final debugConfigSyncProvider = Provider<void>((ref) {
  final dataSource = ref.watch(mockDataSourceProvider);
  
  dataSource.simulate404 = ref.watch(debugSimulate404Provider);
  dataSource.simulateTimeout = ref.watch(debugSimulateTimeoutProvider);
  dataSource.simulateValidationError = ref.watch(debugSimulateValidationErrorProvider);
  dataSource.offlineMode = ref.watch(debugOfflineModeProvider);
});
