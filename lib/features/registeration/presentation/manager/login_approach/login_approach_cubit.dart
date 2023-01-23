import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_approach_state.dart';

class LoginApproachCubit extends Cubit<LoginApproachState> {
  LoginApproachCubit() : super(LoginApproachInitial()) {
    _initial();
  }

  _initial() {
    emit(LoginApproachSuccess());
  }

  Future<bool?> loginViaDeviceId(String deviceId) async {
    emit(LoginApproachPending());

    await Future.delayed(const Duration(seconds: 2), () {
      emit(LoginApproachSuccess());
      return true;
    });
    return null;
  }

  Future<bool?> sendPhoneNumber(String phoneNumber) async {
    emit(LoginApproachPending());

    await Future.delayed(const Duration(seconds: 2), () {
      emit(LoginApproachSuccess());
      return true;
    });
    return null;
  }
}
