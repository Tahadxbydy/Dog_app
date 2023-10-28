import 'package:flutter/cupertino.dart';

import '../widgets/orders_vertical_list_chip_widget.dart';

class MonthlyOrderScreen extends StatelessWidget {
  const MonthlyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
      itemBuilder: (BuildContext context, int index) {
        return ordersVerticalListChipWidget(showButtons: true);
      },
    );
  }
}
