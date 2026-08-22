import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/data/models/task_model.dart';
import 'package:taskflow/data/models/user_model.dart';
import 'package:taskflow/presentation/auth/auth_notifier.dart';

final userProvider = FutureProvider.family.autoDispose<User?, String>((ref, userId) async {
  final repository = ref.watch(userRepositoryProvider);
  return repository.getUser(userId);
});

final tasksProvider = FutureProvider.autoDispose<List<Task>>((ref) async {
  final orgId = ref.watch(currentOrgIdProvider);
  if (orgId == null) return [];

  final repository = ref.watch(taskRepositoryProvider);
  return repository.getTasks(orgId);
});

final tasksByProjectProvider = FutureProvider.family.autoDispose<List<Task>, String>((ref, projectId) async {
  final orgId = ref.watch(currentOrgIdProvider);
  if (orgId == null) return [];

  final repository = ref.watch(taskRepositoryProvider);
  return repository.getTasks(orgId, projectId: projectId);
});

final taskProvider = FutureProvider.family.autoDispose<Task, String>((ref, taskId) async {
  final repository = ref.watch(taskRepositoryProvider);
  return repository.getTask(taskId);
});

final taskNotifierProvider = StateNotifierProvider<TaskNotifier, AsyncValue<void>>((ref) {
  return TaskNotifier(ref);
});

class TaskNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref _ref;

  TaskNotifier(this._ref) : super(const AsyncData(null));

  Future<void> createTask(Task task) async {
    state = const AsyncLoading();
    try {
      await _ref.read(taskRepositoryProvider).createTask(task);
      _ref.invalidate(tasksProvider);
      _ref.invalidate(tasksByProjectProvider(task.projectId));
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateTask(Task task) async {
    state = const AsyncLoading();
    try {
      await _ref.read(taskRepositoryProvider).updateTask(task);
      _ref.invalidate(tasksProvider);
      _ref.invalidate(tasksByProjectProvider(task.projectId));
      _ref.invalidate(taskProvider(task.id));
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteTask(String id) async {
    state = const AsyncLoading();
    try {
      // Need to find the task first to know which project to invalidate
      final tasks = await _ref.read(tasksProvider.future);
      final task = tasks.where((t) => t.id == id).firstOrNull;
      
      await _ref.read(taskRepositoryProvider).deleteTask(id);
      _ref.invalidate(tasksProvider);
      _ref.invalidate(taskProvider(id));
      if (task != null) {
        _ref.invalidate(tasksByProjectProvider(task.projectId));
      }
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
