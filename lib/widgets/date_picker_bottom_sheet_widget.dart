import 'package:brunos_kitchen/view_models/puppy_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../view_models/auth_view_model.dart';

Future datePickerBottomSheetWidget() {
  return showModalBottomSheet(
      isScrollControlled: false,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      black18w500(
                          data:
                              'Select ${navigatorKey.currentContext!.watch<PuppyViewModel>().getPuppyNameController.text.isNotEmpty ? navigatorKey.currentContext!.watch<PuppyViewModel>().getPuppyNameController.text : 'Pet'}\'s BirthDay'),
                      const Spacer(),
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
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 150.h,
                    child: CupertinoTheme(
                      data: CupertinoThemeData(
                        brightness: Brightness.light,
                        textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: DateTime.now(),
                          maximumDate: DateTime.now(),
                          onDateTimeChanged: (value) {
                            context.read<PuppyViewModel>().setPuppyDob(value);
                            /*setState(() {
                                    _chosenDateTime = val;
                                  });*/
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  customButton(
                      text: 'Submit',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      colored: true),
                ],
              ),
            ],
          ),
        );
      });
}
