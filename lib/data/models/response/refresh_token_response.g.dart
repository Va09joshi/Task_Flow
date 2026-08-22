// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefreshTokenResponse _$RefreshTokenResponseFromJson(
  Map<String, dynamic> json,
) => _RefreshTokenResponse(
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  accessTokenExpiresInSeconds: (json['access_token_expires_in_seconds'] as num)
      .toInt(),
);

Map<String, dynamic> _$RefreshTokenResponseToJson(
  _RefreshTokenResponse instance,
) => <String, dynamic>{
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
  'access_token_expires_in_seconds': instance.accessTokenExpiresInSeconds,
};
