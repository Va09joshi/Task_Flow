import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskflow/data/datasources/mock_data_source.dart';
import 'package:taskflow/data/models/task_model.dart';
import 'package:taskflow/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final MockDataSource dataSource;
  final SharedPreferences sharedPrefs;

  TaskRepositoryImpl(this.dataSource, this.sharedPrefs);

  @override
  Future<List<Task>> getTasks(String orgId, {String? projectId}) async {
    try {
      final tasks = await dataSource.getTasks(orgId, projectId: projectId);
      final jsonList = tasks.map((t) => t.toJson()).toList();
      final key = 'cached_tasks_${orgId}_${projectId ?? "all"}';
      await sharedPrefs.setString(key, jsonEncode(jsonList));
      return tasks;
    } catch (e) {
      final key = 'cached_tasks_${orgId}_${projectId ?? "all"}';
      final cachedStr = sharedPrefs.getString(key);
      if (cachedStr != null) {
        final List decoded = jsonDecode(cachedStr);
        return decoded.map((e) => Task.fromJson(e)).toList();
      }
      rethrow;
    }
  }

  @override
  Future<Task> getTask(String id) async {
    return dataSource.getTask(id);
  }

  @override
  Future<void> createTask(Task task) async {
    return dataSource.createTask(task);
  }

  @override
  Future<void> updateTask(Task task) async {
    return dataSource.updateTask(task);
  }

  @override
  Future<void> deleteTask(String id) async {
    return dataSource.deleteTask(id);
  }
}
