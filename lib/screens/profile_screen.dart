import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:brunos_kitchen/view_models/bottom_navigation_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../route_generator.dart';
import '../utils/custom_colors.dart';
import '../utils/enums.dart';
import '../utils/shared_pref .dart';
import '../view_models/address_view_model.dart';
import '../view_models/puppy_view_model.dart';
import '../widgets/app_bar_with_back_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  if (!context
                      .read<AuthViewModel>()
                      .getAuthResponse
                      .data!
                      .isGuest!) {
                    Navigator.pushNamed(context, editProfileRoute);
                  } else {
                    context.read<AuthViewModel>().clearFieldsData();
                    context
                        .read<AuthViewModel>()
                        .setRegisterRouteFrom(Screens.profile.text);
                    Navigator.pushNamed(context, registerUserRoute);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        lightBlack14w400Centre(
                            left: true,
                            data:
                                'Hi, ${context.read<AuthViewModel>().getAuthResponse.data!.fullName}'),
                        SizedBox(
                          height: 10.h,
                        ),
                        Visibility(
                            visible: context
                                .read<AuthViewModel>()
                                .getAuthResponse
                                .data!
                                .isGuest!,
                            child: orange14w400(data: 'Register Now')),
                        grey14w400(
                            data: !context
                                    .read<AuthViewModel>()
                                    .getAuthResponse
                                    .data!
                                    .isGuest!
                                ? context
                                    .read<AuthViewModel>()
                                    .getAuthResponse
                                    .data!
                                    .email!
                                : '')
                      ],
                    ),
                    const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: CustomColors.greyColor,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 39.h,
              ),
              lightBlack14w400Centre(data: 'Account'),
              SizedBox(
                height: 14.h,
              ),
              ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, ordersRoute);
                  },
                  leading: SvgPicture.asset(
                    orderIcon,
                    height: 24.h,
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: lightBlack14w400Centre(data: 'Orders')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                  shape: const Border(
                    bottom: BorderSide(color: CustomColors.greyMediumColor),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: CustomColors.greyColor,
                  )),
              ListTile(
                  onTap: () {
                    context
                        .read<PuppyViewModel>()
                        .setRouteToPuppyFrom(Screens.profile.text);
                    Navigator.pushNamed(context, puppiesListRoute);
                  },
                  leading: SvgPicture.asset(
                    orderIcon,
                    height: 24.h,
                  ),
                  shape: const Border(
                    bottom: BorderSide(color: CustomColors.greyMediumColor),
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: lightBlack14w400Centre(data: 'My Pets')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: CustomColors.greyColor,
                  )),
              ListTile(
                  leading: SvgPicture.asset(
                    payCardIcon,
                    height: 24.h,
                  ),
                  shape: const Border(
                    bottom: BorderSide(color: CustomColors.greyMediumColor),
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: lightBlack14w400Centre(data: 'Payment')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: CustomColors.greyColor,
                  )),
              ListTile(
                  onTap: () {
                    if (context
                            .read<AuthViewModel>()
                            .getAuthResponse
                            .data!
                            .location !=
                        null) {
                      Navigator.pushNamed(context, addressRoute);
                    } else {
                      context.read<AddressViewModel>().setIsAddressAdd(true);
                      Navigator.pushNamed(context, addAddressRoute);
                    }
                  },
                  leading: SvgPicture.asset(
                    mapPin,
                    height: 24.h,
                  ),
                  shape: const Border(
                    bottom: BorderSide(color: CustomColors.greyMediumColor),
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: lightBlack14w400Centre(data: 'Shipping Address')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: CustomColors.greyColor,
                  )),
              SizedBox(
                height: 50.h,
              ),
              lightBlack14w400Centre(data: 'Help & Support'),
              SizedBox(
                height: 14.h,
              ),
              ListTile(
                  leading: SvgPicture.asset(
                    helpIcon,
                    height: 24.h,
                  ),
                  shape: const Border(
                    bottom: BorderSide(color: CustomColors.greyMediumColor),
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: lightBlack14w400Centre(data: 'Get Help')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: CustomColors.greyColor,
                  )),
              ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, faqRoute);
                  },
                  leading: SvgPicture.asset(
                    faqIcon,
                    height: 24.h,
                  ),
                  shape: const Border(
                    bottom: BorderSide(color: CustomColors.greyMediumColor),
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: lightBlack14w400Centre(data: 'FAQ')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: CustomColors.greyColor,
                  )),
              ListTile(
                  leading: SvgPicture.asset(
                    faqIcon,
                    height: 24.h,
                  ),
                  shape: const Border(
                    bottom: BorderSide(color: CustomColors.greyMediumColor),
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: lightBlack14w400Centre(data: 'Blogs')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: CustomColors.greyColor,
                  )),
              ListTile(
                  leading: SvgPicture.asset(
                    faqIcon,
                    height: 24.h,
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: lightBlack14w400Centre(data: 'News Updates')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: CustomColors.greyColor,
                  )),
              SizedBox(
                height: 32.h,
              ),
              Visibility(
                visible: !context
                    .read<AuthViewModel>()
                    .getAuthResponse
                    .data!
                    .isGuest!,
                child: ListTile(
                  onTap: () async {
                    context.read<AuthViewModel>().clearFieldsData();
                    context
                        .read<BottomNavigationViewModel>()
                        .setHomeViewIndex(0);
                    context.read<AuthViewModel>().callLogOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, loginRoute, (route) => false);
                  },
                  leading: SvgPicture.asset(
                    logoutIcon,
                    height: 24.h,
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: orange14w400(data: 'Log out')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
