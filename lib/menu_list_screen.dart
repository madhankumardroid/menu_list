import 'package:flutter/material.dart';
import 'package:menu_list/list_item_row.dart';
import 'package:menu_list/summary_screen.dart';
import 'package:provider/provider.dart';
import 'FoodItem.dart';
import 'FoodItems.dart';

class MenuListScreen extends StatelessWidget {
  final List<FoodItem> foodItems;

  MenuListScreen(this.foodItems);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FoodItems>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Salad & Soups')),
      body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: foodItems.length,
                  itemBuilder: (context, index) {
                    return ListItem(foodItems[index]);
                  }),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.shopping_cart),
                  Text("${calculateQuantity(provider.cartItemGetter)} items"),
                  SizedBox(
                    width: 25,
                  ),
                  RaisedButton(
                    onPressed: () {
                      provider.placeOrder();
                      Navigator.pushNamed(context, SummaryScreen.routeName, arguments: provider.cartItemGetter);
                    },
                    child: Text("Place Order"),
                  )
                ],
              ),
            )
          ],
      ),
    );
  }

  String calculateQuantity(List<FoodItem> foodItems) {
    int quantity = 0;
    for (var element in foodItems) {
      quantity += element.quantity;
    }
    print("Cart Items: $quantity");
    return quantity.toString();
  }
}
