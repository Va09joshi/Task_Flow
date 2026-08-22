import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskflow/data/datasources/mock_data_source.dart';
import 'package:taskflow/data/models/auth_model.dart';
import 'package:taskflow/data/models/user_model.dart';
import 'package:taskflow/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final MockDataSource dataSource;
  final SharedPreferences sharedPrefs;
  final FlutterSecureStorage secureStorage;

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  AuthRepositoryImpl(this.dataSource, this.sharedPrefs, this.secureStorage);

  @override
  Future<(AuthResponse, User, String role, String orgId)> login(String email, String password) async {
    final response = await dataSource.login(email, password);
    final user = dataSource.users.firstWhere((u) => u.email == email, orElse: () => throw Exception('User not found'));
    final creds = dataSource.authMock!.testCredentials.firstWhere((c) => c.email == email);
    
    return (response, user, creds.role, creds.orgId);
  }

  @override
  Future<void> logout() async {
    await clearTokens();
  }

  @override
  Future<String?> getAccessToken() async {
    return await secureStorage.read(key: _accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await secureStorage.read(key: _refreshTokenKey);
  }

  @override
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await secureStorage.write(key: _accessTokenKey, value: accessToken);
    await secureStorage.write(key: _refreshTokenKey, value: refreshToken);
  }

  @override
  Future<void> clearTokens() async {
    await secureStorage.delete(key: _accessTokenKey);
    await secureStorage.delete(key: _refreshTokenKey);
  }

  @override
  Future<void> saveSessionMetadata(String userId, String orgId, String role) async {
    await sharedPrefs.setString('user_id', userId);
    await sharedPrefs.setString('org_id', orgId);
    await sharedPrefs.setString('role', role);
  }

  @override
  Future<Map<String, String>?> getSessionMetadata() async {
    final userId = sharedPrefs.getString('user_id');
    final orgId = sharedPrefs.getString('org_id');
    final role = sharedPrefs.getString('role');
    if (userId != null && orgId != null && role != null) {
      return {'user_id': userId, 'org_id': orgId, 'role': role};
    }
    return null;
  }

  @override
  Future<void> clearSessionMetadata() async {
    await sharedPrefs.remove('user_id');
    await sharedPrefs.remove('org_id');
    await sharedPrefs.remove('role');
  }

  @override
  Future<User?> getCurrentUser(String userId) async {
    return dataSource.getUser(userId);
  }
}
