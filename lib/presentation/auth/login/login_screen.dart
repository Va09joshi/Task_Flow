import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskflow/presentation/auth/auth_notifier.dart';
import 'package:taskflow/presentation/auth/auth_state.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/presentation/widgets/custom_text_field.dart';
import 'package:taskflow/presentation/widgets/custom_button.dart';
import 'package:taskflow/presentation/widgets/custom_app_bar.dart';
import 'package:taskflow/core/utils/toast_service.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    final prefs = ref.read(sharedPreferencesProvider);
    final savedEmail = prefs.getString('remembered_email');
    if (savedEmail != null && savedEmail.isNotEmpty) {
      _emailController.text = savedEmail;
      _rememberMe = true;
    }
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final prefs = ref.read(sharedPreferencesProvider);

      if (_rememberMe) {
        prefs.setString('remembered_email', email);
      } else {
        prefs.remove('remembered_email');
      }

      ref
          .read(authNotifierProvider.notifier)
          .login(email, _passwordController.text);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    ref.listen(authNotifierProvider, (previous, next) {
      switch (next) {
        case AuthStateAuthenticated():
          context.go('/home');
          break;
        case AuthStateError(message: final msg):
          ToastService.showError(context, msg);
          break;
        default:
          break;
      }
    });

    final isLoading = switch (authState) {
      AuthStateLoading() => true,
      _ => false,
    };

    return Scaffold(
      appBar: const CustomAppBar(title: 'Login'),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'TaskFlow',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                CustomTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Email is required';
                    if (!value.contains('@')) return 'Invalid email format';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Password is required';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (val) {
                        setState(() => _rememberMe = val ?? false);
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                    const Text('Remember me'),
                  ],
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Login',
                  isLoading: isLoading,
                  onPressed: _login,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => context.push('/register'),
                  child: const Text('Don\'t have an account? Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
