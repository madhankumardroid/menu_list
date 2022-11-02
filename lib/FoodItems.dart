import 'package:flutter/material.dart';
import 'package:menu_list/FoodItem.dart';

import 'data.dart';

class FoodItems with ChangeNotifier {
  final List<FoodItem> _foodItems = sampleFoodItems;
  final List<FoodItem> _cartItems = [];
  double totalPrice = 0.0;
  List<FoodItem> get foodItemGetter => _foodItems;
  List<FoodItem> get cartItemGetter => _cartItems;

  FoodItems();

  void addQuantity(int quantity, FoodItem foodItem) {
    if (!_cartItems.contains(foodItem)) {
      foodItem.quantity = quantity;
      _cartItems.add(foodItem);
    } else {
      increaseQuantity(foodItem, quantity);
    }

    increaseQuantity(foodItem, quantity);
    _cartItems.forEach((element) {totalPrice = totalPrice + element.quantity * element.price;});
    notifyListeners();
  }

  void increaseQuantity(FoodItem foodItem, int quantity) {
    var item =
        _foodItems.where((element) => element.id == foodItem.id).first;
    int existingQuantity = item.quantity;
    item.quantity = existingQuantity + quantity;
  }

  void decreasaeQuantity(int quantity, FoodItem foodItem) {
    var foodItemToAdd =
        _foodItems.where((element) => element.id == foodItem.id).first;
    int existingQuantity = foodItemToAdd.quantity;
    if (existingQuantity > 0) {
      foodItemToAdd.quantity = existingQuantity - quantity;
      var cartItem = _cartItems.where((element) => element.id == foodItem.id).first;
      cartItem.quantity = cartItem.quantity - quantity;
    }
    _cartItems.forEach((element) {totalPrice = totalPrice - element.quantity * element.price;});
    notifyListeners();
  }

  void placeOrder() {}
}
