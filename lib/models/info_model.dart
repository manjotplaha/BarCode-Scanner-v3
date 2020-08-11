class Article {
  List<Items> item;

  Article({this.item});

  factory Article.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    List<Items> item = list.map((i) => Items.fromJson(i)).toList();

    return Article(item: item);
  }
}

class Items {
  // String ean;
  String title;
  String description;
  String upc;
  // String brand;
  // String model;
  String color;
  String size;
  String category;
  // ignore: non_constant_identifier_names
  double lowest_rec_price;
  // ignore: non_constant_identifier_names
  double highest_rec_price;

  Items({
    // {this.ean,
    this.title,
    this.description,
    this.upc,
    // this.brand,
    // this.model,
    // this.color,
    // this.size,
    // this.category,
    // ignore: non_constant_identifier_names
    // this.lowest_rec_price,
    // ignore: non_constant_identifier_names
    // this.highest_rec_price
  });

  factory Items.fromJson(Map<String, dynamic> parsedJson) {
    return Items(
      // // ean: parsedJson['ean'] ?? '[null]',
      title: parsedJson['title'] ?? '[null]',
      description: parsedJson['description'] ?? '[null]',
      upc: parsedJson['upc'] ?? '[null]',
      // brand: parsedJson['brand'] ?? '[null]',
      // model: parsedJson['model'] ?? '[null]',
      // color: parsedJson['color'] ?? '[null]',
      // size: parsedJson['size'] ?? '[null]',
      // category: parsedJson['category'] ?? '[null]',
      // lowest_rec_price: parsedJson['lowest_rec_price'] ?? '[null]',
      // highest_rec_price: parsedJson['highest_rec_price'] ?? '[null]',
    );
  }
}

// extractedData = parsed['items'];
// title = extractedData[0]['title'];
// brand = extractedData[0]['brand'];
// category = extractedData[0]['category'];
//   }
// }

// Future<String> lookUp() async {
//   String url = 'https://api.upcitemdb.com/prod/trial/lookup?upc=$_scanBarcode';
//   try {
//     http.Response response = await http.get(url);
//     final convertDataToJson = json.decode(response.body);
//     extractedData = convertDataToJson['items'];
//     title = extractedData[0]['title'];
//     brand = extractedData[0]['brand'];
//     category = extractedData[0]['category'];
//     print(json.decode(response.body));
//     print(extractedData[0]['title']);
//     setState(() {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => Information(title, brand, category)));
//     });
//   } catch (e) {
//     print(e.toString());
//   }
//   return 'Success';
// }
