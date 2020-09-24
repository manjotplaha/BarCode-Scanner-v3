import 'package:flutter/foundation.dart';

class CartItem {
  String id;
  String title;
  String upc;
  String brand;
  // String model;
  // String color;
  // String size;
  // double price;
  int quantity;

  CartItem(
      {@required this.title,
      @required this.id,
      @required this.brand,
      @required this.upc,
      @required this.quantity});
  // this.model,
  // @required this.color,
  // this.size,
  // @required this.price,
  // @required this.quantity});
}
