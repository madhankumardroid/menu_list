import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FoodItem.dart';
import 'FoodItems.dart';

class ListItem extends StatelessWidget {
  final FoodItem foodItem;

  ListItem(this.foodItem);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FoodItems>(context, listen: true);
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)),
              width: 100,
              height: 100,
              child: Image.asset(
                foodItem.imageUri,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(foodItem.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15)),
              Text(foodItem.description,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black45,
                      fontSize: 13)),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                Icon(
                Icons.energy_savings_leaf,
              ),
              Text("\$${foodItem.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15)),
              // Expanded(child: buildContainer(foodItem, provider))
              ],
            )
          ],
        ),
      )
      ],
    ),)
    ,
    );
  }

  Widget buildContainer(FoodItem foodItem, FoodItems provider) {
    if (foodItem.quantity == 0) {
      return OutlinedButton(
        onPressed: () {
          provider.addQuantity(1, foodItem);
        },
        style: OutlinedButton.styleFrom(
          primary: Colors.green,
          backgroundColor: Colors.white,
        ),
        child: const Text("Add"),
      );
    }
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.green,
      ),
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
                onPressed: () {
                  provider.decreasaeQuantity(1, foodItem);
                },
                child: Text('-')),
          ),
          Expanded(child: Text(foodItem.quantity.toString())),
          Expanded(
            child: FlatButton(
                onPressed: () {
                  provider.addQuantity(1, foodItem);
                },
                child: Text('+')),
          ),
        ],
      ),
    );
  }
}
