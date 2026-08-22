import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskflow/data/datasources/mock_data_source.dart';
import 'package:taskflow/data/models/task_model.dart';
import 'package:taskflow/data/models/request/create_task_request.dart';
import 'package:taskflow/data/models/request/update_task_request.dart';
import 'package:taskflow/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final MockDataSource dataSource;
  final SharedPreferences sharedPrefs;

  TaskRepositoryImpl(this.dataSource, this.sharedPrefs);

  @override
  Future<List<Task>> getTasks(String orgId, {String? projectId}) async {
    try {
      final response = await dataSource.getTasks(orgId, projectId: projectId);
      // Cache the response for offline fallback
      final jsonList = response.tasks.map((t) => t.toJson()).toList();
      final key = 'cached_tasks_${orgId}_${projectId ?? "all"}';
      await sharedPrefs.setString(key, jsonEncode(jsonList));
      return response.tasks;
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
    final request = CreateTaskRequest(
      title: task.title,
      description: task.description,
      status: task.status,
      priority: task.priority,
      projectId: task.projectId,
      assigneeId: task.assigneeId,
      dueDate: task.dueDate,
    );
    await dataSource.createTask(request);
  }

  @override
  Future<void> updateTask(Task task) async {
    final request = UpdateTaskRequest(
      id: task.id,
      title: task.title,
      description: task.description,
      status: task.status,
      priority: task.priority,
      assigneeId: task.assigneeId,
      dueDate: task.dueDate,
    );
    await dataSource.updateTask(request);
  }

  @override
  Future<void> deleteTask(String id) async {
    return dataSource.deleteTask(id);
  }
}
