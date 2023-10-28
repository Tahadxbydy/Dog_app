import 'package:brunos_kitchen/utils/images.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/custom_colors.dart';





class ProductCarouselWidget extends StatefulWidget {
  final List<String> productImages;
  const ProductCarouselWidget({Key? key, required this.productImages}) : super(key: key);

  @override
  _ProductCarouselWidgetState createState() => _ProductCarouselWidgetState();
}

class _ProductCarouselWidgetState extends State<ProductCarouselWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: [for ( var image in widget.productImages ) Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: CustomColors.greyMediumLightColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(image,))],
          carouselController: _controller,
          options: CarouselOptions(
              height: 300.h,
              autoPlay: true,
              viewportFraction: 0.90.w,
              enlargeCenterPage: true,
              aspectRatio: 1.5,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      SizedBox(height: 5.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.productImages.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 7.0,
              height: 7.0,
              margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : CustomColors.orangeColor)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
