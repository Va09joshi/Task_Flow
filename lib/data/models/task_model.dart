import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({
    required String id,
    @JsonKey(name: 'project_id') required String projectId,
    required String title,
    required String description,
    required String status,
    required String priority,
    @JsonKey(name: 'assignee_id') String? assigneeId,
    @JsonKey(name: 'due_date') required String dueDate,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
