import 'package:flutter_test/flutter_test.dart';
import 'package:mobisoft_inspection/main.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(const MainApp());
}
