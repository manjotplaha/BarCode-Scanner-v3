class Article {
  List<Items> items;

  Article({this.items});

  factory Article.fromJson(Map<String, dynamic> parsedJson) {
    try {
      var list = parsedJson['items'] as List;
      List<Items> items = list.map((i) => Items.fromJson(i)).toList();
      return Article(items: items);
    } catch (e) {
      print('Error in model');
      print(e.toString());
    }
    return null;
  }
}

class Items {
  String ean;
  String title;
  String description;
  String upc;
  String brand;
  String model;
  String color;
  String size;
  String category;
  int quantity;
  // ignore: non_constant_identifier_names
  num lowest_rec_price;
  // String lowestRecPrice = lowest_rec_price.toString();
  // // ignore: non_constant_identifier_names
  num highest_rec_price;

  Items({
    this.ean,
    this.title,
    this.description,
    this.upc,
    this.brand,
    this.model,
    this.color,
    this.size,
    this.category,
    this.quantity,

    // ignore: non_constant_identifier_names
    this.lowest_rec_price,
    // ignore: non_constant_identifier_names
    this.highest_rec_price,
  });

  factory Items.fromJson(Map<String, dynamic> parsedJson) {
    return Items(
      quantity: 1,
      ean: parsedJson['ean'] ?? '[null]',
      title: parsedJson['title'] ?? '[null]',
      description: parsedJson['description'] ?? '[null]',
      upc: parsedJson['upc'] ?? '[null]',
      brand: parsedJson['brand'] ?? '[null]',
      model: parsedJson['model'] ?? '[null]',
      color: parsedJson['color'] ?? '[null]',
      size: parsedJson['size'] ?? '[null]',
      category: parsedJson['category'] ?? '[null]',
      lowest_rec_price: parsedJson['lowest_rec_price'] ?? '[null]',
      highest_rec_price: parsedJson['highest_rec_price'] ?? '[null]',
    );
  }
}
