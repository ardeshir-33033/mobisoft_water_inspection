import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/validators/phone_number/phone_number_validator.dart';

part 'sms_login_state.dart';

class SmsLoginCubit extends Cubit<SmsLoginState> {
  SmsLoginCubit() : super(SmsLoginInitial());

  final TextEditingController phoneNumberController = TextEditingController();
  String isoCode = CountryCode.fromCountryCode("AT").dialCode!;

  final TextEditingController smsNumberController1 = TextEditingController();
  final TextEditingController smsNumberController2 = TextEditingController();
  final TextEditingController smsNumberController3 = TextEditingController();
  final TextEditingController smsNumberController4 = TextEditingController();

  void sendPhoneNumber() {
    emit(SmsLoginPending());

    Future.delayed(const Duration(seconds: 2), () {
      emit(SmsLoginSuccess());
    });
  }

  void sendSmsCode() {
    emit(SmsLoginPending());

    Future.delayed(const Duration(seconds: 2), () {
      emit(SmsLoginSuccess());
    });
  }

  Future<bool> validatePhoneNumber(String phoneNumber, String isoCode) async {
    emit(SmsLoginPending());

    PhoneNumberManager phoneManager = PhoneNumberManager();
    bool res = await phoneManager.checkValidation(
        phoneNumber: phoneNumber, isoCode: isoCode);

    if (res) {
      emit(SmsLoginSuccess());
      return true;
    } else {
      emit(SmsLoginError("Invalid phone number"));
      return false;
    }
  }

  updateUI() {
    emit(SmsLoginSuccess());
  }

  Future<bool> verifyCode() async {
    emit(SmsLoginPending());

    await Future.delayed(const Duration(seconds: 2), () {
      emit(SmsLoginSuccess());
    });
    return true;
  }
}
