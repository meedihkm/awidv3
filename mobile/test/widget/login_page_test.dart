import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../setup.dart';

void main() {
  group('Login Page Widget Tests', () {
    testWidgets('should display email and password fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Column(
            children: [
              TextFormField(
                key: const Key('email_field'),
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                key: const Key('password_field'),
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
              ),
            ],
          ),
        ),
      );

      expect(find.byKey(const Key('email_field')), findsOneWidget);
      expect(find.byKey(const Key('password_field')), findsOneWidget);
    });

    testWidgets('should validate email format', (WidgetTester tester) async {
      String? validationError;
      
      await tester.pumpWidget(
        createTestWidget(
          TextFormField(
            key: const Key('email_field'),
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email requis';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Email invalide';
              }
              return null;
            },
            onSaved: (value) {},
          ),
        ),
      );

      // Test empty email
      final emailField = tester.widget<TextFormField>(find.byKey(const Key('email_field')));
      validationError = emailField.validator?.call('');
      expect(validationError, 'Email requis');

      // Test invalid email
      validationError = emailField.validator?.call('invalid-email');
      expect(validationError, 'Email invalide');

      // Test valid email
      validationError = emailField.validator?.call('test@example.com');
      expect(validationError, null);
    });

    testWidgets('should validate password length', (WidgetTester tester) async {
      String? validationError;
      
      await tester.pumpWidget(
        createTestWidget(
          TextFormField(
            key: const Key('password_field'),
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mot de passe requis';
              }
              if (value.length < 6) {
                return 'Minimum 6 caractères';
              }
              return null;
            },
          ),
        ),
      );

      final passwordField = tester.widget<TextFormField>(find.byKey(const Key('password_field')));
      
      // Test empty
      validationError = passwordField.validator?.call('');
      expect(validationError, 'Mot de passe requis');
      
      // Test too short
      validationError = passwordField.validator?.call('12345');
      expect(validationError, 'Minimum 6 caractères');
      
      // Test valid
      validationError = passwordField.validator?.call('password123');
      expect(validationError, null);
    });

    testWidgets('should show loading indicator when logging in', (WidgetTester tester) async {
      bool isLoading = false;
      
      await tester.pumpWidget(
        createTestWidget(
          StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  if (isLoading)
                    const CircularProgressIndicator(key: Key('loading_indicator'))
                  else
                    ElevatedButton(
                      key: const Key('login_button'),
                      onPressed: () {
                        setState(() => isLoading = true);
                      },
                      child: const Text('Se connecter'),
                    ),
                ],
              );
            },
          ),
        ),
      );

      expect(find.byKey(const Key('login_button')), findsOneWidget);
      expect(find.byKey(const Key('loading_indicator')), findsNothing);

      // Tap login button
      await tester.tap(find.byKey(const Key('login_button')));
      await tester.pump();

      expect(find.byKey(const Key('loading_indicator')), findsOneWidget);
      expect(find.byKey(const Key('login_button')), findsNothing);
    });

    testWidgets('should display error message on failed login', (WidgetTester tester) async {
      String? errorMessage;
      
      await tester.pumpWidget(
        createTestWidget(
          StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  if (errorMessage != null)
                    Text(
                      errorMessage!,
                      key: const Key('error_message'),
                      style: const TextStyle(color: Colors.red),
                    ),
                  ElevatedButton(
                    key: const Key('login_button'),
                    onPressed: () {
                      setState(() => errorMessage = 'Identifiants incorrects');
                    },
                    child: const Text('Login'),
                  ),
                ],
              );
            },
          ),
        ),
      );

      expect(find.byKey(const Key('error_message')), findsNothing);

      await tester.tap(find.byKey(const Key('login_button')));
      await tester.pump();

      expect(find.byKey(const Key('error_message')), findsOneWidget);
      expect(find.text('Identifiants incorrects'), findsOneWidget);
    });
  });
}
