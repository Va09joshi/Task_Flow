import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow/data/models/auth_model.dart';
import 'package:taskflow/data/models/user_model.dart';
import 'package:taskflow/domain/repositories/auth_repository.dart';
import 'package:taskflow/presentation/auth/auth_notifier.dart';
import 'package:taskflow/presentation/auth/auth_state.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:taskflow/domain/repositories/user_repository.dart';

import 'auth_test.mocks.dart';

@GenerateMocks([AuthRepository, UserRepository])
void main() {
  late MockAuthRepository mockAuthRepo;
  late MockUserRepository mockUserRepo;
  late AuthNotifier authNotifier;

  setUp(() {
    mockAuthRepo = MockAuthRepository();
    mockUserRepo = MockUserRepository();
    authNotifier = AuthNotifier(mockAuthRepo, mockUserRepo);
  });

  test(
    'initial state is unauthenticated after checkSession with no token',
    () async {
      when(mockAuthRepo.getAccessToken()).thenAnswer((_) async => null);

      await authNotifier.checkSession();

      expect(authNotifier.state, const AuthState.unauthenticated());
    },
  );

  test('login success sets authenticated state', () async {
    const user = User(
      id: '1',
      name: 'Test',
      email: 'test@test.com',
      avatarUrl: '',
    );
    const authResponse = AuthResponse(
      accessToken: 'acc',
      refreshToken: 'ref',
      accessTokenExpiresInSeconds: 900,
      refreshTokenExpiresInSeconds: 604800,
    );

    when(
      mockAuthRepo.login('test@test.com', 'password'),
    ).thenAnswer((_) async => (authResponse, user, 'org_admin', 'org1'));

    when(mockAuthRepo.saveTokens('acc', 'ref')).thenAnswer((_) async => {});
    when(
      mockAuthRepo.saveSessionMetadata('1', 'org1', 'org_admin'),
    ).thenAnswer((_) async => {});

    await authNotifier.login('test@test.com', 'password');

    expect(
      authNotifier.state,
      const AuthState.authenticated(
        user: user,
        orgId: 'org1',
        role: 'org_admin',
      ),
    );
  });
}
