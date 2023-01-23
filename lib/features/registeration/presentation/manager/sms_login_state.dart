part of 'sms_login_cubit.dart';

@immutable
abstract class SmsLoginState {}

class SmsLoginInitial extends SmsLoginState {}

class SmsLoginPending extends SmsLoginState {}

class SmsLoginSuccess extends SmsLoginState {}

class SmsLoginError extends SmsLoginState {
  final String message;

  SmsLoginError(this.message);
}
