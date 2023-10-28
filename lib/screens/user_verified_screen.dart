import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_font_style.dart';
import '../widgets/back_button_widget.dart';

class UserVerifiedScreen extends StatelessWidget {
  const UserVerifiedScreen({Key? key}) : super(key: key);

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
                      tick,
                      width: 108.w,
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    black24w500Centre(data: 'Congratulations!'),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                        width: 306.57.w,
                        child: lightBlack14w400Centre(
                            data:
                            'Your account has been verified')),

                  ],
                ),
              ),
              const Spacer(),
              customButton(text: 'Continue', onPressed: () {
                Navigator.pushNamed(context, pawPointsRoute);
              }, colored: true),
            ],
          ),
        ),
      ),
    );
  }
}
