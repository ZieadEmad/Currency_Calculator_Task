
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextleveltask/logic_layer/login_cubit/cubit.dart';
import 'package:nextleveltask/logic_layer/login_cubit/states.dart';
import 'package:nextleveltask/ui_layer/helpers/constants/constants.dart';
import 'package:nextleveltask/ui_layer/helpers/navigations/navigations.dart';
import 'package:nextleveltask/ui_layer/screens/layout/layout_screen.dart';
import 'package:nextleveltask/ui_layer/widgets/shared_widgets/build_toast/build_toast.dart';
import 'package:nextleveltask/ui_layer/widgets/shared_widgets/custom_text_field_without_icon/custom_text_field_without_icon.dart';
import 'package:nextleveltask/ui_layer/widgets/shared_widgets/default_button/default_button.dart';
import 'package:switcher_button/switcher_button.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: BlocProvider(
        create: (context)=> LoginCubit(),
        child: BlocConsumer<LoginCubit,LoginStates>(
          listener: (context,state){
            if(state is LoginStateLoading ){
              const  Center(child: CircularProgressIndicator(),);
            }
            if(state is LoginStateSuccess){
              // showToast(text: state.loginModel.message, error: false);
              // navigateAndFinish(context, DelegateHomeScreen());
            }
            if(state is LoginStateError){
              showToast(text: state.error, error: true);
            }
          },
          builder: (context,state){
            return  SingleChildScrollView(
              child: AutofillGroup(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height/50,),
                          Center(
                            child: Image.asset(
                              'assets/images/login_logo.png',
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height/90,),
                          Center(
                            child: Image.asset(
                              'assets/images/create_password_text.png',
                              width: MediaQuery.of(context).size.width/2,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/20,),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0,right: 18.0,top: 12.0,bottom: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 30,
                            ),
                           const Padding(
                              padding:  EdgeInsets.only(left: 8.0,bottom: 8.0),
                              child:  Text('New Password (min 8 chars)',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              child:  CustomTextFieldWithoutIcon(
                                hintLabel: '••••••••',
                                haveObscureIcon: true,
                                controller: passwordController,
                                haveIcon: false,
                                autofillHints: const[
                                  AutofillHints.password,
                                ],
                                textFormIcon: const Icon(Icons.lock,color: Colors.white,),
                                textInputType: TextInputType.visiblePassword,
                                error: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "";
                                    //   LoginCubit.get(context).changeEmailToError();
                                  }
                                },
                                isPassword: false,
                              ),
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height / 30,
                            ),
                            const Padding(
                              padding:  EdgeInsets.only(left: 8.0,bottom: 8.0),
                              child:  Text('Confirm Password',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              child: CustomTextFieldWithoutIcon(
                                hintLabel: '••••••••',
                                haveObscureIcon: false,
                                error: false,
                                controller: confirmPasswordController,
                                haveIcon: false,
                                textFormIcon: const Icon(Icons.lock,color: Colors.white,),
                                textInputType: TextInputType.visiblePassword,
                                autofillHints: const[
                                  AutofillHints.password
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '';
                                    //   LoginCubit.get(context).changePasswordToError();
                                  }
                                  if (value.length < 6) {
                                    return '';
                                    //  LoginCubit.get(context).changePasswordToError();
                                  }
                                },
                                isPassword: false,
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height/40,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Enable Touch ID at Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                                  SwitcherButton(
                                    value: false,
                                    size: 50.0,
                                    onChange: (value) {
                                      print(value);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height/15,),
                    Center(
                      child: DefaultButton(
                        height: 50,
                        width: MediaQuery.of(context).size.width/1.3,
                        function: (){
                          navigateAndFinish(context,const LayoutScreen());
                          // if(formKey.currentState!.validate()){
                          //   LoginCubit.get(context).login(
                          //     mobile: mobileController.text.toString(),
                          //     password: passwordController.text.toString(),
                          //   );
                          // }
                          // if(mobileController.text.isEmpty){
                          //   // LoginCubit.get(context).changeEmailToError();
                          //   showToast(text: '${LocaleKeys.can_not_blank.tr()} (${LocaleKeys.phone.tr()})', error: true);
                          // }
                          // if(passwordController.text.isEmpty){
                          //   //  LoginCubit.get(context).changePasswordToError();
                          //   showToast(text: '${LocaleKeys.can_not_blank.tr()} (${LocaleKeys.password.tr()})', error: true);
                          //
                          // }
                          // if (passwordController.text.length < 6) {
                          //   //   LoginCubit.get(context).changePasswordToError();
                          //   showToast(text: LocaleKeys.password_cannot_be_less_than_6_digits.tr(), error: true);
                          // }
                        },
                        radius: 4,
                        titleColor: Colors.white,
                        fontSize: 16,
                        text: 'Next',
                        toUpper: true,
                        background: Color(0xff6AD79E),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/google_social.png'),
                        SizedBox(width: MediaQuery.of(context).size.width/10,),
                        Image.asset('assets/images/faceboog_social.png'),
                        SizedBox(width: MediaQuery.of(context).size.width/10,),
                        Image.asset('assets/images/twitter_social.png'),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}