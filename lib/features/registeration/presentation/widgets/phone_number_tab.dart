import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/textfields/custom_textfield.dart';
import '../manager/sms_login_cubit.dart';

class PhoneNumberTab extends StatelessWidget {
  const PhoneNumberTab({
    Key? key,
    required this.smsLoginCubit,
  }) : super(key: key);

  final SmsLoginCubit smsLoginCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300.w,
          child: CustomTextField(
              icon: CountryCodePicker(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 5.w),
                dialogSize: Size(200.w, 200.h),
                hideSearch: true,
                countryFilter: const ['AT', 'DE', 'HR', 'RS', 'IR', 'CH'],
                onChanged: (val) async {
                  smsLoginCubit.isoCode = val.dialCode!;
                },
                initialSelection: 'AT',
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  // return AppLocalizations.of(context)!.empty;
                }
                return null;
              },
              onChange: (val) {
                smsLoginCubit.updateUI();
              },
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.center,
              hint: "Phone Number",
              textEditingController: smsLoginCubit.phoneNumberController),
        ),
      ],
    );
  }
}
