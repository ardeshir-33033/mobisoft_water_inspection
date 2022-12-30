import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/button/login_button.dart';
import '../../../../core/types/login_type_enum.dart';
import '../manager/login_approach_cubit.dart';
import '../manager/login_approach_state.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: const [
                Center(child: CircularProgressIndicator())]);
        } else if (state is LoginApproachSuccess) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                InkWell(
                    onTap: () {
                      loginApproach = LoginType.guest;
                      setState(() {});
                    },
                    child: ApproachWidget(
                      childWidget: const Icon(Icons.account_circle),
                      chosen: loginApproach == LoginType.guest,
                    )),
                InkWell(
                    onTap: () {
                      loginApproach = LoginType.phoneNumber;
                      setState(() {});
                    },
                    child: ApproachWidget(
                        childWidget: const Icon(Icons.sms),
                        chosen: loginApproach == LoginType.phoneNumber)),
              ]),
              SizedBox(height: MediaQuery.of(context).size.height / 5),
              LoginButton(
                onTap: () async{
                  if(loginApproach == LoginType.guest){
                    await _getId();
                    bool? response = await context.read<LoginApproachCubit>().loginViaDeviceId(deviceId);
                    debugPrint("Response to Login: $response");
                    if(response ?? true){
                      Navigator.pushNamedAndRemoveUntil(context, "/testPage", (route) => false);
                    }
                  }else{
                    Navigator.pushNamed(context, "/addPhoneNumberPage");
                  }


                },
                title: "Continue",
              ),
            ],
          );
        }else{
         return  Container();
        }
      }),
    );
  }

  Future<String> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    var deviceId = "";

    if (Platform.isAndroid) {
      var build = await deviceInfo.androidInfo;
      deviceId = build.id;
    } else if (Platform.isIOS) {
      var data = await deviceInfo.iosInfo;
      deviceId = data.identifierForVendor!;
    }
    return deviceId;
  }
}
