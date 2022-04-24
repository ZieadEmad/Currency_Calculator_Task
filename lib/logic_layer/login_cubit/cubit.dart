
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextleveltask/domain_layer/remote/end_points.dart';
import 'package:nextleveltask/domain_layer/remote/remote.dart';
import 'package:nextleveltask/logic_layer/login_cubit/states.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStateInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
// late LoginModel loginModel;
  void login({@required confirmPassword, @required password}) {
    emit(LoginStateLoading());
    DioHelper.postDataRegister(
        path: loginEndPoint,
        data: {
      'password': '$password',
      'confirmPassword': '$confirmPassword',
    }).then((value) {
      // loginModel = LoginModel.fromJson(value.data);
      // saveUserToken(loginModel.data!.token);
      // saveUserId(loginModel.data!.id);
    //  emit(LoginStateSuccess(loginModel, loginModel.success));
    }).catchError((e) {
      if (e is DioError) {
        emit(LoginStateError('${e.response!.data['message']}'));
      } else {
        print(e.toString());
      }
    });
  }


  // bool passwordError = false ;
  // bool confirmPasswordError = false ;
  // changePasswordToError(){
  //   passwordError = true;
  //   emit(ChangePasswordToError());
  // }
  // changePasswordToNotError(){
  //   passwordError = false;
  //   emit(ChangePasswordToError());
  // }
  // changeConfirmPasswordToError(){
  //   confirmPasswordError = true;
  //   emit(ChangeEmailToError());
  // }
  // changeConfirmPasswordToNotError(){
  //   confirmPasswordError = false;
  //   emit(ChangeEmailToError());
  // }


}