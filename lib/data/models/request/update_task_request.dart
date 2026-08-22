import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_task_request.freezed.dart';
part 'update_task_request.g.dart';

@freezed
abstract class UpdateTaskRequest with _$UpdateTaskRequest {
  const factory UpdateTaskRequest({
    required String id,
    String? title,
    String? description,
    String? status,
    String? priority,
    @JsonKey(name: 'assignee_id') String? assigneeId,
    @JsonKey(name: 'due_date') String? dueDate,
  }) = _UpdateTaskRequest;

  factory UpdateTaskRequest.fromJson(Map<String, dynamic> json) => _$UpdateTaskRequestFromJson(json);
}
