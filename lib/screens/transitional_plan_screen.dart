import 'package:brunos_kitchen/view_models/plans_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../widgets/food_category_grid_chip_widget.dart';
import '../widgets/item_discribed_grid_chip_widget.dart';
import '../widgets/food_grid_chip_widget.dart';

class TransitionalPlanScreen extends StatelessWidget {
  const TransitionalPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackWidget(
        heading: 'Transitional Plan', showPuppy: true,showCart: true
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
/*
              GridView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.w, vertical: 20.h),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: (1 / 1.45)),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return foodDescribedGridChipWidget();
                },
              ),
*/
            /*  black18w500(
                  data: 'Try our canine-crafted combos'),
              GridView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.w, vertical: 20.h),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: (1 / 1.5)),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return foodDescribedGridChipWidget();
                },
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
