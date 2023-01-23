// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobisoft_inspection/core/theme/app_theme.dart';
import 'package:mobisoft_inspection/features/locations/presentation/manager/add_location_cubit/add_location_cubit.dart';
import 'package:mobisoft_inspection/features/locations/presentation/manager/location_cubit.dart';
import 'package:mobisoft_inspection/features/locations/presentation/pages/add_new_location_page.dart';
import 'package:mobisoft_inspection/features/registeration/presentation/pages/add_phoneNumber_page.dart';

import 'features/locations/presentation/pages/locations_page.dart';
import 'features/registeration/presentation/manager/login_approach/login_approach_cubit.dart';
import 'features/registeration/presentation/manager/sms_login_cubit.dart';
import 'features/registeration/presentation/pages/choose_login_approach_page.dart';
import 'features/video/presentation/pages/test_page.dart';
import 'locator.dart';

/// CameraApp is the Main Application.
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        routes: {
          '/': (context) => MultiBlocProvider(
                providers: [
                  BlocProvider<LocationCubit>.value(
                    value: locator<LocationCubit>(),
                  ),
                  BlocProvider<LoginApproachCubit>.value(
                    value: locator<LoginApproachCubit>(),
                  )
                ],
                child: const ChoosingLoginApproachPage(),
              ),
          '/addPhoneNumberPage': (context) => MultiBlocProvider(
                providers: [
                  BlocProvider<SmsLoginCubit>.value(
                    value: locator<SmsLoginCubit>(),
                  ),
                ],
                child: AddPhoneNumberPage(),
              ),
          '/locationsPage': (context) => MultiBlocProvider(
                providers: [
                  BlocProvider<LocationCubit>.value(
                    value: locator<LocationCubit>(),
                  ),
                ],
                child: const LocationsPage(),
              ),
          '/addLocations': (context) => MultiBlocProvider(
                providers: [
                  BlocProvider<AddLocationCubit>.value(
                    value: locator<AddLocationCubit>(),
                  ),
                ],
                child: const AddNewLocationPage(),
              ),
          '/test': (context) => const TestPage(),
        },
        theme: AppThemes().lightTheme,
        darkTheme: AppThemes().darkTheme,
        // CameraExampleHome(),
      ),
    );
  }
}

Future<void> main() async {
  setup();
  runApp(const MainApp());
}
