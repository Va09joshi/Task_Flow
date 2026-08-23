import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/domain/repositories/auth_repository.dart';
import 'package:taskflow/domain/repositories/user_repository.dart';
import 'package:taskflow/presentation/auth/auth_state.dart';
import 'package:taskflow/data/models/user_model.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  Timer? _tokenRefreshTimer;

  AuthNotifier(this._authRepository, this._userRepository)
    : super(const AuthState.loading());

  Future<void> checkSession() async {
    state = const AuthState.loading();
    try {
      final token = await _authRepository.getAccessToken();
      if (token == null) {
        state = const AuthState.unauthenticated();
        return;
      }

      final metadata = await _authRepository.getSessionMetadata();
      if (metadata != null) {
        final userId = metadata['user_id']!;
        final user = await _userRepository.getUser(userId);
        if (user != null) {
          state = AuthState.authenticated(
            user: user,
            orgId: metadata['org_id']!,
            role: metadata['role']!,
          );
          _startTokenRefreshTimer();
          return;
        }
      }

      state = const AuthState.unauthenticated();
    } catch (e) {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    try {
      final (response, user, role, orgId) = await _authRepository.login(
        email,
        password,
      );
      await _authRepository.saveTokens(
        response.accessToken,
        response.refreshToken,
      );
      await _authRepository.saveSessionMetadata(user.id, orgId, role);

      state = AuthState.authenticated(user: user, orgId: orgId, role: role);
      _startTokenRefreshTimer();
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  void _startTokenRefreshTimer() {
    _tokenRefreshTimer?.cancel();
    // Simulate 15 min expiration by refreshing before it expires.
    // For the assignment, we can refresh every 14 minutes.
    _tokenRefreshTimer = Timer.periodic(const Duration(minutes: 14), (_) async {
      // Mock refresh token logic. In a real app we hit the endpoint.
      // Here we just write new mock tokens.
      await _authRepository.saveTokens(
        'mock.access.token.new',
        'mock.refresh.token.new',
      );
    });
  }

  Future<void> logout() async {
    _tokenRefreshTimer?.cancel();
    await _authRepository.logout();
    state = const AuthState.unauthenticated();
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((
  ref,
) {
  return AuthNotifier(
    ref.watch(authRepositoryProvider),
    ref.watch(userRepositoryProvider),
  );
});

final currentUserProvider = Provider<User?>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return switch (authState) {
    AuthStateAuthenticated(user: final user) => user,
    _ => null,
  };
});

final currentOrgIdProvider = Provider<String?>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return switch (authState) {
    AuthStateAuthenticated(orgId: final orgId) => orgId,
    _ => null,
  };
});

final currentUserRoleProvider = Provider<String?>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return switch (authState) {
    AuthStateAuthenticated(role: final role) => role,
    _ => null,
  };
});

final isAdminProvider = Provider<bool>((ref) {
  return ref.watch(currentUserRoleProvider) == 'org_admin';
});
