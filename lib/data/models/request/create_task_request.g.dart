// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTaskRequest _$CreateTaskRequestFromJson(Map<String, dynamic> json) =>
    _CreateTaskRequest(
      title: json['title'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      priority: json['priority'] as String,
      projectId: json['project_id'] as String,
      assigneeId: json['assignee_id'] as String?,
      dueDate: json['due_date'] as String?,
    );

Map<String, dynamic> _$CreateTaskRequestToJson(_CreateTaskRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'priority': instance.priority,
      'project_id': instance.projectId,
      'assignee_id': instance.assigneeId,
      'due_date': instance.dueDate,
    };
