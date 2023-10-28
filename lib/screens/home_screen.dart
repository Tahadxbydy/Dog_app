import 'package:accordion/accordion.dart';
import 'package:accordion/accordion_section.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:brunos_kitchen/view_models/address_view_model.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:brunos_kitchen/view_models/cart_view_model.dart';
import 'package:brunos_kitchen/view_models/plans_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../utils/food_category_list_data.dart';
import '../route_generator.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../utils/enums.dart';
import '../view_models/puppy_view_model.dart';
import '../widgets/carousels/home_carousel_widget.dart';
import '../widgets/cart_icon_widget.dart';
import '../widgets/cart_vertical_list_chip_widget.dart';
import '../widgets/circular_network_image_widget.dart';
import '../widgets/deafult_puppy_icon_widget.dart';
import '../widgets/dialogs/address_label_dialog.dart';
import '../widgets/dialogs/discription_dialog.dart';
import '../widgets/food_category_grid_chip_widget.dart';
import '../widgets/item_discribed_grid_chip_widget.dart';
import '../widgets/food_grid_chip_widget.dart';
import '../widgets/shop_items_horizontal_list_chip_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColorShade,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 80),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (context
                                .read<AuthViewModel>()
                                .getAuthResponse
                                .data!
                                .location !=
                            null) {
                          Navigator.pushNamed(context, addressRoute);
                        } else {
                          context
                              .read<AddressViewModel>()
                              .setIsAddressAdd(true);
                          Navigator.pushNamed(context, addAddressRoute);
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              purple10w500Centre(data: 'LOCATION'),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: CustomColors.purpleColor,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 260.w,
                            child: lightBlack14w400Centre(
                                left: true,
                                data: context
                                            .watch<AuthViewModel>()
                                            .getAuthResponse
                                            .data!
                                            .location !=
                                        null
                                    ? context
                                        .watch<AuthViewModel>()
                                        .getAuthResponse
                                        .data!
                                        .location!
                                        .address!
                                    : 'Tap to set Your Location'),
                          )
                        ],
                      ),
                    ),
                    cartIconWidget(),
                    defaultPuppyIconWidget(),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 200.w,
                child: const HomeCarouselWidget(),
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                decoration:
                    BoxDecoration(gradient: CustomColors.linearGradient1),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: black24w500Centre(
                          data:
                              'Trademarked Nutrient Blends, Exclusively Crafted For Your Pup\'s Special Needs.'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: lightBlack14w400Centre(
                          data:
                              'Sharing your love for pets and their wellbeing, we at Bruno\'s Kitchen have crafted a service that brings balanced, freshly-prepared pet food right to your doorstep. Our simple yet nutritious recipes are scientifically formulated and made with utmost love, because we believe your furry friends deserve the very best.'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GridView.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 20.0,
                              childAspectRatio: (1 / 0.75)),
                      itemCount: foodCategoryList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return foodCategoryGridChipWidget(
                            listItems: foodCategoryList[index]);
                      },
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: black24w500Centre(
                          data: 'Dive Into A World Of Paw-Licking Goodness'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: lightBlack14w400Centre(
                    data: 'Check out our delicious doggie dishes'),
              ),
              SizedBox(height: 20.h),
              Wrap(
                runSpacing: 20,
                spacing: 20,
                alignment: WrapAlignment.center,
                children: List.generate(
                    context
                        .watch<PlansViewModel>()
                        .getFeaturedRecipesList
                        .length, (index) {
                  return SizedBox(
                    width: 157.w,
                    child: foodGridChipWidget(
                        recipeDetail: context
                            .watch<PlansViewModel>()
                            .getFeaturedRecipesList[index]),
                  );
                }),
              ),
              /* GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: (1 / 1)),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return foodGridChipWidget();
                },
              ),*/
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: customButton(
                    text: 'Design Your Doggo\'s Delicious Diet Now',
                    onPressed: () {
                      if (context
                              .read<AuthViewModel>()
                              .getAuthResponse
                              .data!
                              .petsCount ==
                          0) {
                        context
                            .read<PuppyViewModel>()
                            .setRouteToPuppyFrom(Screens.home.text);
                        context.read<PuppyViewModel>().clearPuppyData();
                        Navigator.pushNamed(context, puppyCreationRoute);
                      } else {
                        Navigator.pushNamed(context, choosePlanRoute);
                      }
                    },
                    colored: true),
              ),
              SizedBox(height: 40.h),
              black24w500Centre(data: 'Our Pawfect Process'),
              SizedBox(height: 15.h),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 36.w,
                          height: 36.w,
                          decoration: ShapeDecoration(
                            color: CustomColors.lightBrownColor,
                            shape: OvalBorder(),
                          ),
                          child: Center(child: white18w500(data: '1')),
                        ),
                        const Dash(
                            direction: Axis.vertical,
                            length: 120,
                            dashLength: 10,
                            dashColor: CustomColors.brownColor),
                      ],
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 36.w,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: black18w500(data: 'Get Personal'))),
                          lightBlack14w400Centre(
                              left: true,
                              data:
                                  'Share details about your beloved pet. We deliver human-grade food in user-friendly packaging - minimal processing, stringent safety norms, and easy-to-serve: just open and serve!')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 36.w,
                          height: 36.w,
                          decoration: ShapeDecoration(
                            color: CustomColors.lightBrownColor,
                            shape: OvalBorder(),
                          ),
                          child: Center(child: white18w500(data: '2')),
                        ),
                        const Dash(
                            direction: Axis.vertical,
                            length: 120,
                            dashLength: 10,
                            dashColor: CustomColors.brownColor),
                      ],
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 36.w,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: black18w500(data: 'Choose Wisely'))),
                          lightBlack14w400Centre(
                              left: true,
                              data:
                                  'Vet-designed plans tailored to your dog\'s unique needs. Pre-prepared and portioned meals calculated according to the profile you create, satisfying their calorie requirements with precision')
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: ShapeDecoration(
                        color: CustomColors.lightBrownColor,
                        shape: OvalBorder(),
                      ),
                      child: Center(child: white18w500(data: '3')),
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 36.w,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child:
                                      black18w500(data: 'Witness the Woofs'))),
                          lightBlack14w400Centre(
                              left: true,
                              data:
                                  'Get ready for your pet\'s joy as their food arrives just days after cooking - never deep-frozen or shelf-stored for months. Watch them light up with Bruno\'s Kitchen!')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Image.asset(dogBanner),
              ),
              SizedBox(
                height: 20.h,
              ),
              SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                //  itemCount: 3,
                /* itemBuilder: (BuildContext context, int index) =>*/
                child: Row(
                  children: context
                      .watch<PlansViewModel>()
                      .getFeaturedProductList
                      .map(
                        (data) => Container(
                          margin: const EdgeInsets.only(right: 20),
                          width: 159.w,
                          child: shopItemsHorizontalListChipWidget(
                              productDetail: data),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              black24w500Centre(data: 'Frequently Asked Questions'),
              SizedBox(
                height: 20.h,
              ),
              Accordion(
                disableScrolling: true,
                paddingListHorizontal: 20,
                maxOpenSections: 2,
                headerBackgroundColorOpened: Colors.black54,
                scaleWhenAnimating: true,
                openAndCloseAnimation: true,
                headerPadding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                // sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                // sectionClosingHapticFeedback: SectionHapticFeedback.light,
                children: [
                  AccordionSection(
                    // isOpen: false,
                    // flipRightIconIfOpen: true,
                    rightIcon: Icon(Icons.keyboard_arrow_down),
                    // leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
                    headerBackgroundColor: CustomColors.whiteColor,
                    headerBackgroundColorOpened: CustomColors.whiteColor,
                    header: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: lightBlack14w400Centre(
                              data: 'About Bruno’s Kitchen')),
                    ),
                    content: black12w500Centre(
                        data:
                            'When you start and order you can cancel it by clicking the logo on home page. You can find cancel button there.'),
                    contentHorizontalPadding: 20,
                    contentBorderWidth: 1,
                    // onOpenSection: () => print('onOpenSection ...'),
                    // onCloseSection: () => print('onCloseSection ...'),
                  ),
                  AccordionSection(
                    // isOpen: true,
                    // flipRightIconIfOpen: true,
                    rightIcon: Icon(Icons.keyboard_arrow_down),
                    // leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
                    headerBackgroundColor: CustomColors.whiteColor,
                    headerBackgroundColorOpened: CustomColors.whiteColor,
                    header: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: lightBlack14w400Centre(
                              data: 'About Bruno’s Kitchen')),
                    ),
                    content: black12w500Centre(
                        data:
                            'When you start and order you can cancel it by clicking the logo on home page. You can find cancel button there.'),
                    contentHorizontalPadding: 20,
                    contentBorderWidth: 1,
                    // onOpenSection: () => print('onOpenSection ...'),
                    // onCloseSection: () => print('onCloseSection ...'),
                  ),
                  AccordionSection(
                    // isOpen: true,
                    // flipRightIconIfOpen: true,
                    rightIcon: Icon(Icons.keyboard_arrow_down),
                    // leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
                    headerBackgroundColor: CustomColors.whiteColor,
                    headerBackgroundColorOpened: CustomColors.whiteColor,
                    header: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: lightBlack14w400Centre(
                              data: 'About Bruno’s Kitchen')),
                    ),
                    content: black12w500Centre(
                        data:
                            'When you start and order you can cancel it by clicking the logo on home page. You can find cancel button there.'),
                    contentHorizontalPadding: 20,
                    contentBorderWidth: 1,
                    // onOpenSection: () => print('onOpenSection ...'),
                    // onCloseSection: () => print('onCloseSection ...'),
                  ),
                  AccordionSection(
                    //isOpen: true,
                    //  flipRightIconIfOpen: true,
                    rightIcon: Icon(Icons.keyboard_arrow_down),
                    // leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
                    headerBackgroundColor: CustomColors.whiteColor,
                    headerBackgroundColorOpened: CustomColors.whiteColor,
                    header: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: lightBlack14w400Centre(
                              data: 'About Bruno’s Kitchen')),
                    ),
                    content: black12w500Centre(
                        data:
                            'When you start and order you can cancel it by clicking the logo on home page. You can find cancel button there.'),
                    contentHorizontalPadding: 20,
                    contentBorderWidth: 1,
                    // onOpenSection: () => print('onOpenSection ...'),
                    // onCloseSection: () => print('onCloseSection ...'),
                  ),
                  AccordionSection(
                    // isOpen: true,
                    // flipRightIconIfOpen: true,
                    rightIcon: Icon(Icons.keyboard_arrow_down),
                    // leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
                    headerBackgroundColor: CustomColors.whiteColor,
                    headerBackgroundColorOpened: CustomColors.whiteColor,
                    header: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: lightBlack14w400Centre(
                              data: 'About Bruno’s Kitchen')),
                    ),
                    content: black12w500Centre(
                        data:
                            'When you start and order you can cancel it by clicking the logo on home page. You can find cancel button there.'),
                    contentHorizontalPadding: 20,
                    contentBorderWidth: 1,
                    // onOpenSection: () => print('onOpenSection ...'),
                    // onCloseSection: () => print('onCloseSection ...'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
