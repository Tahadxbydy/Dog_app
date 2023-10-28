import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/view_models/cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '../route_generator.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../utils/enums.dart';
import '../utils/images.dart';
import '../view_models/auth_view_model.dart';
import '../view_models/puppy_view_model.dart';
import 'circular_network_image_widget.dart';

Widget cartIconWidget() {
  return Consumer<CartViewModel>(builder: (_, cartViewModel, __) {
      return Center(
      child: SizedBox(
        height: 30.h,
        width: 30.h,
        child: badges.Badge(
          position: badges.BadgePosition.topEnd(top: -8, end: -2),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: CustomColors.orangeColor,
          ),
          badgeContent:  Text(
            cartViewModel.getCartList.length.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(navigatorKey.currentContext!, cartRoute);
            },
            child:  CircleAvatar(
              backgroundColor: CustomColors.purpleColorTint,
              child: SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: SvgPicture.asset(shoppingBagIcon,color: CustomColors.whiteColor,)),
            ),
          ),
        ),
      ),
    );
  });
}
