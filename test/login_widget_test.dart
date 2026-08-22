import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskflow/presentation/auth/login/login_screen.dart';
import 'package:taskflow/core/providers.dart';

void main() {
  testWidgets('LoginScreen validation errors when empty', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
        child: const MaterialApp(
          home: LoginScreen(),
        ),
      ),
    );

    // Find the login button and tap it
    final loginButton = find.text('Login');
    expect(loginButton, findsOneWidget);

    await tester.tap(loginButton);
    await tester.pump(const Duration(milliseconds: 500)); // Wait for error text animation

    // Expect to see validation errors
    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
  });
}
