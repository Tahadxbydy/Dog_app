import 'package:brunos_kitchen/view_models/puppy_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';

Future imageTakingBottomSheetWidget() {
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
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
                  InkWell(
                    onTap: (){
                      context.read<PuppyViewModel>().getAndUpLoadImage(fromCamera: true);
                      Navigator.pop(context);
                    },
                    child: Row(children: [
                      IconButton(onPressed: () {

                      }, icon: const Icon(Icons.photo_camera,size: 30,color: CustomColors.orangeColor,),),
                      SizedBox(width: 5.w,),
                      black16w500(data: 'Camera')
                    ],),
                  ),
                  SizedBox(height: 20.h,),
                  InkWell(
                    onTap: (){
                      context.read<PuppyViewModel>().getAndUpLoadImage(fromCamera: false);
                      Navigator.pop(context);
                    },
                    child: Row(children: [
                      IconButton(onPressed: () {

                      }, icon: const Icon(Icons.photo_library,size: 30,color: CustomColors.orangeColor,),),
                      SizedBox(width: 5.w,),
                      black16w500(data: 'Gallery')
                    ],),
                  )

                ],
              ),
            ],
          ),
        );
      });
}