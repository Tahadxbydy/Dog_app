import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import 'cart_icon_widget.dart';
import 'deafult_puppy_icon_widget.dart';

class AppBarWithBackWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? heading;
  final bool showPuppy;
  final bool showCart;

  const AppBarWithBackWidget({Key? key, this.heading, required this.showPuppy, required this.showCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 60.h,
      backgroundColor: CustomColors.whiteColor,
      elevation: 1,
      title: heading != null ? Text(heading!) : Container(),
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(
            Icons.arrow_back_ios,
            color: CustomColors.blackColor,
          ),
        ),
      ),
      actions: [
        Visibility(
          visible: showCart,
          child: Padding(
            padding:  EdgeInsets.only(right: showPuppy? 5 : 20,top: 10),
            child: cartIconWidget(),
          ),
        ),
        Visibility(
          visible: showPuppy,
          child: Padding(
            padding: const EdgeInsets.only(right: 20,top: 10),
            child: defaultPuppyIconWidget(),
          ),
        ),

      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.h);
}
