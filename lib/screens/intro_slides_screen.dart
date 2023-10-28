import 'package:brunos_kitchen/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intro_slider/intro_slider.dart';

import '../route_generator.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';

class IntroSlidesScreen extends StatefulWidget {
  const IntroSlidesScreen({Key? key}) : super(key: key);

  @override
  State<IntroSlidesScreen> createState() => _IntroSlidesScreenState();
}

class _IntroSlidesScreenState extends State<IntroSlidesScreen> {
  List<ContentConfig> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(
      ContentConfig(
        marginDescription: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: 0.0,
        ),        /* styleTitle: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 40.sp,
            color: CustomColors.color2,
            fontWeight: FontWeight.bold),*/
        /* styleDescription: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 15.sp,
          color: CustomColors.color2,
        ),*/
        // title: "Intro Slide 1",
        widgetTitle: Column(
          children: [
            Image.asset(intro1,
              height: 305.h,
              width: 227.w,
            ),
            SizedBox(
              height: 26.h,
            ),
            black32w500Center(data: 'Proud Parent of a'),
            brown32w500(data: 'Doggo?'),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              width: 308.w,
              child: grey14w400HeightCentre(
                  data:
                      'Experience Bruno\'s Kitchen magic, where our Signature Nutrient Blend in every meal boosts your Doggo\'s wellness.'),
            ),
            SizedBox(
              height: 32.h,
            ),
            SvgPicture.asset(introIndicator1)
          ],
        ),
        // widgetDescription: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',),
        // pathImage: "assets/images/logo.png",
        //heightImage: 304,
        // widthImage: 225,
      ),
    );
    slides.add(
      ContentConfig(
        marginDescription: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: 0.0,
        ),
        /* styleTitle: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 40.sp,
            color: CustomColors.color2,
            fontWeight: FontWeight.bold),*/
        /* styleDescription: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 15.sp,
          color: CustomColors.color2,
        ),*/
        // title: "Intro Slide 1",
        widgetTitle: Column(
          children: [
            Image.asset(
              intro2,
              height: 305.h,
              width: 227.w,
            ),
            SizedBox(
              height: 26.h,
            ),
            black32w500Center(data: 'Craft Your Dogg’s'),
            brown32w500(data: 'Perfect Plan'),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              width: 266.w,
              child: grey14w400HeightCentre(
                  data:
                      'Craft the perfect culinary journey for your doggo, customize a meal plan as unique as your furry friend 🐶❤️'),
            ),
            SizedBox(
              height: 32.h,
            ),
            SvgPicture.asset(introIndicator2)
          ],
        ),
        // widgetDescription: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',),
        // pathImage: "assets/images/logo.png",
        //heightImage: 304,
        // widthImage: 225,
      ),
    );
    slides.add(
      ContentConfig(
        marginDescription: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: 0.0,
        ),
        /* styleTitle: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 40.sp,
            color: CustomColors.color2,
            fontWeight: FontWeight.bold),*/
        /* styleDescription: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 15.sp,
          color: CustomColors.color2,
        ),*/
        // title: "Intro Slide 1",
        widgetTitle: Column(
          children: [
            Image.asset(
             intro3,
              height: 305.h,
              width: 227.w,
            ),
            SizedBox(
              height: 26.h,
            ),
            SizedBox(
              width: 286.w,
                child: black32w500Center(data: 'Effortless Convenience')),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              width: 308.w,
              child: grey14w400HeightCentre(
                  data:
                  'Choose meal recipes, prepared and sent on your schedule, as you need.'),
            ),
            SizedBox(
              height: 32.h,
            ),
            SvgPicture.asset(introIndicator3),
            SizedBox(
              height: 49.h,
            ),
            customButton(text: 'Get Started', onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, loginRoute,  (route) => false);
            }, colored: true)
          ],
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      indicatorConfig:
          const IndicatorConfig(colorIndicator: CustomColors.whiteColor),
      backgroundColorAllTabs: CustomColors.whiteColor,
      listContentConfig: slides,
      renderNextBtn: const Icon(
        Icons.arrow_forward,
        color: CustomColors.whiteColor,
        size: 15,
      ),
      isShowDoneBtn: false,
      nextButtonStyle: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFFD68708)),
        overlayColor: MaterialStateProperty.all<Color>(const Color(0xFFD68708)),
      ),
      onSkipPress: () {
        Navigator.pushNamedAndRemoveUntil(
            context, loginRoute,  (route) => false);
      },
     /* onDonePress: () {
        Navigator.pushNamedAndRemoveUntil(
            context, loginRoute, ModalRoute.withName(splashRoute));
      },*/
    );
  }
}
