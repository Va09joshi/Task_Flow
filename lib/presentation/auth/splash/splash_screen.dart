import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskflow/presentation/auth/auth_notifier.dart';
import 'package:taskflow/core/providers.dart';

import 'package:local_auth/local_auth.dart';
import '../auth_state.dart';
import 'package:taskflow/core/utils/toast_service.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  String? _errorMsg;
  bool _biometricPrompted = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
    _animationController.forward();
    _initApp();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
            final bool canAuthenticateWithBiometrics =
                await auth.canCheckBiometrics;
            final bool canAuthenticate =
                canAuthenticateWithBiometrics || await auth.isDeviceSupported();
            if (canAuthenticate) {
              final bool didAuthenticate = await auth.authenticate(
                localizedReason: 'Please authenticate to access TaskFlow',
                useErrorDialogs: true,
                stickyAuth: true,
                biometricOnly: false,
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
            if (mounted) {
              ToastService.showError(
                context,
                'Biometrics unavailable or canceled.',
              );
              context.go('/home');
            }
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
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF450C3F),
              Color(0xFF2A0726), // Darker shade for gradient depth
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: _errorMsg != null
              ? Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'Error: $_errorMsg\n\nPlease restart the app.',
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 30,
                                offset: const Offset(0, 15),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.check_circle_outline,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          'TaskFlow',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Manage your work seamlessly',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.8),
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 64),
                        const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                          strokeWidth: 3,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
