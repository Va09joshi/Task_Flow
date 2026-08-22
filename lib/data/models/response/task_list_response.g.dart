// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskListResponse _$TaskListResponseFromJson(Map<String, dynamic> json) =>
    _TaskListResponse(
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TaskListResponseToJson(_TaskListResponse instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
      'totalCount': instance.totalCount,
    };
