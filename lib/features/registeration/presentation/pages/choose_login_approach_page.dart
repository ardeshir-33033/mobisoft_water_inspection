import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobisoft_inspection/core/components/animations/custom-loading-animation.dart';
import '../../../../core/components/button/login_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/types/login_type_enum.dart';
import '../../../../locator.dart';
import '../manager/login_approach/login_approach_cubit.dart';
import '../manager/login_approach/login_approach_state.dart';
import '../widgets/approach_widget.dart';

class ChoosingLoginApproachPage extends StatefulWidget {
  const ChoosingLoginApproachPage({Key? key}) : super(key: key);

  @override
  State<ChoosingLoginApproachPage> createState() =>
      _ChoosingLoginApproachPageState();
}

class _ChoosingLoginApproachPageState extends State<ChoosingLoginApproachPage> {
  LoginType loginApproach = LoginType.guest;
  late String deviceId;

  final LoginApproachCubit locationCubit = locator<LoginApproachCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: BlocConsumer<LoginApproachCubit, LoginApproachState>(
          listener: (context, state) {
        if (state is LoginApproachError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      }, builder: (context, state) {
        if (state is LoginApproachPending) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [Center(child: CustomLoadingAnimation())]);
        } else if (state is LoginApproachSuccess) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  loginApproach = LoginType.guest;
                                  setState(() {});
                                },
                                child: ApproachWidget(
                                  icon: Icons.account_circle,
                                  title: 'Guest',
                                  chosen: loginApproach == LoginType.guest,
                                )),
                            InkWell(
                                onTap: () {
                                  loginApproach = LoginType.phoneNumber;
                                  setState(() {});
                                },
                                child: ApproachWidget(
                                    icon: Icons.sms,
                                    title: 'SMS',
                                    chosen: loginApproach ==
                                        LoginType.phoneNumber)),
                          ]),
                    ],
                  ),
                ),
              ),
              CustomRegisterButton(
                active: true,
                onTap: () async {
                  if (loginApproach == LoginType.guest) {
                    await _getId();
                    bool? response =
                        await locationCubit.loginViaDeviceId(deviceId);
                    debugPrint("Response to Login: $response");
                    if (response ?? true) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/locationsPage", (route) => false);
                    }
                  } else {
                    Navigator.pushNamed(context, "/addPhoneNumberPage");
                  }
                },
                title: "Continue",
              ),
              SizedBox(height: 20.h),
            ],
          );
        } else {
          return Container();
        }
      }),
    );
  }

  Future<void> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    var device = "";

    if (Platform.isAndroid) {
      var build = await deviceInfo.androidInfo;
      device = build.id;
    } else if (Platform.isIOS) {
      var data = await deviceInfo.iosInfo;
      device = data.identifierForVendor!;
    }
    deviceId = device;
  }
}
