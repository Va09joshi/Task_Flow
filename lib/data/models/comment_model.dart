import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
abstract class Comment with _$Comment {
  const factory Comment({
    required String id,
    @JsonKey(name: 'task_id') required String taskId,
    @JsonKey(name: 'author_id') required String authorId,
    required String body,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
