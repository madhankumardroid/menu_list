class FoodItem {
  String id;
  String imageUri;
  String title;
  double price;
  String description;
  int quantity;

  FoodItem({required this.id, required  this.imageUri, required  this.title, required  this.price, required  this.description,  this.quantity = 0});
}