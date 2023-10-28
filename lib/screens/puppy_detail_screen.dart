import 'package:brunos_kitchen/utils/custom_buttons.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/utils/date_time_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../route_generator.dart';
import '../utils/custom_colors.dart';
import '../utils/images.dart';
import '../view_models/auth_view_model.dart';
import '../view_models/puppy_view_model.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../widgets/dialogs/delete_pet_confirmation_dialog.dart';
import '../widgets/circular_network_image_widget.dart';

class PuppyDetailScreen extends StatelessWidget {
  const PuppyDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PuppyViewModel>(builder: (_, puppyViewModel, __) {
      return Scaffold(
        appBar: AppBarWithBackWidget(
          heading: toBeginningOfSentenceCase(
              '${puppyViewModel.getPuppyDetail!.name} Detail'), showPuppy: false,showCart: true
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Visibility(
                          visible: puppyViewModel.getPuppyDetail!.isDefault!,
                          child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  color: CustomColors.orangeColor),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 2),
                                child: white12w400(data: 'Primary'),
                              )),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                deletePetConfirmationDialog(context: context, name: puppyViewModel.getPuppyDetail!.name!, );
                              },
                              child: Container(
                                decoration: ShapeDecoration(
                                  //color: CustomColors.orangeColor,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.75, color: CustomColors.orangeColor),
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
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    puppyViewModel.getPuppyDetail!.media!.isNotEmpty
                        ? circularNetworkImageWidget(
                            image: puppyViewModel.getPuppyDetail!.media!,
                            size: 130.h)
                        : SizedBox(
                            height: 130.h,
                            width: 130.h,
                            child: CircleAvatar(
                              backgroundColor: CustomColors.yellowColor,
                              child: SvgPicture.asset(dogFace),
                            ),
                          ),
                    SizedBox(
                      height: 10.h,
                    ),
                    black24w500Centre(
                        data: puppyViewModel.getPuppyDetail!.name!),
                    SizedBox(
                      height: 5.h,
                    ),
                    grey14w400(
                        data: '( ${puppyViewModel.getPuppyDetail!.breed!} )'),
                    Visibility(
                      visible: !puppyViewModel.getPuppyDetail!.isDefault!,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              black16w500(data: 'Set As Primary'),
                              Transform.scale(
                                scale: 0.8,
                                child: CupertinoSwitch(
                                  activeColor: CustomColors.orangeColor,
                                  value: puppyViewModel.getPuppyDetail!.isDefault!,
                                  onChanged: (isDefault) {
                                    puppyViewModel.callDefaultPuppyApi().then((
                                        value) async => {
                                      if(value){
                                        puppyViewModel.setIsDefaultPuppyTrueFalse(
                                            isDefault),
                                        context
                                            .read<AuthViewModel>()
                                            .callSplash(showLoader: true),
                                        Navigator.pop(context)
                                      }});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        black14w500(data: 'Gender'),
                        black14w500(data: toBeginningOfSentenceCase(puppyViewModel.getPuppyDetail!.gender)!)
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                   /* Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        black14w500(data: 'Spayed/Neutered?'),
                        black14w500(
                            data: toBeginningOfSentenceCase(
                                puppyViewModel.getPuppyDetail!.isSpayNeuter!
                                    ? 'Yes'
                                    : 'No')!)
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.h,
                    ),*/
                 /*   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        black14w500(data: 'BirthDay'),
                        black14w500(
                            data: puppyViewModel.getPuppyDetail!.bornOnDate! !=
                                    0
                                ? DateTimeFormatter.timeStampToDate(
                                    puppyViewModel.getPuppyDetail!.bornOnDate!)
                                : 'N/A')
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.h,
                    ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        black14w500(data: 'Current Weight'),
                        black14w500(
                            data: puppyViewModel
                                        .getPuppyDetail!.currentWeight! !=
                                    0
                                ? puppyViewModel.getPuppyDetail!.currentWeight!
                                    .toString()
                                : 'N/A')
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                  /*  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        black14w500(data: 'Is Weight?'),
                        black14w500(
                            data: puppyViewModel
                                        .getPuppyDetail!.actualWeight! !=
                                    0
                                ? puppyViewModel.getPuppyDetail!.actualWeight!
                                    .toString()
                                : 'N/A')
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.h,
                    ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        black14w500(data: 'Activity Level'),
                        black14w500(
                            data: toBeginningOfSentenceCase(
                                puppyViewModel.getPuppyDetail!.activityLevel!)!)
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        black14w500(data: 'Feeding Routine Per Day'),
                        black14w500(
                            data: puppyViewModel.getPuppyDetail!.feedingRoutine!.toString())
                      ],
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: customButton(
                    text: 'Edit',
                    onPressed: () {
                      Navigator.pushNamed(context, puppyCreationRoute);
                    },
                    colored: true),
              ),
            ),
          ],
        ),
      );
    });
  }
}
