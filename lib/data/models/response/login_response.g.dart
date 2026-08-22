// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      accessTokenExpiresInSeconds:
          (json['access_token_expires_in_seconds'] as num).toInt(),
      refreshTokenExpiresInSeconds:
          (json['refresh_token_expires_in_seconds'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      orgId: json['org_id'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'access_token_expires_in_seconds': instance.accessTokenExpiresInSeconds,
      'refresh_token_expires_in_seconds': instance.refreshTokenExpiresInSeconds,
      'user': instance.user,
      'org_id': instance.orgId,
      'role': instance.role,
    };
