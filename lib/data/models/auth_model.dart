import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
abstract class AuthCredentials with _$AuthCredentials {
  const factory AuthCredentials({
    required String email,
    required String password,
    @JsonKey(name: 'org_id') required String orgId,
    required String role,
  }) = _AuthCredentials;

  factory AuthCredentials.fromJson(Map<String, dynamic> json) =>
      _$AuthCredentialsFromJson(json);
}

@freezed
abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'access_token_expires_in_seconds')
    required int accessTokenExpiresInSeconds,
    @JsonKey(name: 'refresh_token_expires_in_seconds')
    required int refreshTokenExpiresInSeconds,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
abstract class AuthMockData with _$AuthMockData {
  const factory AuthMockData({
    @JsonKey(name: 'test_credentials')
    required List<AuthCredentials> testCredentials,
    @JsonKey(name: 'mock_login_response')
    required AuthResponse mockLoginResponse,
  }) = _AuthMockData;

  factory AuthMockData.fromJson(Map<String, dynamic> json) =>
      _$AuthMockDataFromJson(json);
}
