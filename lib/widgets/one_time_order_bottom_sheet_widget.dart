import 'package:brunos_kitchen/models/recipe_model.dart';
import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/view_models/plans_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/images.dart';
import '../view_models/cart_view_model.dart';
import 'meal_vertical_list_chip_widget.dart';

Future oneTimeOrderBottomSheetWidget({required RecipeModel data}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: CustomColors.whiteColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: navigatorKey.currentContext!,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
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
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      food,
                      height: 150.h,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          lightBlack14w400Centre(data: data.name!),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                              width: 150.w,
                              child: black10w400(
                                  data: data.ingredientsComposition!)),
                          SizedBox(
                            height: 10.h,
                          ),
                          orange14w400(
                              data:
                                  'AED ${data.pricePerKG! * navigatorKey.currentContext!.watch<PlansViewModel>().getDaysCount} / plan')
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          lightBlack14w400Centre(data: 'Quantity'),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  navigatorKey.currentContext!
                                      .read<PlansViewModel>()
                                      .minusDaysCount();
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
                                      Icons.remove,
                                      size: 20,
                                      color: CustomColors.greyColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 40.w,
                                  child: Center(
                                      child: black18w500(
                                          data: navigatorKey.currentContext!
                                              .watch<PlansViewModel>()
                                              .getDaysCount
                                              .toString()))),
                              InkWell(
                                onTap: () {
                                  navigatorKey.currentContext!
                                      .read<PlansViewModel>()
                                      .addDaysCount();
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
                                      Icons.add,
                                      size: 20,
                                      color: CustomColors.greyColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  customButton(
                      text: 'Continue',
                      onPressed: () {
                        context
                            .read<CartViewModel>()
                            .setViewCartItemDetail(false);
                        Navigator.pop(context);
                        Navigator.pushNamed(context, feedingPlanRoute);
                      },
                      colored: true),
                ],
              ),
            ],
          ),
        );
      });
}
