import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/data/models/project_model.dart';
import 'package:taskflow/presentation/auth/auth_notifier.dart';

final projectsProvider = FutureProvider.autoDispose<List<Project>>((ref) async {
  final orgId = ref.watch(currentOrgIdProvider);
  if (orgId == null) return [];

  final repository = ref.watch(projectRepositoryProvider);
  return repository.getProjects(orgId);
});

final projectNotifierProvider = StateNotifierProvider<ProjectNotifier, AsyncValue<void>>((ref) {
  return ProjectNotifier(ref);
});

class ProjectNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref _ref;

  ProjectNotifier(this._ref) : super(const AsyncData(null));

  Future<void> createProject(Project project) async {
    state = const AsyncLoading();
    try {
      final isAdmin = _ref.read(isAdminProvider);
      if (!isAdmin) throw Exception('Unauthorized to create projects');

      await _ref.read(projectRepositoryProvider).createProject(project);
      _ref.invalidate(projectsProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateProject(Project project) async {
    state = const AsyncLoading();
    try {
      final isAdmin = _ref.read(isAdminProvider);
      if (!isAdmin) throw Exception('Unauthorized to update projects');

      await _ref.read(projectRepositoryProvider).updateProject(project);
      _ref.invalidate(projectsProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteProject(String id) async {
    state = const AsyncLoading();
    try {
      final isAdmin = _ref.read(isAdminProvider);
      if (!isAdmin) throw Exception('Unauthorized to delete projects');

      await _ref.read(projectRepositoryProvider).deleteProject(id);
      _ref.invalidate(projectsProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
