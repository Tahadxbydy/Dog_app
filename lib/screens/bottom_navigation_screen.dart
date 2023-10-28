import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/auth_view_model.dart';
import '../view_models/bottom_navigation_view_model.dart';
import '../view_models/plans_view_model.dart';
import '../widgets/custom_bottombar_widget.dart';
import '../widgets/dialogs/share_your_location_dialog.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<PlansViewModel>()
          .callAllRecipesApi();
      if (context
          .read<AuthViewModel>()
          .getAuthResponse
          .data!
          .location == null
      ) {
        shareYourLocationDialog(context: context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        // appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Consumer<BottomNavigationViewModel>(
              builder: (context, bottomNavigationViewModel, _) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  reverseDuration: const Duration(milliseconds: 1),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: Tween<double>(begin: 1.1, end: 1)
                            .chain(CurveTween(curve: Curves.easeOutCirc))
                            .animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: bottomNavigationViewModel.getHomeView(
                      bottomNavigationViewModel.getHomeViewIndex),
                );
              },
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomBarWidget(),
            )
          ],
        ),
      ),
    );
  }
}
