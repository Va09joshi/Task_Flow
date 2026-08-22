import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskflow/data/models/user_model.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;
  const factory AuthState.authenticated({
    required User user,
    required String orgId,
    required String role,
  }) = AuthStateAuthenticated;
  const factory AuthState.error(String message) = AuthStateError;
}
