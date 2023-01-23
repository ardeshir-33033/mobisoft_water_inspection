import 'package:flutter_test/flutter_test.dart';

Future<void> iTapTextAndWait(WidgetTester tester, String param1) async {
  await tester.tap(find.text(param1));
  // await tester.pumpAndSettle();

  // await tester.pump();
  await Future.delayed(const Duration(seconds: 1), () {
    return;
  });
  // await tester.pumpAndSettle();
}
