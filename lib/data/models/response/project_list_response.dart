import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskflow/data/models/project_model.dart';

part 'project_list_response.freezed.dart';
part 'project_list_response.g.dart';

@freezed
abstract class ProjectListResponse with _$ProjectListResponse {
  const factory ProjectListResponse({
    required List<Project> projects,
    @Default(0) int totalCount,
  }) = _ProjectListResponse;

  factory ProjectListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectListResponseFromJson(json);
}
