import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/view_models/cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../widgets/cart_vertical_list_chip_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder: (context, cartViewModel, child) {
      return Scaffold(
        appBar: const AppBarWithBackWidget(
            heading: 'Shopping Bag', showPuppy: true, showCart: false),
        body: cartViewModel.getCartList.isNotEmpty
            ? Stack(
                children: [
                  ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cartViewModel.getCartList.length,
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 120),
                    itemBuilder: (BuildContext context, int index) {
                      return cartVerticalListChipWidget(
                          cartDetail: cartViewModel.getCartList[index],
                          itemIndex: index);
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: CustomColors.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5,
                            spreadRadius: 2,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            orange14w500(
                                data:
                                    'Total Amount: AED ${cartViewModel.getCartTotalPrice}'),
                            SizedBox(
                              height: 10.h,
                            ),
                            customButton(
                                text: 'CheckOut',
                                onPressed: () {
                                  Navigator.pushNamed(context, checkOutRoute);
                                },
                                colored: true),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: black24w500Centre(data: 'Shopping Bag is Empty'),
              ),
      );
    });
  }
}
