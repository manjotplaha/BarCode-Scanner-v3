import 'dart:convert';
import 'package:barcode_scanner_v3/models/info_model.dart';
import 'package:http/http.dart';

Future<String> lookUp(var _scanBarcode) async {
  // String url = 'https://api.upcitemdb.com/prod/trial/lookup?upc=$_scanBarcode';
  String url = 'https://api.upcitemdb.com/prod/trial/lookup?upc=0885909950805';
  try {
    Response response = await get(url);
    final convertDataToJson = json.decode(response.body);
    Article article = Article.fromJson(convertDataToJson);
    print('duhhhhhhh');
    print(article.item[0].title);
  } catch (e) {
    print(e.toString());
  }
  return 'Success';
}
