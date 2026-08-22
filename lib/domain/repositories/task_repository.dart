import 'package:taskflow/data/models/task_model.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks(String orgId, {String? projectId});
  Future<Task> getTask(String id);
  Future<void> createTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String id);
}
