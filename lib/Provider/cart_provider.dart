import 'package:barcode_scanner_v3/models/info_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Article> _cartArticles = [];

  // get ccart => cartItems;

  // double _totalPrice = 0.0;

  void add(Article item) {
    _cartArticles.add(item);
    print(_cartArticles);
    // _totalPrice += item.price;
    notifyListeners();
  }

  void remove(Article item) {
    _cartArticles.remove(item);
    // _totalPrice -= item.price;
    notifyListeners();
  }

  int get count {
    notifyListeners();
    return _cartArticles.length;
  }

  // double get totalPrice {
  //   return _totalPrice;
  // }

  List<Article> get cartItems {
    return _cartArticles;
  }
}
