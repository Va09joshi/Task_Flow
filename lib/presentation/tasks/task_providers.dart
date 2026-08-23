import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/data/models/task_model.dart';
import 'package:taskflow/data/models/user_model.dart';
import 'package:taskflow/presentation/auth/auth_notifier.dart';
import 'package:taskflow/presentation/tasks/task_list_state.dart';

final userProvider = FutureProvider.family.autoDispose<User?, String>((
  ref,
  userId,
) async {
  final repository = ref.watch(userRepositoryProvider);
  return repository.getUser(userId);
});

final taskListNotifierProvider =
    StateNotifierProvider.autoDispose<TaskListNotifier, TaskListState>((ref) {
      return TaskListNotifier(ref);
    });

class TaskListNotifier extends StateNotifier<TaskListState> {
  final Ref _ref;

  TaskListNotifier(this._ref) : super(const TaskListState.initial()) {
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    state = const TaskListState.loading();
    try {
      final orgId = _ref.read(currentOrgIdProvider);
      if (orgId == null) {
        state = const TaskListState.empty();
        return;
      }
      final repository = _ref.read(taskRepositoryProvider);
      final tasks = await repository.getTasks(orgId);

      if (tasks.isEmpty) {
        state = const TaskListState.empty();
      } else {
        state = TaskListState.success(tasks);
      }
    } catch (e) {
      state = TaskListState.error(e.toString());
    }
  }
}

final tasksProvider = FutureProvider.autoDispose<List<Task>>((ref) async {
  final orgId = ref.watch(currentOrgIdProvider);
  if (orgId == null) return [];

  final repository = ref.watch(taskRepositoryProvider);
  return repository.getTasks(orgId);
});

final tasksByProjectProvider = FutureProvider.family
    .autoDispose<List<Task>, String>((ref, projectId) async {
      final orgId = ref.watch(currentOrgIdProvider);
      if (orgId == null) return [];

      final repository = ref.watch(taskRepositoryProvider);
      return repository.getTasks(orgId, projectId: projectId);
    });

final taskProvider = FutureProvider.family.autoDispose<Task, String>((
  ref,
  taskId,
) async {
  final repository = ref.watch(taskRepositoryProvider);
  return repository.getTask(taskId);
});

final taskNotifierProvider =
    StateNotifierProvider<TaskNotifier, AsyncValue<void>>((ref) {
      return TaskNotifier(ref);
    });

final orgMembersProvider = FutureProvider.autoDispose<List<User>>((ref) async {
  final orgId = ref.watch(currentOrgIdProvider);
  if (orgId == null) return [];
  final repository = ref.watch(userRepositoryProvider);
  return repository.getOrgMembers(orgId);
});

class TaskNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref _ref;

  TaskNotifier(this._ref) : super(const AsyncData(null));

  Future<void> createTask(Task task) async {
    state = const AsyncLoading();
    try {
      if (task.assigneeId != null) {
        final orgId = _ref.read(currentOrgIdProvider);
        if (orgId != null) {
          final member = await _ref
              .read(userRepositoryProvider)
              .getOrgMember(orgId, task.assigneeId!);
          if (member == null) {
            throw Exception(
              'Assignee does not belong to the current organization',
            );
          }
        }
      }
      await _ref.read(taskRepositoryProvider).createTask(task);
      _ref.read(taskListNotifierProvider.notifier).fetchTasks();
      _ref.invalidate(tasksByProjectProvider(task.projectId));
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateTask(Task task) async {
    state = const AsyncLoading();
    try {
      if (task.assigneeId != null) {
        final orgId = _ref.read(currentOrgIdProvider);
        if (orgId != null) {
          final member = await _ref
              .read(userRepositoryProvider)
              .getOrgMember(orgId, task.assigneeId!);
          if (member == null) {
            throw Exception(
              'Assignee does not belong to the current organization',
            );
          }
        }
      }
      await _ref.read(taskRepositoryProvider).updateTask(task);
      _ref.read(taskListNotifierProvider.notifier).fetchTasks();
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
      String? projectId;
      _ref
          .read(taskListNotifierProvider)
          .mapOrNull(
            success: (s) {
              final task = s.tasks.where((t) => t.id == id).firstOrNull;
              projectId = task?.projectId;
            },
          );

      await _ref.read(taskRepositoryProvider).deleteTask(id);
      _ref.read(taskListNotifierProvider.notifier).fetchTasks();
      _ref.invalidate(taskProvider(id));
      if (projectId != null) {
        _ref.invalidate(tasksByProjectProvider(projectId!));
      }
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
