// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobisoft_inspection/locator.dart';

import './step/the_app_is_running.dart';
import './step/i_see_text.dart';
import './step/i_tap_icon.dart';
import './step/i_tap_text_and_wait.dart';

void main() {
  setup();

  group('''LoginApproach''', () {
    testWidgets('''Test Login Approach''', (tester) async {
      await tester.runAsync(() async {

        await theAppIsRunning(tester);
        await iSeeText(tester, "Guest");
        await iSeeText(tester, "SMS");
        await iTapIcon(tester, Icons.account_circle);
        // await iTapTextAndWait(tester, "Continue");
        // await iSeeText(tester, "Locations");
      });

    });
  });
}
