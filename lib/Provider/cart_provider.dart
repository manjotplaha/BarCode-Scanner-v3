import 'package:barcode_scanner_v3/models/cart_model.dart';
import 'package:barcode_scanner_v3/models/info_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartArticles = [];

  // get ccart => cartItems;

  // double _totalPrice = 0.0;

  void add(Article item) async {
    final url = 'https://inventra-e8f8b.firebaseio.com/item.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': item.items[0].title,
          'upc': item.items[0].upc,
          'brand': item.items[0].brand,
          'quantity': item.items[0].quantity,
        }),
      );
      // _cartArticles.add(item);
      // print(_cartArticles);
      // _totalPrice += item.price;
      notifyListeners();
    } catch (error) {
      print('Error while sending items from db');
      print(error);
      throw error;
    }
  }

  Future<void> fetchAndSetProducts() async {
    final url = 'https://inventra-e8f8b.firebaseio.com/item.json';

    try {
      final response = await http.get(url);
      // print(json.decode(response.body));

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<CartItem> loadedProducts = [];
      extractedData.forEach(
        (prodId, prodData) {
          loadedProducts.add(
            CartItem(
              id: prodId,
              title: prodData['title'],
              upc: prodData['upc'],
              brand: prodData['brand'],
              quantity: prodData['quantity'],
            ),
          );
        },
      );
      _cartArticles = loadedProducts;
      notifyListeners();
    } catch (error) {
      print('Error while loading items from db');
      throw error;
    }
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

  List<CartItem> get cartItems {
    return _cartArticles;
  }
}
