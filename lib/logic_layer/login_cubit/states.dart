
abstract class LoginStates {}

class LoginStateInitial extends LoginStates {}
class LoginStateLoading extends LoginStates {}
class LoginStateSuccess extends LoginStates {
//  LoginModel loginModel;
  bool success ;
  LoginStateSuccess(this.success);
}
class LoginStateError extends LoginStates {
  String error;
  LoginStateError(this.error);
}

class ChangeEmailToError extends LoginStates {}
class ChangePasswordToError extends LoginStates {}


class ChangeRememberMeValueState extends LoginStates {}
