import 'package:brunos_kitchen/screens/monthly_order_screen.dart';
import 'package:brunos_kitchen/screens/order_completed_screen.dart';
import 'package:brunos_kitchen/screens/order_inprocess_screen.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/custom_colors.dart';
import '../widgets/app_bar_with_back_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController!.addListener(_getActiveTabIndex);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  void _getActiveTabIndex() {
    setState(() {
      _selectedIndex = tabController!.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWithBackWidget(
          heading: 'My Orders', showPuppy: false,showCart: true
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            TabBar(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              isScrollable: true,
              onTap: (index) {
                //your currently selected index
              },
              controller: tabController,
              tabs: [
                Tab(
                    child: Container(
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0
                              ? CustomColors.orangeColorTint
                              : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 40.h,
                        width: 170.w,
                        child: Center(
                            child: lightBlack14w400Centre(data: 'In Process')))),
                Tab(
                    child: Container(
                        decoration: BoxDecoration(
                          color: _selectedIndex == 1
                              ? CustomColors.orangeColorTint
                              : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 40.h,
                        width: 170.w,
                        child: Center(
                            child: lightBlack14w400Centre(data: 'Completed')))),
                Tab(
                    child: Container(
                        decoration: BoxDecoration(
                          color: _selectedIndex == 2
                              ? CustomColors.orangeColorTint
                              : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 40.h,
                        width: 170.w,
                        child: Center(
                            child: lightBlack14w400Centre(data: 'Monthly Subscription')))),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  OrderInProcessScreen(),
                  OrderCompletedScreen(),
                  MonthlyOrderScreen()
                ],
              ),
            ),
          ],
        ));
  }
}
