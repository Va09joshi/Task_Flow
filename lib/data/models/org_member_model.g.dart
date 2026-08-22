// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrgMember _$OrgMemberFromJson(Map<String, dynamic> json) => _OrgMember(
  orgId: json['org_id'] as String,
  userId: json['user_id'] as String,
  role: json['role'] as String,
);

Map<String, dynamic> _$OrgMemberToJson(_OrgMember instance) =>
    <String, dynamic>{
      'org_id': instance.orgId,
      'user_id': instance.userId,
      'role': instance.role,
    };
