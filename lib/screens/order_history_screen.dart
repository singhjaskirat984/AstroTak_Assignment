import 'package:flutter/material.dart';

import '../utilities/size_config.dart';

class OrderHistory extends StatefulWidget {
  static const String id = 'order_history_screen';
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: Colors.white,
        child: const Center(
            child: Text("Page Coming Soon")
        )
    );
  }
}
