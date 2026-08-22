// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectListResponse _$ProjectListResponseFromJson(Map<String, dynamic> json) =>
    _ProjectListResponse(
      projects: (json['projects'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ProjectListResponseToJson(
  _ProjectListResponse instance,
) => <String, dynamic>{
  'projects': instance.projects,
  'totalCount': instance.totalCount,
};
