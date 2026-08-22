import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskflow/presentation/auth/login/login_screen.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
import 'package:taskflow/core/providers.dart';
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
    final loginButton = find.text('Log In');
    expect(loginButton, findsOneWidget);

    await tester.tap(loginButton);
    await tester.pumpAndSettle(); // Wait for validation and SnackBar

    // Expect to see the "Please fill in all fields" toast (since validation fails)
    expect(find.text('Please fill in all fields'), findsOneWidget);
  });
}
