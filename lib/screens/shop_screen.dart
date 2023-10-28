import 'package:brunos_kitchen/widgets/cart_icon_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../route_generator.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../utils/enums.dart';
import '../utils/food_category_list_data.dart';
import '../utils/images.dart';
import '../view_models/plans_view_model.dart';
import '../widgets/item_discribed_grid_chip_widget.dart';
import '../widgets/shop_items_horizontal_list_chip_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlansViewModel>(builder: (context, plansViewModel, child) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  black24w500Centre(data: 'Shop'),
                  cartIconWidget()
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              black18w500(data: 'Select Category'),
              SizedBox(
                height: 20.h,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10.w,
                runSpacing: 10.w,
                children: List.generate(
                    plansViewModel.getRecipesListResponse.data!.categories!
                        .length, (index) {
                  return SizedBox(
                    width: 100.w,
                    child: customSquareButton(
                        text: plansViewModel.getRecipesListResponse.data!
                            .categories![index].name!,
                        onPressed: () {
                          plansViewModel.setProductCategory(plansViewModel
                              .getRecipesListResponse
                              .data!
                              .categories![index]
                              .name!);
                        },
                        colored: plansViewModel.getProductCategory ==
                            plansViewModel.getRecipesListResponse.data!
                                .categories![index].name),
                  );
                }),
              ),
              SizedBox(
                height: 20.h,
              ),
              black18w500(data: 'Products'),
              SizedBox(
                height: 10.h,
              ),
              Wrap(
                runSpacing: 20.w,
                spacing: 20.w,
                alignment: plansViewModel.getProductList.length == 1
                    ? WrapAlignment.start
                    : WrapAlignment.center,
                children: List.generate(plansViewModel.getProductList.length,
                    (index) {
                  return SizedBox(
                    width: 157.w,
                    child: itemDescribedGridChipWidget(
                        recipeData: plansViewModel.getProductList[index]),
                  );
                }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
