
import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/models/recipe_model.dart';
import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/view_models/plans_view_model.dart';
import 'package:brunos_kitchen/widgets/dialogs/schedule_days_range_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../route_generator.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';
import 'circular_network_image_widget.dart';

Widget mealVerticalListChipWidget({required RecipeModel recipeModel}) {
  return Column(
    children: [
      InkWell(
        onTap: () async {
          Navigator.pop(navigatorKey.currentContext!);
          navigatorKey.currentContext!.read<PlansViewModel>().getMonthlySelectedDaysController.clear();
        //  navigatorKey.currentContext!.read<PlansViewModel>().setDayRangeValidation(false);
          navigatorKey.currentContext!.read<PlansViewModel>().setSelectedRecipe(recipeModel);
         scheduleDaysRangeDialog();
          /*   final List<DateTime> picked = await DateRagePicker.showDatePicker(
                context: context,
                initialFirstDate: new DateTime.now(),
                initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
                firstDate: new DateTime(2015),
                lastDate: new DateTime(2030)
            );
            if (picked != null && picked.length == 2) {
              print(picked);
            }*/
        },
        child: Container(
          decoration: ShapeDecoration(
            color: CustomColors.lightGreyColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    decoration: ShapeDecoration(
                      color: CustomColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                    child: circularNetworkImageWidget( image: recipeModel.media![0], size: 52.h,
                    )),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:190.w,
                        child: black16w500(data: recipeModel.name!)),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: const ShapeDecoration(
                    color: CustomColors.orangeColor,
                    shape: OvalBorder(),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: CustomColors.whiteColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
    ],
  );
}
