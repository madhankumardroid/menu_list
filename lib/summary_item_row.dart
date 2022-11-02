import 'package:flutter/material.dart';
import 'package:menu_list/FoodItem.dart';
import 'package:menu_list/FoodItems.dart';
import 'package:provider/provider.dart';


class SummaryItem extends StatelessWidget {
  final FoodItem cartItem;

  SummaryItem(this.cartItem);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FoodItems>(context);
    return Container(
      child : Column(
        children: [
          Row(
            children: [
              Text(cartItem.title),
              Container(
                child: Row(
                  children: [
                    InkWell(
                      child: Text('-'),
                      onTap: () {},
                    ),
                    Text(''),
                    InkWell(
                      child: Text('-'),
                      onTap: () {},
                    )
                  ],
                ),
              )
            ],
          )

        ],
      )
    );
  }
}
