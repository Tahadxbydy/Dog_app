import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/custom_buttons.dart';
import '../utils/images.dart';
import 'dialogs/address_label_dialog.dart';
import 'dialogs/cancel_order_dialog.dart';

Widget ordersVerticalListChipWidget({required bool showButtons}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(sampleFood1,height: 45.h,),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              lightBlack14w400Centre(data: 'Redbarn Grain Free food'),
              grey14w400(data: '2 Kilograms'),
              SizedBox(
                height: 14.h,
              ),
              black16w500(data: 'AED 50'),
              SizedBox(height: 10.h,),
              Visibility(
                visible: showButtons,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 270.w,
                    child: Row(
                      children: [
                        Expanded(
                          child: customSquareButton(
                              text: 'Cancel',
                              onPressed: () {
                                cancelOrderDialog(context: navigatorKey.currentContext!);
                              },
                              colored: true),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: customSquareButton(
                              text: 'Freeze ',
                              onPressed: () {
                              },
                              colored: true),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: customSquareButton(
                              text: 'Update It',
                              onPressed: () {
                              },
                              colored: true),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      SizedBox(
        height: 20.h,
      ),
    ],
  );
}
