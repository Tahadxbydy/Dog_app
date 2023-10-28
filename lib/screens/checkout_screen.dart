import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/view_models/address_view_model.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:brunos_kitchen/view_models/cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../utils/enums.dart';
import '../utils/images.dart';
import '../view_models/plans_view_model.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../widgets/dialogs/discription_dialog.dart';
import '../widgets/redeem_paw_points_bottom_sheet_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlansViewModel>(builder: (context, plansViewModel, child) {
      return Scaffold(
        appBar: AppBarWithBackWidget(
          heading:'CheckOut', showPuppy: false,showCart: false
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, top: 20, bottom: 220),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Image.asset(
                        buyBulits3,
                        height: 57.h,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    black24w500Centre(data: 'Checkout'),
                    SizedBox(
                      height: 10.h,
                    ),
                    lightBlack14w400Centre(
                        data:
                            'You’re just two clicks away to serve up the finest meals tailored for your fluffy companion\'s ultimate joy'),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: CustomColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: CustomColors.greyColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  mapPin,
                                  color: CustomColors.orangeColor,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                lightBlack14w400Centre(data: 'Delivery Address'),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),

                            context
                                .read<AuthViewModel>()
                                .getAuthResponse
                                .data!
                                .location != null?SizedBox(
                              height: 130.h,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child:
                                GoogleMap(
                                 // zoomControlsEnabled: false,
                                  //liteModeEnabled: true,
                                 // myLocationEnabled: true,
                                 // myLocationButtonEnabled: true,
                                  mapType: MapType.terrain,
                                  onCameraMove: (position) {
                                    LatLng(position.target.latitude,
                                        position.target.longitude);
                                  },
                                  initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                          double.parse(context
                                              .read<AuthViewModel>()
                                              .getAuthResponse
                                              .data!
                                              .location!
                                              .coordinates![0]),
                                          double.parse(context
                                              .read<AuthViewModel>()
                                              .getAuthResponse
                                              .data!
                                              .location!
                                              .coordinates![1]))),
                                  markers: <Marker>{
                                    Marker(
                                      markerId: const MarkerId("1"),
                                      position: LatLng(
                                          double.parse(context
                                              .read<AuthViewModel>()
                                              .getAuthResponse
                                              .data!
                                              .location!
                                              .coordinates![0]),
                                          double.parse(context
                                              .read<AuthViewModel>()
                                              .getAuthResponse
                                              .data!
                                              .location!
                                              .coordinates![1])),
                                      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
                                      infoWindow: const InfoWindow(
                                        title: '',
                                      ),
                                    )
                                  },
                                  onMapCreated: context
                                      .read<AddressViewModel>()
                                      .getUserLocation,
                                ),
                              ),
                            ): Container(),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: 240.w,
                                        child: black18w500(
                                            data: context
                                                .read<AuthViewModel>()
                                                .getAuthResponse
                                                .data!
                                                .location != null? context
                                                .read<AuthViewModel>()
                                                .getAuthResponse
                                                .data!
                                                .location!
                                                .address!: 'Click to add Address')),
                                    SizedBox(
                                        width: 240.w,
                                        child: lightBlack14w400Centre(
                                            left: true,
                                            data: context
                                                .read<AuthViewModel>()
                                                .getAuthResponse
                                                .data!
                                                .location != null? context
                                                .read<AuthViewModel>()
                                                .getAuthResponse
                                                .data!
                                                .location!
                                                .flatHouseNumber!:''))
                                  ],
                                ),
                                InkWell(
                                  onTap: () {context
                                      .read<AuthViewModel>()
                                      .getAuthResponse
                                      .data!
                                      .location != null?
                                    Navigator.pushNamed(context, addressRoute):
                                  Navigator.pushNamed(context, addAddressRoute);
                                  },
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      color: CustomColors.whiteColor,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 0.75,
                                            color:
                                                CustomColors.greyMediumColor),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        context
                                            .read<AuthViewModel>()
                                            .getAuthResponse
                                            .data!
                                            .location != null? Icons.edit: Icons.add,
                                        size: 20,
                                        color: CustomColors.orangeColor,
                                      ),
                                    ),
                                  ),
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
                    Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: CustomColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: CustomColors.greyColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(payCardIcon),
                            SizedBox(
                              width: 2.w,
                            ),
                            lightBlack14w400Centre(data: 'Payment method'),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                              color: CustomColors.greyColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: CustomColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: CustomColors.greyColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            black18w500(data: 'Order Summary'),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                lightBlack14w400Centre(data: 'Subtotal'),
                                SizedBox(
                                  width: 2.w,
                                ),
                                lightBlack14w400Centre(data: 'AED ${context.watch<CartViewModel>().getCartTotalPrice}'),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                lightBlack14w400Centre(data: 'Shipping Fee'),
                                SizedBox(
                                  width: 2.w,
                                ),
                                lightBlack14w400Centre(
                                    data: '10 AED (One time  Fee)'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    InkWell(
                      onTap: () {
                        redeemPawPointsBottomSheetWidget();
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          color: CustomColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: CustomColors.greyColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                couponCoin,
                                height: 40.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  black12w500Centre(
                                      data: 'Your accumulated Paw Points'),
                                  black16w500(data: '64468'),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                                color: CustomColors.greyColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: CustomColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: CustomColors.greyColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            black18w500(data: 'Enter your Promo code here'),
                            SizedBox(
                              height: 17.h,
                            ),
                            lightBlack14w400Centre(
                                left: true,
                                data:
                                    'You can only use your PawPoints or a Promo Code per transaction. Promo codes are one-time use only.'),
                            SizedBox(
                              height: 17.h,
                            ),
                            Row(
                              children: [
                                lightBlack14w400Centre(data: 'Generate coupon code'),
                                const Spacer(),
                                InkWell(
                                  onTap: (){
                                    descriptionDialog(
                                        context: context,
                                        description:
                                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic',
                                        height: 300, title: 'Description');
                                  },
                                    child: orange14w400(data: 'How it works?')),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: ShapeDecoration(
                                color: CustomColors.greyMediumLightColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(couponIcon),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    lightBlack14w400Centre(data: 'ME432DW'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: ShapeDecoration(
                                color: CustomColors.whiteColor,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 0.50,
                                      color: CustomColors.greyColor),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: lightBlack14w400Centre(
                                    data: 'Apply coupon code'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                      Row(
                        children: [
                          lightBlack14w400Centre(data: 'Total'),
                          const Spacer(),
                          black16w500(data: 'AED ${context.watch<CartViewModel>().getCartTotalPrice + 10}')
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          lightBlack14w400Centre(data: 'Points Rewarded Amount'),
                          const Spacer(),
                          black16w500(data: '5')
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      customButton(
                          text: 'Place Order',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, orderConfirmationRoute);
                          },
                          colored: true),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
