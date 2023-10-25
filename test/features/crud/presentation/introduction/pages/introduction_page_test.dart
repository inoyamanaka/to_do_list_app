import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:to_do_list_app/features/auth/presentation/pages/intorduction_page.dart';
// Gantilah 'your_app_name' dengan nama paket aplikasi Anda

void main() {
  testWidgets('IntroductionPage widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: IntroductionPage(),
      ),
    );

    // Verify that IntroductionScreen is displayed.
    expect(find.byType(IntroductionScreen), findsOneWidget);

    // You can add more test cases to check other widgets and interactions.
  });
}
