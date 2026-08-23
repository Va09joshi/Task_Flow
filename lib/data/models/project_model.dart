import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
abstract class Project with _$Project {
  const factory Project({
    required String id,
    @JsonKey(name: 'org_id') required String orgId,
    required String name,
    required String description,
    @JsonKey(name: 'task_count') required int taskCount,
    required String status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
