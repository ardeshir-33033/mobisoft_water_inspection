import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobisoft_inspection/core/components/button/login_button.dart';
import 'package:mobisoft_inspection/features/registeration/presentation/manager/sms_login_cubit.dart';
import 'package:mobisoft_inspection/features/registeration/presentation/widgets/phone_number_tab.dart';
import 'package:mobisoft_inspection/features/registeration/presentation/widgets/sms_tab.dart';

import '../../../../core/components/animations/custom-loading-animation.dart';

class AddPhoneNumberPage extends StatefulWidget {
  const AddPhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<AddPhoneNumberPage> createState() => _AddPhoneNumberPageState();
}

class _AddPhoneNumberPageState extends State<AddPhoneNumberPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late SmsLoginCubit smsLoginCubit;
  bool isButtonActive = false;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    smsLoginCubit = context.read<SmsLoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SmsLoginCubit, SmsLoginState>(
        listener: (context, state) {
          if (state is SmsLoginError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is SmsLoginPending) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [Center(child: CustomLoadingAnimation())]);
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  // height: 300.h,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      PhoneNumberTab(
                        smsLoginCubit: smsLoginCubit,
                      ),
                      SmsTab(
                        smsLoginCubit: smsLoginCubit,
                      )
                    ],
                  ),
                ),
                CustomRegisterButton(
                    title: "Continue",
                    active: activateButton(),
                    onTap: () async {
                      if (tabController.index == 0) {
                        await smsLoginCubit.validatePhoneNumber(
                            smsLoginCubit.phoneNumberController.text,
                            smsLoginCubit.isoCode);
                        if (true) {
                          smsLoginCubit.sendSmsCode();
                          tabController.animateTo(1);
                        }
                      } else {
                        await smsLoginCubit.verifyCode();
                        if (!mounted) return;
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/locationsPage", (route) => false);
                      }
                    }),
                SizedBox(height: 20.h),
              ],
            );
          }
        },
      ),
    );
  }

  bool activateButton() {
    if (tabController.index == 0) {
      isButtonActive = smsLoginCubit.phoneNumberController.text != "";
      return isButtonActive;
    } else {
      if ((smsLoginCubit.smsNumberController4.text.length == 1 &&
          smsLoginCubit.smsNumberController1.text.length == 1 &&
          smsLoginCubit.smsNumberController2.text.length == 1 &&
          smsLoginCubit.smsNumberController3.text.length == 1)) {
        isButtonActive = true;
        return isButtonActive;
      } else {
        isButtonActive = false;
        return isButtonActive;
      }
    }
  }
}
