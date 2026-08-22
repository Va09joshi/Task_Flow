// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateTaskRequest _$UpdateTaskRequestFromJson(Map<String, dynamic> json) =>
    _UpdateTaskRequest(
      id: json['id'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      priority: json['priority'] as String?,
      assigneeId: json['assignee_id'] as String?,
      dueDate: json['due_date'] as String?,
    );

Map<String, dynamic> _$UpdateTaskRequestToJson(_UpdateTaskRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'priority': instance.priority,
      'assignee_id': instance.assigneeId,
      'due_date': instance.dueDate,
    };
