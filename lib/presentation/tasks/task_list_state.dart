import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskflow/data/models/task_model.dart';

part 'task_list_state.freezed.dart';

@freezed
class TaskListState with _$TaskListState {
  const factory TaskListState.initial() = _Initial;
  const factory TaskListState.loading() = _Loading;
  const factory TaskListState.success(List<Task> tasks) = _Success;
  const factory TaskListState.empty() = _Empty;
  const factory TaskListState.error(String message) = _Error;
}
