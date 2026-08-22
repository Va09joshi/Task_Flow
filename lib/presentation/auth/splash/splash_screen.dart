import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskflow/presentation/auth/auth_notifier.dart';
import 'package:taskflow/core/providers.dart';

import 'package:local_auth/local_auth.dart';
import '../auth_state.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  String? _errorMsg;
  bool _biometricPrompted = false;

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    try {
      debugPrint('SplashScreen: Starting initialization...');
      // Wait for MockDataSource to load
      await ref.read(mockDataSourceProvider).init();
      debugPrint('SplashScreen: MockDataSource initialized.');
      
      // Check session
      await ref.read(authNotifierProvider.notifier).checkSession();
      debugPrint('SplashScreen: Session check complete.');
    } catch (e, st) {
      debugPrint('SplashScreen Error: $e\n$st');
      if (mounted) {
        setState(() {
          _errorMsg = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    
    void handleNavigation(AuthState state) async {
      if (!mounted) return;
      switch (state) {
        case AuthStateAuthenticated():
          if (_biometricPrompted) return;
          _biometricPrompted = true;
          final LocalAuthentication auth = LocalAuthentication();
          try {
            final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
            final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();
            if (canAuthenticate) {
              final bool didAuthenticate = await auth.authenticate(
                localizedReason: 'Please authenticate to access TaskFlow',
              );
              if (didAuthenticate) {
                if (mounted) context.go('/home');
              } else {
                ref.read(authNotifierProvider.notifier).logout();
              }
            } else {
              if (mounted) context.go('/home');
            }
          } catch (e, st) {
            debugPrint('Biometrics Error: $e\n$st');
            // Biometrics error or missing permissions on emulator
            if (mounted) context.go('/home');
          }
          break;
        case AuthStateUnauthenticated():
        case AuthStateError():
          debugPrint('SplashScreen: Navigating to /login');
          context.go('/login');
          break;
        default:
          break;
      }
    }

    ref.listen(authNotifierProvider, (previous, next) {
      handleNavigation(next);
    });

    // Check current state in case the transition happened before listen was registered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      handleNavigation(authState);
    });

    return Scaffold(
      body: Center(
        child: _errorMsg != null 
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Error: $_errorMsg\n\nPlease restart the app.', style: const TextStyle(color: Colors.red)),
            )
          : const CircularProgressIndicator(),
      ),
    );
  }
}

