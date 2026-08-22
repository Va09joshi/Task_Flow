import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskflow/data/models/task_model.dart';

part 'task_list_response.freezed.dart';
part 'task_list_response.g.dart';

@freezed
abstract class TaskListResponse with _$TaskListResponse {
  const factory TaskListResponse({
    required List<Task> tasks,
    @Default(0) int totalCount,
  }) = _TaskListResponse;

  factory TaskListResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskListResponseFromJson(json);
}
