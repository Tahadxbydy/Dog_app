import 'dart:async';

import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locator;
import 'package:provider/provider.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/enums.dart';
import '../utils/images.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../view_models/address_view_model.dart';
import '../widgets/dialogs/address_label_dialog.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AddressViewModel>().addMarkers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressViewModel>(
        builder: (context, addressViewModel, child) {
      return Scaffold(
        appBar: AppBarWithBackWidget(
          heading:
              addressViewModel.getIsAddressAdd ? 'Add Address' : 'Edit Address', showPuppy: false, showCart: true,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    padding: const EdgeInsets.only(top: 70.0, right: 10),
                    zoomControlsEnabled: false,
                    //liteModeEnabled: true,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    mapType: MapType.terrain,
                    onCameraMove: (position) {
                      addressViewModel.setInitialCameraPosition(LatLng(
                          position.target.latitude,
                          position.target.longitude));
                    },
                    onCameraIdle: () {
                      addressViewModel.convertCoordinatesToPlaces();
                    },
                    initialCameraPosition: CameraPosition(
                        target: addressViewModel.getInitialCameraPosition),
                    markers:
                  //  Set<Marker>.of(addressViewModel.getUserMarker),
                    <Marker>{
                      Marker(
                        onDragEnd: ((newPosition) {
                          addressViewModel.updateMapCameraPosition(LatLng(
                              newPosition.latitude, newPosition.longitude));
                        }),
                        draggable: true,
                        markerId: const MarkerId("1"),
                        position: addressViewModel.getInitialCameraPosition,
                        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
                        infoWindow: const InfoWindow(
                          title: '',
                        ),
                      )
                    },
                    onMapCreated: addressViewModel.getUserLocation,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: !addressViewModel.getIsAddressAdd,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          /* addressViewModel
                        .callDeleteAddressApi()
                        .then((value) {
                      if (value) {
                        Navigator.pop(context);
                        context
                            .read<AuthViewModel>()
                            .setSelectedAddress(addressViewModel
                                .getAllAddressResponse
                                .data!
                                .defaultAddress!);
                      }
                });*/
                        },
                        child: black14w500(data: 'Delete Address'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller:
                        addressViewModel.getAddressController,
                    decoration: const InputDecoration(
                      fillColor: CustomColors.whiteColor,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      // border: const OutlineInputBorder(),
                      hintText: 'Search Location',
                    ),
                    onChanged: (value) {
                      if (addressViewModel.getDebounce != null) {
                        addressViewModel.getDebounce!.cancel();
                      }
                      addressViewModel.setDebounce(
                          Timer(const Duration(milliseconds: 1000), () {
                        if (value.isNotEmpty) {
                          addressViewModel.autoCompleteSearch(value);
                        }
                      }));
                    },
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Visibility(
                  visible: addressViewModel.getPrediction.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      elevation: 5,
                      color: CustomColors.orangeColorTint,
                      borderOnForeground: false,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(10.0.r)),
                        side: const BorderSide(
                          color:  CustomColors.yellowColor,
                          width: 1.0,
                        ),
                      ),
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.h, vertical: 5.h),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount:
                              addressViewModel.getPrediction.length,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return Card(
                                elevation: 5,
                                color: CustomColors.lightGreyColor,
                                borderOnForeground: false,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0.r)),
                                  side: const BorderSide(
                                    color:  CustomColors.yellowColor,
                                    width: 1.0,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    addressViewModel
                                        .setSelectedPrediction(
                                            addressViewModel
                                                .getPrediction[index]);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(addressViewModel
                                        .getPrediction[index]
                                        .description!),
                                  ),
                                ));
                          }),
                    ),
                  ),
                ),
                const Spacer(),
                Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: customButton(
                        text: addressViewModel.getIsAddressAdd
                            ? 'Next'
                            : 'Update',
                        onPressed: () async {
                          if (addressViewModel.validateAddressDetail()) {
                            if (addressViewModel.getIsAddressAdd) {
                              Navigator.pushNamed(context, addAddressDetailRoute);
                            } /*else {
                            await addressViewModel
                                .callUpdateAddressApi()
                                .then((value) {
                              if (value) {
                                Navigator.pop(context);
                                context
                                    .read<AuthViewModel>()
                                    .setSelectedAddress(addressViewModel
                                        .getAllAddressResponse
                                        .data!
                                        .defaultAddress!);
                              }
                            });
                          }*/
                          } else {
                            EasyLoading.showToast('Please Fill All Fields');
                          }
                        },
                        colored: true),
                  ),
                ),

                /*Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller:
                        addressViewModel.getFullAddressController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      fillColor: CustomColors.whiteColor,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      // border: const OutlineInputBorder(),
                      hintText: 'Enter Flat/House Number',
                    ),
                  ),
                ),*/
              ],
            ),

          ],
        ),
      );
    });
  }
}
