import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobisoft_inspection/core/components/textfields/custom_textfield.dart';
import 'package:mobisoft_inspection/features/registeration/presentation/manager/sms_login_cubit.dart';
import 'package:telephony/telephony.dart';

class SmsTab extends StatefulWidget {
  const SmsTab({Key? key, required this.smsLoginCubit}) : super(key: key);
  final SmsLoginCubit smsLoginCubit;

  @override
  State<SmsTab> createState() => _SmsTabState();
}

class _SmsTabState extends State<SmsTab> {
  final FocusNode smsNumberFocusNode1 = FocusNode();
  final FocusNode smsNumberFocusNode2 = FocusNode();
  final FocusNode smsNumberFocusNode3 = FocusNode();
  final FocusNode smsNumberFocusNode4 = FocusNode();
  Telephony telephony = Telephony.instance;

  @override
  void initState() {
    widget.smsLoginCubit.smsNumberController1.addListener(() {
      if (widget.smsLoginCubit.smsNumberController1.text.length == 1) {
        smsNumberFocusNode2.requestFocus();
      }
    });
    widget.smsLoginCubit.smsNumberController2.addListener(() {
      if (widget.smsLoginCubit.smsNumberController2.text.length == 1) {
        smsNumberFocusNode3.requestFocus();
      }
    });
    widget.smsLoginCubit.smsNumberController3.addListener(() {
      if (widget.smsLoginCubit.smsNumberController3.text.length == 1) {
        smsNumberFocusNode4.requestFocus();
      }
    });
    widget.smsLoginCubit.smsNumberController4.addListener(() {
      if (widget.smsLoginCubit.smsNumberController4.text.length == 1 &&
          widget.smsLoginCubit.smsNumberController1.text.length == 1 &&
          widget.smsLoginCubit.smsNumberController2.text.length == 1 &&
          widget.smsLoginCubit.smsNumberController3.text.length == 1) {
        smsNumberFocusNode4.unfocus();
      }
    });
    if (Platform.isAndroid) {
      telephony.listenIncomingSms(
          onNewMessage: (SmsMessage message) {}, listenInBackground: false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.height / 12,
              child: Center(
                child: CustomTextField(
                  focusNode: smsNumberFocusNode1,
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  hint: "",
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textEditingController:
                      widget.smsLoginCubit.smsNumberController1,
                  onChange: (val) {
                    widget.smsLoginCubit.updateUI();
                  },
                ),
              ),
            ),
            SizedBox(
              width: 10.r,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height / 12,
              child: CustomTextField(
                focusNode: smsNumberFocusNode2,
                maxLength: 1,
                textAlign: TextAlign.center,
                hint: "",
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textEditingController:
                    widget.smsLoginCubit.smsNumberController2,
                onChange: (val) {
                  widget.smsLoginCubit.updateUI();
                },
              ),
            ),
            SizedBox(
              width: 10.r,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height / 12,
              child: Center(
                child: CustomTextField(
                  focusNode: smsNumberFocusNode3,
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  hint: "",
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textEditingController:
                      widget.smsLoginCubit.smsNumberController3,
                  onChange: (val) {
                    widget.smsLoginCubit.updateUI();
                  },
                ),
              ),
            ),
            SizedBox(
              width: 10.r,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height / 12,
              child: CustomTextField(
                focusNode: smsNumberFocusNode4,
                maxLength: 1,
                textAlign: TextAlign.center,
                hint: "",
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textEditingController:
                    widget.smsLoginCubit.smsNumberController4,
                onChange: (val) {
                  widget.smsLoginCubit.updateUI();
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
