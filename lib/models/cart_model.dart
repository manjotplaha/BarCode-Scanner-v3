import 'package:flutter/material.dart';
import './info_model.dart';

class Cart extends ChangeNotifier {
  List<Article> _cartArticles = [];

  // double _totalPrice = 0.0;

  void add(Article item) {
    _cartArticles.add(item);
    // _totalPrice += item.price;
    notifyListeners();
  }

  void remove(Article item) {
    _cartArticles.remove(item);
    // _totalPrice -= item.price;
    notifyListeners();
  }

  int get count {
    return _cartArticles.length;
  }

  // double get totalPrice {
  //   return _totalPrice;
  // }

  List<Article> get cartItems {
    return _cartArticles;
  }
}
