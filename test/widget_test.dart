import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_like/main.dart';

void main() {
  testWidgets('App starts with splash screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(NubankApp());

    // Verify that the splash screen is displayed
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
