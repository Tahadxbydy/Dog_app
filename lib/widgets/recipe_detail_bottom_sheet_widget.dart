import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/models/recipe_model.dart';
import 'package:brunos_kitchen/models/responses/auth_response.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../utils/enums.dart';
import '../utils/calculations.dart';
import '../view_models/plans_view_model.dart';
import 'carousels/home_carousel_widget.dart';
import 'carousels/recipes_carousel_widget.dart';

Future recipeDetailBottomSheetWidget({required RecipeModel recipeDetail}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: CustomColors.whiteColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: navigatorKey.currentContext!,
      builder: (context) {
        return SizedBox(
          height: 670.h,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20,top: 20, ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        black18w500(data: recipeDetail.name!),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                            width: 280.w,
                            child: grey14w400(
                                maxLine: 3, data: recipeDetail.description!)),
                        SizedBox(
                          height: 5.h,
                        ),
                        black12w500Centre(
                            data:
                                'Starting From ${recipeDetail.pricePerKG} AED/KG')
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: ShapeDecoration(
                          color: CustomColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.75,
                                color: CustomColors.greyMediumColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.clear,
                            size: 20,
                            color: CustomColors.greyColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                DefaultTabController(
                  length: 4,
                  initialIndex: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const TabBar(
                        isScrollable: true,
                        indicatorColor: CustomColors.orangeColor,
                        dividerColor: CustomColors.greyColor,
                        labelColor: CustomColors.blackColor,
                        tabs: <Widget>[
                          Tab(text: 'Description'),
                          Tab(text: 'Guaranteed Analysis'),
                          Tab(text: 'Ingredients'),
                          Tab(text: 'Feeding Chart'),
                        ],
                      ),
                      SizedBox(
                        height: 460.h,
                        //I want to use dynamic height instead of fixed height
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: TabBarView(
                            children: <Widget>[
                              SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    SizedBox(
                                      height: 200.w,
                                      child:  RecipesCarouselWidget(recipesImages: recipeDetail.media!,),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    black12w500Centre(
                                        lineSpacing: true,
                                        data: recipeDetail.details!),
                                    /* SizedBox(height: 27.h),
                                    Container(
                                      width: double.infinity,
                                      decoration: const ShapeDecoration(
                                        color: CustomColors.lightGreyColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child:
                                            black16w500(data: 'Specifications'),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: grey14w400(
                                                    data: 'Item Number')),
                                            Expanded(
                                                child: black14w400(
                                                    data: recipeDetail.recipeNo!.toString())),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: grey14w400(
                                                    data: 'Made in')),
                                            Expanded(
                                                child:
                                                    black14w400(data: 'UAE')),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child:
                                                    grey14w400(data: 'Weight')),
                                            Expanded(
                                                child: black14w400(
                                                    data: '1 kg')),
                                          ],
                                        ),
                                      ),
                                    ),*/
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    black18w500(data: 'Guaranteed Analysis'),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: recipeDetail.nutrition!.length,
                                      //padding: const EdgeInsets.only(left: 20, right: 20),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.check_circle,
                                                  color:
                                                      CustomColors.greenColor,
                                                ),
                                                SizedBox(width: 5.w),
                                                black14w400(
                                                    data: recipeDetail
                                                        .nutrition![index])
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    black18w500(
                                        data: 'Calorie Content (ME, As Fed)'),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    black14w400(
                                        data:
                                            '${recipeDetail.caloriesContentNo} kcal/kg,  ${recipeDetail.caloriesContentNo! / 1000} kcal/gm')
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    black14w400(
                                        lineSpacing: true,
                                        data:
                                            '${recipeDetail.ingredientsComposition}')
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    black18w500(data: 'Feeding Directions'),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    black12w500Centre(
                                      data: recipeDetail.instructions!,
                                      lineSpacing: true,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    black12w500Centre(
                                        lineSpacing: true,
                                        data:
                                            'Use guidelines below, adjust feeding quantities as necessary to maintain your pet’s ideal body score'),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    black18w500(data: 'GRAMS TO FEED PER DAY'),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Table(
                                        defaultColumnWidth:
                                            const IntrinsicColumnWidth(),
                                        border: TableBorder.all(
                                            color: CustomColors.blackColor,
                                            style: BorderStyle.solid),
                                        children: [
                                          TableRow(children: [
                                            Container(
                                              color: CustomColors
                                                  .greyMediumLightColor,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5.0),
                                                child: black10w400(
                                                    data:
                                                        'Dog\'s Ideal Weight (kg)'),
                                              ),
                                            ),
                                            Container(
                                              color: CustomColors
                                                  .greyMediumLightColor,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5.0),
                                                child: Center(
                                                  child: black10w400(data: '4.5'),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: CustomColors
                                                  .greyMediumLightColor,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5.0),
                                                child: Center(
                                                  child: black10w400(data: '9.1'),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: CustomColors
                                                  .greyMediumLightColor,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5.0),
                                                child: Center(
                                                  child:
                                                      black10w400(data: '15.9'),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: CustomColors
                                                  .greyMediumLightColor,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5.0),
                                                child: Center(
                                                  child:
                                                      black10w400(data: '22.7'),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: CustomColors
                                                  .greyMediumLightColor,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5.0),
                                                child: Center(
                                                  child:
                                                      black10w400(data: '27.3'),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: CustomColors
                                                  .greyMediumLightColor,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5.0),
                                                child: Center(
                                                  child:
                                                      black10w400(data: '34.1'),
                                                ),
                                              ),
                                            ),
                                          ]),
                                          TableRow(children: [
                                            Container(
                                              color: CustomColors
                                                  .greyMediumLightColor,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5.0),
                                                child: black10w400(
                                                    data: 'Adult, Less Active'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.lessActive.text, currentWeight: 4.5)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.lessActive.text, currentWeight: 9.1)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.lessActive.text, currentWeight: 15.9)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.lessActive.text, currentWeight: 22.7)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.lessActive.text, currentWeight: 27.3)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.lessActive.text, currentWeight: 34.1)} g'),
                                              ),
                                            ),
                                          ]),
                                          TableRow(children: [
                                            Container(
                                              color: CustomColors
                                                  .greyMediumLightColor,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5.0),
                                                child: black10w400(
                                                    data: 'Adult, Active'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.active.text, currentWeight: 4.5)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.active.text, currentWeight: 9.1)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.active.text, currentWeight: 15.9)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.active.text, currentWeight: 22.7)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.active.text, currentWeight: 27.3)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.active.text, currentWeight: 34.1)} g'),
                                              ),
                                            ),
                                          ]),
                                          TableRow(children: [
                                            Container(
                                              color: CustomColors
                                                  .greyMediumLightColor,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5.0),
                                                child: black10w400(
                                                    data: 'Adult, More Active'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.veryActive.text, currentWeight: 4.5)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.veryActive.text, currentWeight: 9.1)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.veryActive.text, currentWeight: 15.9)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.veryActive.text, currentWeight: 22.7)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.veryActive.text, currentWeight: 27.3)} g'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5.0),
                                              child: Center(
                                                child: black10w400(
                                                    data:
                                                        '${calculateDailyIntake(recipeModel: recipeDetail, puppyActivityLevel: Puppy.veryActive.text, currentWeight: 34.1)} g'),
                                              ),
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ),
                                    context
                                        .watch<AuthViewModel>()
                                        .getAuthResponse
                                        .data!
                                        .pet !=
                                        null
                                        ?Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        black18w500(data: 'Recommended daily feeding plan for ${context.watch<AuthViewModel>().getAuthResponse.data!.pet!.name}'),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        black14w500(
                                                data:
                                                    '${calculateFeedingPlan(recipeModel: recipeDetail, puppyModel: context.watch<AuthViewModel>().getAuthResponse.data!.pet!)} grams ${context.watch<AuthViewModel>().getAuthResponse.data!.pet!.feedingRoutine!} times per day')

                                      ],
                                    ): const SizedBox(),
                                    /*Container(
                                      width: double.infinity,
                                      decoration: const ShapeDecoration(
                                        color: CustomColors.lightGreyColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: black16w500(
                                                    data: 'Weight')),
                                            Expanded(
                                                child: black16w500(
                                                    data: 'Daily Feeding')),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: grey14w400(
                                                    data: 'Up to 10 lbs')),
                                            Expanded(
                                                child: black14w400(
                                                    data: '1/4 - 1')),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: grey14w400(
                                                    data: 'Up - 25 lbs')),
                                            Expanded(
                                                child: black14w400(
                                                    data: '1 - 1 3/4')),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: grey14w400(
                                                    data: '25 - 50 lbs')),
                                            Expanded(
                                                child: black14w400(
                                                    data: '1 - 1 3/4')),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: grey14w400(
                                                    data: '50 - 75 lbs')),
                                            Expanded(
                                                child: black14w400(
                                                    data: '1 - 1 3/4')),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: grey14w400(
                                                    data: '75 - 150 lbs')),
                                            Expanded(
                                                child: black14w400(
                                                    data: '1 3/4 - 3')),
                                          ],
                                        ),
                                      ),
                                    ),*/
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
