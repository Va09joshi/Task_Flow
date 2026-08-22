import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:taskflow/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App start, login, and verify project list', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify we are on login screen
    expect(find.text('Welcome to TaskFlow'), findsOneWidget);

    // Enter mock credentials
    await tester.enterText(find.byType(TextFormField).first, 'ava.admin@nimbusdigital.test');
    await tester.enterText(find.byType(TextFormField).last, 'Password123!');

    // Tap login
    await tester.tap(find.text('Log In'));
    await tester.pumpAndSettle(const Duration(seconds: 1)); // Wait for async auth mock

    // Verify we reached the home/dashboard or project list
    expect(find.text('Projects'), findsOneWidget);
  });
}
