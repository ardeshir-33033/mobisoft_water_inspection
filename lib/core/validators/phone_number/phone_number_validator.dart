import 'package:phone_number/phone_number.dart';

class PhoneNumberManager {
  Future<bool> checkValidation(
      {required String phoneNumber, required String isoCode}) async {
    bool res = await PhoneNumberUtil().validate(
      "$isoCode$phoneNumber",
    );
    return res;
  }
}
