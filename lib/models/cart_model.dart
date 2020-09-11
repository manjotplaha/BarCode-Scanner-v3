import 'package:flutter/foundation.dart';

class CartItem {
  String title;
  String brand;
  String model;
  String color;
  String size;
  double price;
  int quantity;

  CartItem(
      {@required this.title,
      this.brand,
      this.model,
      @required this.color,
      this.size,
      @required this.price,
      @required this.quantity});
}
