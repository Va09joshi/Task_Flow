// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: json['id'] as String,
  projectId: json['project_id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  status: json['status'] as String,
  priority: json['priority'] as String,
  assigneeId: json['assignee_id'] as String?,
  dueDate: json['due_date'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'project_id': instance.projectId,
  'title': instance.title,
  'description': instance.description,
  'status': instance.status,
  'priority': instance.priority,
  'assignee_id': instance.assigneeId,
  'due_date': instance.dueDate,
  'created_at': instance.createdAt.toIso8601String(),
};
