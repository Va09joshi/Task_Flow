// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateCommentRequest _$CreateCommentRequestFromJson(
  Map<String, dynamic> json,
) => _CreateCommentRequest(
  taskId: json['task_id'] as String,
  authorId: json['author_id'] as String,
  body: json['body'] as String,
);

Map<String, dynamic> _$CreateCommentRequestToJson(
  _CreateCommentRequest instance,
) => <String, dynamic>{
  'task_id': instance.taskId,
  'author_id': instance.authorId,
  'body': instance.body,
};
