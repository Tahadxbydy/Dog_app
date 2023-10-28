import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../models/recipe_model.dart';
import '../route_generator.dart';
import '../utils/calculations.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/images.dart';
import '../view_models/auth_view_model.dart';
import '../view_models/cart_view_model.dart';
import '../view_models/plans_view_model.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../widgets/carousels/product_carousel_widget.dart';
import '../widgets/dialogs/discription_dialog.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlansViewModel>(builder: (context, plansViewModel, child) {
      return Scaffold(
        appBar: AppBarWithBackWidget(
            heading: toBeginningOfSentenceCase(
                '${plansViewModel.getSelectedRecipe.name}'),
            showPuppy: false,
            showCart: context.read<CartViewModel>().getSelectedIndex == null
                ? true
                : false),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 300.h,
                        child: ProductCarouselWidget(
                          productImages:
                              plansViewModel.getSelectedRecipe.media!,
                        )),
/*
                    Container(
                        width: double.infinity,
                        height: 300.h,
                        decoration: ShapeDecoration(
                          color: CustomColors.lightGreyColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Center(
                            child: Image.network(
                              plansViewModel.getSelectedRecipe.media![0],
                              //height: 200.h,
                            ),
                          ),
                        )),
*/
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              black14w500(data: 'Unit Price'),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  black24w500Centre(
                                      data:
                                          'AED ${plansViewModel.getSelectedRecipe.pricePerKG}'),
                                  /*   SizedBox(
                                  width: 5.w,
                                ),
                                grey14w400(data: '\$158.33')*/
                                ],
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              black14w500(data: 'Quantity'),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      plansViewModel.minusQuantity();
                                    },
                                    child: Container(
                                      decoration: ShapeDecoration(
                                        color: CustomColors.whiteColor,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 0.75,
                                              color:
                                                  CustomColors.greyMediumColor),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.remove,
                                          size: 20,
                                          color: CustomColors.greyColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 40.w,
                                      child: Center(
                                          child: black18w500(
                                              data: plansViewModel.getQuantity
                                                  .toString()))),
                                  InkWell(
                                    onTap: () {
                                      plansViewModel.addQuantity();
                                    },
                                    child: Container(
                                      decoration: ShapeDecoration(
                                        color: CustomColors.whiteColor,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 0.75,
                                              color:
                                                  CustomColors.greyMediumColor),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.add,
                                          size: 20,
                                          color: CustomColors.greyColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: plansViewModel.getSelectedRecipe.selectedItemSize != null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            black14w500(data: 'Select Sizes'),
                            SizedBox(
                              height: 20.h,
                            ),
                            Wrap(
                              runSpacing: 10,
                              spacing: 10,
                              children: [
                                for (var sizes
                                    in plansViewModel.getSelectedRecipe.sizes!)
                                  SizedBox(
                                    width: 100.w,
                                    child: customSquareButton(
                                        text: '${sizes.name}',
                                        onPressed: () {
                                          plansViewModel
                                              .setSelectedItemSize(sizes);
                                        },
                                        colored: plansViewModel.getSelectedRecipe.selectedItemSize == sizes? true: false),
                                  )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: black14w500(data: 'Details'),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: grey14w400(
                          lineHeight: true,
                          data: plansViewModel.getSelectedRecipe.description!),
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () {
                      if(context.read<CartViewModel>().getSelectedIndex == null){
                        if(context.read<CartViewModel>().checkProductValidation(recipe: plansViewModel.getSelectedRecipe)){
                          final List<RecipeModel> recipeList = [];
                          plansViewModel.setProductModel();
                          recipeList.add(plansViewModel.getSelectedRecipe);
                          context.read<CartViewModel>().addToCartList(
                            CartModel(
                                recipe: recipeList,
                                puppy: null,
                                deliveryDate: '03 Oct 2023',
                                planType: plansViewModel.getPlanType,
                                planTotal: calculatePlanTotal(
                                    listOfItems: recipeList)),
                          );

                            Navigator.pushNamedAndRemoveUntil(
                                context, bottomNavigationRoute, (route) => false);

                          EasyLoading.showToast(
                              '${plansViewModel.getPlanType} Successfully Added To\nShopping Bag',
                              toastPosition: EasyLoadingToastPosition.center);
                        }
                        else{
                          Navigator.pushNamed(context, cartRoute);
                          descriptionDialog(
                              context: context,
                              description:
                              '${plansViewModel.getSelectedRecipe.name} is already added to shopping bag',
                              height: 180.h,
                              title: 'Alert');
                        }
                      }
                      else{
                        final List<RecipeModel> recipeList = [];
                        plansViewModel.setProductModel();
                        recipeList.add(plansViewModel.getSelectedRecipe);
                        context.read<CartViewModel>().addToCartList(
                          CartModel(
                              recipe: recipeList,
                              puppy: null,
                              deliveryDate: '03 Oct 2023',
                              planType: plansViewModel.getPlanType,
                              planTotal: calculatePlanTotal(
                                  listOfItems: recipeList)),
                        );
                        context.read<CartViewModel>().setSelectedIndex(null);
                        Navigator.pushNamedAndRemoveUntil(
                            context, cartRoute, (Route route) => route.isFirst);
                      }

                    },
                    child: Container(
                        height: 90.h,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          color: CustomColors.orangeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  white18w500(
                                      data:
                                          'AED ${plansViewModel.getSelectedRecipe.pricePerKG! * plansViewModel.getQuantity}'),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  whiteTint14w400(data: 'Total Price')
                                ],
                              ),
                              Spacer(),
                              white18w500(data: 'Add to shopping bag')
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
