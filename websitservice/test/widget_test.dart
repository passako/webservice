// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:websitservice/main.dart';

void main() {
  testWidgets('Home buttons open login and register pages', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('ยินดีต้อนรับ'), findsOneWidget);
    expect(find.byKey(const Key('loginButton')), findsOneWidget);
    expect(find.byKey(const Key('registerButton')), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('homeEmailField')),
      'hello@example.com',
    );
    await tester.ensureVisible(find.byKey(const Key('loginButton')));
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();
    expect(find.text('กลับมายินดีต้อนรับ'), findsOneWidget);
    expect(
      tester
          .widget<TextFormField>(find.byKey(const Key('loginEmailField')))
          .initialValue,
      'hello@example.com',
    );

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('registerButton')));
    await tester.tap(find.byKey(const Key('registerButton')));
    await tester.pumpAndSettle();
    expect(find.text('สร้างบัญชีใหม่'), findsOneWidget);
    expect(
      tester
          .widget<TextFormField>(find.byKey(const Key('registerEmailField')))
          .initialValue,
      'hello@example.com',
    );
  });
}
