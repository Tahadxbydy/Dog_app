import 'package:brunos_kitchen/models/recipe_model.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:brunos_kitchen/widgets/recipe_detail_bottom_sheet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import 'add_meal_bottom_sheet_widget.dart';

Widget foodGridChipWidget ({required RecipeModel recipeDetail}){
  return Card(
      elevation: 2,
      color: CustomColors.whiteColor,
      borderOnForeground: false,
      shape: const RoundedRectangleBorder(
        // side: BorderSide(color: CustomColors.whiteColor),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
                decoration: ShapeDecoration(
                  color: CustomColors.lightGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Stack(
                  children: [
                    Center(child: Image.network(recipeDetail.media![0],height: 108.h,)),
                    InkWell(
                      onTap: () {
                        //TODO: CHANGE RECIPE MODEL
                        recipeDetailBottomSheetWidget(recipeDetail: recipeDetail);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: SvgPicture.asset(informationButton)),
                      ),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                children: [

                  black14w500(data: recipeDetail.name!,centre: true),
                  SizedBox(height: 5.h,),
                  black14w500(data: '(${recipeDetail.lifeStage!})'),

                ],
              ),
            )
          ],
        ),
      ));
}