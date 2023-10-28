import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/view_models/plans_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../main.dart';
import '../../utils/custom_buttons.dart';
import '../../utils/custom_colors.dart';

Future scheduleDaysRangeDialog() {
  return showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return Consumer<PlansViewModel>(builder: (_, planViewModel, __) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(20.0),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: black18w500(data: 'Enter Number of Days'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                black12w500Centre(
                    data:
                        'Days Acquired: ${planViewModel.getAvailableDays}/30'),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  controller: planViewModel.getMonthlySelectedDaysController,
                  onChanged: (text) {},
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    hintText: 'Enter Days',
                  ),
                ),
             /*   SizedBox(
                  height: 10.h,
                ),
                Visibility(
                    visible: planViewModel.getDayRangeValidation,
                    child: planViewModel
                            .getMonthlySelectedDaysController.text.isNotEmpty
                        ? orange14w400(
                            data: 'Your days are greater then available days')
                        : orange14w400(
                            data: 'Please enter valid number of days')),*/
                SizedBox(
                  height: 40.h,
                ),
                customButton(
                    text: 'Submit',
                    onPressed: () {
                      if (planViewModel
                          .getMonthlySelectedDaysController.text.isNotEmpty && planViewModel
                          .getMonthlySelectedDaysController.text != '0') {
                        planViewModel.setMonthlySelectedItem();
                        Navigator.pop(context);
                     /*   planViewModel.setDayRangeValidation(true);
                        final bool status = planViewModel.checkAndUpdateAvailableDays();
                        if(status){
                          Navigator.pop(context);
                        }
                      } else {
                        planViewModel.setDayRangeValidation(true);*/
                      }
                    },
                    colored: true),
              ],
            ),
          );
        });
      });
}
