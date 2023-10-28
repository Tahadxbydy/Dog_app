import 'package:brunos_kitchen/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/custom_buttons.dart';
import '../../utils/custom_colors.dart';
import '../../utils/custom_font_style.dart';

void imageDialog(
    {required BuildContext context,
      required double height, required title}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
/*
    transitionDuration: const Duration(milliseconds: 500),
*/
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: height.h,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              color: CustomColors.whiteColor,
              borderRadius: BorderRadius.circular(40)),
          child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    black18w500(
                      data: title,
                    ),
                    const Spacer(),
                    Image.asset(weightTest,height: 400.h,),
                    const Spacer(),
                    customButton(
                      height: 40,
                      colored: true,
                      text: 'Got it',
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )),
        ),
      );
    },
    /*transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },*/
  );
}
