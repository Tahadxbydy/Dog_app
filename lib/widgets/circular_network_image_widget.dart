import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

Widget circularNetworkImageWidget({required String image, required double size}){
  return SizedBox(
    height: size,
    width: size,
    child: CircleAvatar(
      backgroundColor: CustomColors.yellowColor,
      backgroundImage: NetworkImage(
        image,
      ),
    ),);
}