import 'dart:convert';
import 'package:barcode_scanner_v3/models/info_model.dart';
import 'package:http/http.dart';

Future<Article> lookUp(_scanBarcode) async {
  // String url = 'https://api.upcitemdb.com/prod/trial/lookup?upc=$_scanBarcode';
  String url =
      'https://api.upcitemdb.com/prod/trial/lookup?upc=0885909950805'; //for testin api
  print('bar code from service ' + _scanBarcode);
  // ignore: avoid_init_to_null
  Article article = null;
  try {
    Response response = await get(url);
    // print(response.body);
    final parsedJson = json.decode(response.body);
    article = Article.fromJson(parsedJson) ?? 'null output';
    print('Article is: ' + article.items[0].title);
    print('Article quantity is ${article.items[0].quantity}');
  } catch (e) {
    print('error occured in article_service.dart');
    print(e.toString());
  }
  return article;
}
