import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talk/login_view.dart';

void main() {
  group('LoginView Tests', () {
    testWidgets('Login form validation', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginView()));
      await tester.enterText(find.byKey(const Key('fieldEmail')), 'valid_email@example.com');
      expect(find.text('valid_email@example.com'), findsOneWidget);
      await tester.enterText(find.byKey(const Key('fieldEmail')), 'invalid_email');
      expect(find.text('invalid_email'), findsOneWidget);
      await tester.enterText(find.byKey(const Key('fieldPhone')), 'non_numeric');
      await tester.pump(); // Добавляем pump после ввода
      expect(find.text('non_numeric'), findsOneWidget);
      await tester.enterText(find.byKey(const Key('fieldPhone')), '1234567890');
      await tester.pump(); // Добавляем pump после ввода
      expect(find.text('1234567890'), findsOneWidget);
      await tester.tap(find.text('Submit'));
      await tester.pump();
      expect(find.text('Добро пожаловать'), findsOneWidget);
      await tester.pumpAndSettle();
    });

    //Тут интеграционный тест

    testWidgets('Registration form validation', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginView()));
      await tester.tap(find.text('Switch to Registration'));
      await tester.pump();
      await tester.enterText(find.byKey(const Key('fieldFirstName')), 'John');
      await tester.enterText(find.byKey(const Key('fieldLastName')), 'Doe');
      await tester.pump(); // Добавляем pump после ввода
      expect(find.text('John'), findsOneWidget);
      expect(find.text('Doe'), findsOneWidget);
      await tester.enterText(find.byKey(const Key('fieldPhone')), 'non_numeric');
      await tester.pump(); // Добавляем pump после ввода
      expect(find.text('non_numeric'), findsOneWidget);
      await tester.enterText(find.byKey(const Key('fieldPhone')), '1234567890');
      await tester.pump(); // Добавляем pump после ввода
      expect(find.text('1234567890'), findsOneWidget);
      await tester.tap(find.text('Submit'));
      await tester.pump();
      expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
      await tester.pumpAndSettle();
    });
  });
}