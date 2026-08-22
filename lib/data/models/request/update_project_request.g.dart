// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_project_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateProjectRequest _$UpdateProjectRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateProjectRequest(
  id: json['id'] as String,
  name: json['name'] as String?,
  description: json['description'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$UpdateProjectRequestToJson(
  _UpdateProjectRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'status': instance.status,
};
