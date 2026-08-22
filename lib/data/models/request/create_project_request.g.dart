// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_project_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateProjectRequest _$CreateProjectRequestFromJson(
  Map<String, dynamic> json,
) => _CreateProjectRequest(
  name: json['name'] as String,
  description: json['description'] as String,
  orgId: json['org_id'] as String,
  status: json['status'] as String? ?? 'active',
);

Map<String, dynamic> _$CreateProjectRequestToJson(
  _CreateProjectRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'org_id': instance.orgId,
  'status': instance.status,
};
