import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_task_request.freezed.dart';
part 'create_task_request.g.dart';

@freezed
abstract class CreateTaskRequest with _$CreateTaskRequest {
  const factory CreateTaskRequest({
    required String title,
    required String description,
    required String status,
    required String priority,
    @JsonKey(name: 'project_id') required String projectId,
    @JsonKey(name: 'assignee_id') String? assigneeId,
    @JsonKey(name: 'due_date') String? dueDate,
  }) = _CreateTaskRequest;

  factory CreateTaskRequest.fromJson(Map<String, dynamic> json) => _$CreateTaskRequestFromJson(json);
}
