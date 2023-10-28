import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/widgets/user_form_fields_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/back_button_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authViewModel, __) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
              const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackButtonWidget(),
                  SizedBox(
                    height: 35.h,
                  ),
                  black24w500Centre(data: 'Reset Password'),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 286.w,
                    child: grey14w400(
                        data:
                        'We will send you an confirmation code to your phone for password reset'),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  const PasswordFieldWidget(hint: 'Password',),
                  SizedBox(
                    height: 5.h,
                  ),
                  Visibility(
                      visible: authViewModel.getPasswordFieldError.isNotEmpty,
                      child: orange14w400(
                          data: authViewModel.getPasswordFieldError)),
                  SizedBox(
                    height: 16.h,
                  ),
                  const ConfirmPasswordFieldWidget(hint: 'Confirm Password',),
                  SizedBox(
                    height: 5.h,
                  ),
                  Visibility(
                      visible:
                      authViewModel.getConfirmPasswordFieldError.isNotEmpty,
                      child: orange14w400(
                          data: authViewModel.getConfirmPasswordFieldError)),
                  SizedBox(
                    height: 40.h,
                  ),
                  customButton(
                      text: 'Continue',
                      onPressed: () {
                        if(authViewModel.forgotPasswordValidation()){
                        authViewModel.callForgotPasswordApi().then((value) => {
                        if(value){
                          authViewModel.clearFieldsData(),
                            Navigator.pushNamed(context,
                            resetPasswordSuccessRoute)
                      }});}
                      },
                      colored: true),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
