import 'package:brunos_kitchen/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../route_generator.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../widgets/back_button_widget.dart';

class PawPointsScreen extends StatelessWidget {
  const PawPointsScreen({Key? key}) : super(key: key);

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
                      coin,
                      width: 111.w,
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    black24w500Centre(data: 'It only gets yummier from here'),
                    SizedBox(
                      height: 20.h,
                    ),
                    const SizedBox(
                      width: 306.57,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Here’s ',
                              style: TextStyle(
                                color: CustomColors.blackColor,
                                fontSize: 15,
                                fontFamily: 'Circular Std',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '500 PawPoints',
                              style: TextStyle(
                                color: CustomColors.yellowColor,
                                fontSize: 15,
                                fontFamily: 'Circular Std',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: ' towards your furry pal’s meals & treats',
                              style: TextStyle(
                                color: Color(0xFF43454B),
                                fontSize: 15,
                                fontFamily: 'Circular Std',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              customButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context,
                        bottomNavigationRoute, (route) => false);
                  },
                  colored: true),
            ],
          ),
        ),
      ),
    );
  }
}
