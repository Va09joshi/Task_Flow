import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskflow/data/datasources/mock_data_source.dart';
import 'package:taskflow/data/repositories/auth_repository_impl.dart';
import 'package:taskflow/data/repositories/project_repository_impl.dart';
import 'package:taskflow/data/repositories/task_repository_impl.dart';
import 'package:taskflow/domain/repositories/notification_repository.dart';
import 'package:taskflow/data/repositories/notification_repository_impl.dart';
import 'package:taskflow/data/repositories/user_repository_impl.dart';
import 'package:taskflow/domain/repositories/auth_repository.dart';
import 'package:taskflow/domain/repositories/project_repository.dart';
import 'package:taskflow/domain/repositories/task_repository.dart';
import 'package:taskflow/domain/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(); // Initialized in main
});

final mockDataSourceProvider = Provider<MockDataSource>((ref) {
  return MockDataSource();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dataSource = ref.watch(mockDataSourceProvider);
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  return AuthRepositoryImpl(dataSource, sharedPrefs, secureStorage);
});

final projectRepositoryProvider = Provider<ProjectRepository>((ref) {
  final dataSource = ref.watch(mockDataSourceProvider);
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return ProjectRepositoryImpl(dataSource, sharedPrefs);
});

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final dataSource = ref.watch(mockDataSourceProvider);
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return TaskRepositoryImpl(dataSource, sharedPrefs);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dataSource = ref.watch(mockDataSourceProvider);
  return UserRepositoryImpl(dataSource);
});

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  final dataSource = ref.watch(mockDataSourceProvider);
  return NotificationRepositoryImpl(dataSource);
});
