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
  List images;
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
  // // ignore: non_constant_identifier_names
  num lowest_recorded_price;
  // // String lowestRecPrice = lowest_rec_price.toString();
  // // // ignore: non_constant_identifier_names
  num highest_recorded_price;

  Items({
    this.images,
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

    // // ignore: non_constant_identifier_names
    this.lowest_recorded_price,
    // // ignore: non_constant_identifier_names
    this.highest_recorded_price,
  });

  factory Items.fromJson(Map<String, dynamic> parsedJson) {
    return Items(
      quantity: 1,
      images: parsedJson['images'] ?? '[null]',
      ean: parsedJson['ean'] ?? '[null]',
      title: parsedJson['title'] ?? '[null]',
      description: parsedJson['description'] ?? '[null]',
      upc: parsedJson['upc'] ?? '[null]',
      brand: parsedJson['brand'] ?? '[null]',
      model: parsedJson['model'] ?? '[null]',
      color: parsedJson['color'] ?? '[null]',
      size: parsedJson['size'] ?? '[null]',
      category: parsedJson['category'] ?? '[null]',
      lowest_recorded_price: parsedJson['lowest_recorded_price'] ?? '[null]',
      highest_recorded_price: parsedJson['highest_recorded_price'] ?? '[null]',
    );
  }
}
