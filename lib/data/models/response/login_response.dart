import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskflow/data/models/user_model.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'access_token_expires_in_seconds')
    required int accessTokenExpiresInSeconds,
    @JsonKey(name: 'refresh_token_expires_in_seconds')
    required int refreshTokenExpiresInSeconds,
    required User user,
    @JsonKey(name: 'org_id') required String orgId,
    required String role,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
