import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/view_models/puppy_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';
import '../widgets/app_bar_with_back_widget.dart';

class PuppyConfirmationScreen extends StatelessWidget {
  const PuppyConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackWidget(
        heading: 'My Pets', showPuppy: false,showCart: true
      ),
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      tick,
                      width: 108.w,
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    black24w500Centre(data: 'Paw-some!! You’ve now added another furry friend to your account!'),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  customButton(text: 'I want to add more pet', onPressed: () {
                    context.read<PuppyViewModel>().clearPuppyData();
                    Navigator.pushReplacementNamed(context, puppyCreationRoute);
                  }, colored: false, icon: Icons.add),
                  const SizedBox(height: 26,),
                  customButton(text: 'Continue', onPressed: () {
                    Navigator.pop(context);
                  }, colored: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
