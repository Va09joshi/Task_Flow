import 'package:taskflow/data/models/auth_model.dart';
import 'package:taskflow/data/models/user_model.dart';

abstract class AuthRepository {
  Future<(AuthResponse, User, String role, String orgId)> login(
    String email,
    String password,
  );
  Future<void> register(String name, String email, String password);
  Future<void> logout();
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> saveTokens(String accessToken, String refreshToken);
  Future<void> clearTokens();
  Future<void> saveSessionMetadata(String userId, String orgId, String role);
  Future<Map<String, String>?> getSessionMetadata();
  Future<void> clearSessionMetadata();
  Future<User?> getCurrentUser(String userId);
}
