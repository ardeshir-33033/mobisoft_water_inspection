abstract class LoginApproachState {}

class LoginApproachInitial extends LoginApproachState {}

class LoginApproachPending extends LoginApproachState {}

class LoginApproachSuccess extends LoginApproachState {}

class LoginApproachError extends LoginApproachState {
  final String message;

  LoginApproachError(this.message);
}
