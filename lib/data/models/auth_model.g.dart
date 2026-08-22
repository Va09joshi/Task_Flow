// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthCredentials _$AuthCredentialsFromJson(Map<String, dynamic> json) =>
    _AuthCredentials(
      email: json['email'] as String,
      password: json['password'] as String,
      orgId: json['org_id'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$AuthCredentialsToJson(_AuthCredentials instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'org_id': instance.orgId,
      'role': instance.role,
    };

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      accessTokenExpiresInSeconds:
          (json['access_token_expires_in_seconds'] as num).toInt(),
      refreshTokenExpiresInSeconds:
          (json['refresh_token_expires_in_seconds'] as num).toInt(),
    );

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'access_token_expires_in_seconds': instance.accessTokenExpiresInSeconds,
      'refresh_token_expires_in_seconds': instance.refreshTokenExpiresInSeconds,
    };

_AuthMockData _$AuthMockDataFromJson(Map<String, dynamic> json) =>
    _AuthMockData(
      testCredentials: (json['test_credentials'] as List<dynamic>)
          .map((e) => AuthCredentials.fromJson(e as Map<String, dynamic>))
          .toList(),
      mockLoginResponse: AuthResponse.fromJson(
        json['mock_login_response'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$AuthMockDataToJson(_AuthMockData instance) =>
    <String, dynamic>{
      'test_credentials': instance.testCredentials,
      'mock_login_response': instance.mockLoginResponse,
    };
