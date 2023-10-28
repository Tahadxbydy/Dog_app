import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_font_style.dart';
import '../utils/images.dart';
import '../view_models/auth_view_model.dart';
import '../view_models/plans_view_model.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../widgets/item_discribed_grid_chip_widget.dart';

class OneTimePlanScreen extends StatelessWidget {
  const OneTimePlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackWidget(
        heading: 'OneTime Order', showPuppy: true,showCart: true
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Image.asset(
                  buyBulits2,
                  height: 57.h,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: black24w500Centre(
                    data: 'Let’s Feed Your Beloved\n${context.watch<AuthViewModel>().getAuthResponse.data!.pet!.name!}'),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(child: lightBlack14w400Centre(data: 'Pick from any of our Bruno-approved delightful\ndishes below')),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: black18w500(
                    data: 'Recommended Dishes'),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Wrap(
                  runSpacing: 20.w,
                  spacing: 20.w,
                  alignment: WrapAlignment.center,
                  children: List.generate(context.read<PlansViewModel>().getRecommendedRecipesList.length, (index) {
                    return SizedBox(
                      width: 157.w,
                      child: itemDescribedGridChipWidget(recipeData: context.read<PlansViewModel>().getRecommendedRecipesList[index]),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: black18w500(
                    data: 'Try our canine-crafted combos'),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Wrap(
                  runSpacing: 20.w,
                  spacing: 20.w,
                  alignment: WrapAlignment.center,
                  children: List.generate(context.read<PlansViewModel>().getComboRecipesList.length, (index) {
                    return SizedBox(
                      width: 157.w,
                      child: itemDescribedGridChipWidget(recipeData: context.read<PlansViewModel>().getComboRecipesList[index]),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
