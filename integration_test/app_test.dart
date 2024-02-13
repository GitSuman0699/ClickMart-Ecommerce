import 'package:firebase_project/SignUp/sign_up.dart';
import 'package:firebase_project/login/phone_screen.dart';
import 'package:firebase_project/login/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firebase_project/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('correct number and otp', () {
    testWidgets('verify login with correct number and otp',
        (widgetTester) async {
      app.main();

      // expect(find.byType(Login), findsOneWidget);

      await widgetTester
          .pumpAndSettle(); // ensure every frame of widget is loaded
      await widgetTester.tap(find.byType(ElevatedButton));
      await widgetTester.pumpAndSettle();

      expect(find.byType(Login), findsOneWidget);
      await widgetTester.enterText(
          find.byType(FormBuilderTextField), '9898989898');
      await widgetTester.tap(find.byType(ElevatedButton));
      await widgetTester.pumpAndSettle();

      expect(find.byType(Verification), findsOneWidget);
      await widgetTester.enterText(find.byType(FormBuilderTextField), '654321');
      await widgetTester.tap(find.byType(ElevatedButton));
      await widgetTester.pumpAndSettle();

      expect(find.byType(SignUp), findsOneWidget);
    });
  });
}
