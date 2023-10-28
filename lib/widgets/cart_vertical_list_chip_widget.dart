import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:brunos_kitchen/view_models/cart_view_model.dart';
import 'package:brunos_kitchen/view_models/plans_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../models/address_model.dart';
import '../models/cart_model.dart';
import '../utils/calculations.dart';
import '../utils/custom_colors.dart';
import '../utils/enums.dart';
import '../utils/images.dart';
import 'cart_dish_vertical_list_chip.dart';
import 'circular_network_image_widget.dart';

Widget cartVerticalListChipWidget(
    {required CartModel cartDetail, required int itemIndex}) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          navigatorKey.currentContext!.read<CartViewModel>().setViewCartItemDetail(true);
          if(cartDetail.planType == Plans.product.text){
            navigatorKey.currentContext!.read<PlansViewModel>().setCartDataToFeedingPlan(cartData: cartDetail);
            Navigator.pushNamed(
                navigatorKey.currentContext!,
                productDetailRoute);          }
          else{
            navigatorKey.currentContext!
                .read<PlansViewModel>()
                .setCartDataToFeedingPlan(cartData: cartDetail);
            Navigator.pushNamed(navigatorKey.currentContext!, feedingPlanRoute);
          }
        },
        child: Container(
          decoration: ShapeDecoration(
            color: CustomColors.lightGreyColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          orange18w500(
                              data:
                                  '${cartDetail.planType} ${cartDetail.puppy == null ? '' : 'Plan'}'),
                          grey12w500(
                              data: 'Delivery Date: ${cartDetail.deliveryDate}')
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navigatorKey.currentContext!
                            .read<CartViewModel>()
                            .setSelectedIndex(itemIndex);
                        navigatorKey.currentContext!.read<PlansViewModel>().setCartDataToFeedingPlan(cartData: cartDetail);
                        cartDetail.planType == Plans.monthly.text
                            ? {
                                Navigator.pushNamed(
                                    navigatorKey.currentContext!,
                                    monthlyPlanRoute)
                              }
                            : cartDetail.planType == Plans.transitional.text
                                ? Navigator.pushNamed(
                                    navigatorKey.currentContext!,
                                    transitionPlanRoute)
                                : cartDetail.planType == Plans.oneTime.text
                                    ? Navigator.pushNamed(
                                        navigatorKey.currentContext!,
                                        oneTimePlanRoute)
                                    : Navigator.pushNamed(
                                        navigatorKey.currentContext!,
                                        productDetailRoute);
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
                            Icons.edit,
                            size: 20,
                            color: CustomColors.orangeColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                      onTap: () {
                        navigatorKey.currentContext!
                            .read<CartViewModel>()
                            .removeFromCartList(cartDetail);
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
                            Icons.delete_outline,
                            size: 20,
                            color: CustomColors.orangeColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                cartDetail.puppy != null
                    ? Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              cartDetail.puppy!.media!.isNotEmpty
                                  ? circularNetworkImageWidget(
                                      image: cartDetail.puppy!.media!,
                                      size: 40.h)
                                  : SizedBox(
                                      height: 40.h,
                                      width: 40.h,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            CustomColors.yellowColor,
                                        child: SvgPicture.asset(dogFace),
                                      ),
                                    ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  black14w500(data: cartDetail.puppy!.name!),
                                  black14w500(data: cartDetail.puppy!.breed!),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 20.h,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartDetail.recipe.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cartDishVerticalListChipWidget(
                        cartRecipeModel: cartDetail.recipe[index],
                        planType: cartDetail.planType,
                        petName: cartDetail.puppy != null
                            ? cartDetail.puppy!.name!
                            : null);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: black14w500(
                        data: 'Payable: AED ${cartDetail.planTotal}'))
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
    ],
  );
}
