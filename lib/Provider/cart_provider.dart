import 'package:barcode_scanner_v3/models/info_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartProvider extends ChangeNotifier {
  List<Article> _cartArticles = [];

  // get ccart => cartItems;

  // double _totalPrice = 0.0;

  void add(Article item) {
    final url = 'https://inventra-e8f8b.firebaseio.com/item.json';
    http
        .post(
      url,
      body: json.encode({
        'title': item.items[0].title,
        'upc': item.items[0].upc,
        'brand': item.items[0].brand,
      }),
    )
        .then((response) {
      _cartArticles.add(item);
      print(_cartArticles);
      // _totalPrice += item.price;
      notifyListeners();
    });
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
