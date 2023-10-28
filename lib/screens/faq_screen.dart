import 'package:accordion/accordion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../widgets/app_bar_with_back_widget.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackWidget(
        heading: 'FAQ', showPuppy: false,showCart: true
      ),
      body: Accordion(
        disableScrolling: true,
        paddingListHorizontal: 20,
        maxOpenSections: 2,
        headerBackgroundColorOpened: Colors.black54,
        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        // sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        // sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
            // isOpen: false,
            //flipRightIconIfOpen: true,
            rightIcon: Icon(Icons.keyboard_arrow_down),
            // leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
            headerBackgroundColor: CustomColors.whiteColor,
            headerBackgroundColorOpened: CustomColors.whiteColor,
            header: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: lightBlack14w400Centre(data: 'About Bruno’s Kitchen')),
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
                  child: lightBlack14w400Centre(data: 'About Bruno’s Kitchen')),
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
                  child: lightBlack14w400Centre(data: 'About Bruno’s Kitchen')),
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
                  child: lightBlack14w400Centre(data: 'About Bruno’s Kitchen')),
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
            //flipRightIconIfOpen: true,
            rightIcon: Icon(Icons.keyboard_arrow_down),
            // leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
            headerBackgroundColor: CustomColors.whiteColor,
            headerBackgroundColorOpened: CustomColors.whiteColor,
            header: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: lightBlack14w400Centre(data: 'About Bruno’s Kitchen')),
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
    );
  }
}
