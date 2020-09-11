import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:barcode_scanner_v3/models/info_model.dart';

class ScannedProducts with ChangeNotifier {
  List<Article> _scannedProducts = [];

  void addProductInScannedProductsProvider(Article item) {
    _scannedProducts.add(item);
    notifyListeners();
  }

  List<Article> get scannedProducts {
    return [..._scannedProducts];
  }
}
