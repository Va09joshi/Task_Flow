import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_comment_request.freezed.dart';
part 'create_comment_request.g.dart';

@freezed
abstract class CreateCommentRequest with _$CreateCommentRequest {
  const factory CreateCommentRequest({
    @JsonKey(name: 'task_id') required String taskId,
    @JsonKey(name: 'author_id') required String authorId,
    required String body,
  }) = _CreateCommentRequest;

  factory CreateCommentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCommentRequestFromJson(json);
}
