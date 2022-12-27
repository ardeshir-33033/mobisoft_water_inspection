import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobisoft_inspection/features/registeration/presentation/pages/choose_login_approach_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (final BuildContext context, final Widget? child) => MaterialApp(
        title: 'MobiSoft_Inspection',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/choose_login_approach_page": (context) =>
              const ChoosingLoginApproachPage()
        },
        home: const ChoosingLoginApproachPage(),
      ),
    );
  }
}
