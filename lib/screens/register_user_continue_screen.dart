import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../route_generator.dart';
import '../utils/custom_buttons.dart';
import '../widgets/back_button_widget.dart';

class RegisterUserContinueScreen extends StatelessWidget {
  const RegisterUserContinueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButtonWidget(),
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      dog,
                      width: 141.w,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    black24w500Centre(data: 'Woof Woof! You did it!'),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                        width: 306.57.w,
                        child: lightBlack14w400Centre(
                            data:
                                'You’re now one step closer to giving your doggo the love and treats they deserve.')),

                  ],
                ),
              ),
              const Spacer(),
              customButton(text: 'Continue', onPressed: () {
                if (context.read<AuthViewModel>().phoneValidation()) {
                  context.read<AuthViewModel>()
                      .verifyNumber()
                      .then((value) => {
                    if (value)
                      {Navigator.pushNamed(context, otpRoute)}
                  });
                }
              }, colored: true),
            ],
          ),
        ),
      ),
    );
  }
}
