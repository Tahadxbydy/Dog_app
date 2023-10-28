import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:brunos_kitchen/view_models/cart_view_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../view_models/auth_view_model.dart';
import '../view_models/plans_view_model.dart';
import '../widgets/add_meal_bottom_sheet_widget.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../widgets/circular_network_image_widget.dart';
import '../widgets/dialogs/discription_dialog.dart';

class MonthlyPlanScreen extends StatelessWidget {
  const MonthlyPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlansViewModel>(builder: (context, plansViewModel, child) {
      return Scaffold(
        appBar: const AppBarWithBackWidget(
            heading: 'Monthly Plan', showPuppy: true, showCart: true),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: black24w500Centre(
                          data:
                              'Let’s Feed Your Beloved\n${context.watch<AuthViewModel>().getAuthResponse.data!.pet!.name!}')),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                      child: lightBlack14w400Centre(
                          data:
                              'You can select up to 3 delicious dishes per month')),
                  SizedBox(
                    height: 30.h,
                  ),
                  black18w500(data: 'Add Dishes'),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      plansViewModel.setMonthlyEmptyTileNumber(1);
                      addMealDetailBottomSheetWidget();
                    },
                    child: Container(
                      decoration: ShapeDecoration(
                        color: CustomColors.lightGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 22),
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
                                child:
                                    plansViewModel.getMonthlyEmptyTile1 != null
                                        ? circularNetworkImageWidget(
                                            image: plansViewModel
                                                .getMonthlyEmptyTile1!
                                                .media![0],
                                            size: 52.h,
                                          )
                                        : SizedBox(
                                            height: 52.h,
                                            width: 52.h,
                                          )),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                plansViewModel.getMonthlyEmptyTile1 != null
                                    ? black16w500(
                                        data:
                                            'Days ${plansViewModel.getMonthlyEmptyTile1!.totalDays}')
                                    : black16w500(data: 'Tap to Add Meal'),
                                plansViewModel.getMonthlyEmptyTile1 != null
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: black14w500(
                                            data: plansViewModel
                                                .getMonthlyEmptyTile1!.name!),
                                      )
                                    : Container(),

                                /*     Visibility(
                                  visible: plansViewModel.getScheduleEmptyTile1 == null,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: black12w500Centre(data: 'tap to add meal'),
                                  ),
                                )*/
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
                  InkWell(
                    onTap: () {
                      plansViewModel.setMonthlyEmptyTileNumber(2);
                      addMealDetailBottomSheetWidget();
                    },
                    child: Container(
                      decoration: ShapeDecoration(
                        color: CustomColors.lightGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 22),
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
                                child:
                                    plansViewModel.getMonthlyEmptyTile2 != null
                                        ? circularNetworkImageWidget(
                                            image: plansViewModel
                                                .getMonthlyEmptyTile2!
                                                .media![0],
                                            size: 52.h,
                                          )
                                        : SizedBox(
                                            height: 52.h,
                                            width: 52.h,
                                          )),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                plansViewModel.getMonthlyEmptyTile2 != null
                                    ? black16w500(
                                        data:
                                            'Days ${plansViewModel.getMonthlyEmptyTile2!.totalDays}')
                                    : black16w500(data: 'Tap to Add Meal'),
                                plansViewModel.getMonthlyEmptyTile2 != null
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: black14w500(
                                            data: plansViewModel
                                                .getMonthlyEmptyTile2!.name!),
                                      )
                                    : Container(),

                                /*     Visibility(
                                  visible: plansViewModel.getScheduleEmptyTile1 == null,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: black12w500Centre(data: 'tap to add meal'),
                                  ),
                                )*/
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
                  InkWell(
                    onTap: () {
                      plansViewModel.setMonthlyEmptyTileNumber(3);
                      addMealDetailBottomSheetWidget();
                    },
                    child: Container(
                      decoration: ShapeDecoration(
                        color: CustomColors.lightGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 22),
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
                                child:
                                    plansViewModel.getMonthlyEmptyTile3 != null
                                        ? circularNetworkImageWidget(
                                            image: plansViewModel
                                                .getMonthlyEmptyTile3!
                                                .media![0],
                                            size: 52.h,
                                          )
                                        : SizedBox(
                                            height: 52.h,
                                            width: 52.h,
                                          )),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                plansViewModel.getMonthlyEmptyTile3 != null
                                    ? black16w500(
                                        data:
                                            'Days ${plansViewModel.getMonthlyEmptyTile3!.totalDays}')
                                    : black16w500(data: 'Tap to Add Meal'),
                                plansViewModel.getMonthlyEmptyTile3 != null
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: black14w500(
                                            data: plansViewModel
                                                .getMonthlyEmptyTile3!.name!),
                                      )
                                    : Container(),

                                /*     Visibility(
                                  visible: plansViewModel.getScheduleEmptyTile1 == null,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: black12w500Centre(data: 'tap to add meal'),
                                  ),
                                )*/
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
                ],
              ),
              SizedBox(
                height: screenHeight,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: customButton(
                      text: 'Continue',
                      onPressed: () {
                        if (plansViewModel.getMonthlyEmptyTile1 == null &&
                            plansViewModel.getMonthlyEmptyTile2 == null &&
                            plansViewModel.getMonthlyEmptyTile3 == null) {
                          descriptionDialog(
                              context: context,
                              description: 'Please add at least One Meal',
                              height: 150.h,
                              title: 'Note');
                        } else {
                          if (((plansViewModel.getMonthlyEmptyTile1 != null
                                      ? plansViewModel
                                          .getMonthlyEmptyTile1!.totalDays!
                                      : 0) +
                                  (plansViewModel.getMonthlyEmptyTile2 != null
                                      ? plansViewModel
                                          .getMonthlyEmptyTile2!.totalDays!
                                      : 0) +
                                  (plansViewModel.getMonthlyEmptyTile3 != null
                                      ? plansViewModel
                                          .getMonthlyEmptyTile3!.totalDays!
                                      : 0)) >
                              30) {
                            descriptionDialog(
                                context: context,
                                description:
                                    'Total Number of Days must be less then 30',
                                height: 150.h,
                                title: 'Alert');
                          }
                          else
                          {
                            context.read<CartViewModel>().setViewCartItemDetail(false);
                            Navigator.pushNamed(context, feedingPlanRoute);
                          }
                        }
                      },
                      colored: true),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
