import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_project_request.freezed.dart';
part 'update_project_request.g.dart';

@freezed
abstract class UpdateProjectRequest with _$UpdateProjectRequest {
  const factory UpdateProjectRequest({
    required String id,
    String? name,
    String? description,
    String? status,
  }) = _UpdateProjectRequest;

  factory UpdateProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectRequestFromJson(json);
}
