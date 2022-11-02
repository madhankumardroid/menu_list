import 'package:flutter/material.dart';
import 'package:menu_list/FoodItem.dart';
import 'package:menu_list/summary_item_row.dart';
import 'package:provider/provider.dart';

import 'FoodItems.dart';

class SummaryScreen extends StatelessWidget {
  static String routeName = "summary-screen";

  const SummaryScreen();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FoodItems>(context);
    final arguments =
        ModalRoute.of(context)?.settings.arguments as List<FoodItem>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Place Order'),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return SummaryItem(arguments[index]);
          })),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [Text('Total: '), Text("\$${provider.totalPrice}")],
            ),
          )
        ],
      ),
    );
  }
}
