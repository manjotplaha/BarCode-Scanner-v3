import 'package:barcode_scanner_v3/Provider/product_provider.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 45,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
              ),
            ),
          ),
        ),
        Text('ADD +', style: TextStyle(color: Colors.green))
      ]),
    );
  }
}

class ProductListView extends StatelessWidget {
  const ProductListView({
    Key key,
    @required this.productProvider,
  }) : super(key: key);

  final ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
      itemCount: productProvider.productsCatalogue.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Container(
          width: 160,
          child: Card(
            elevation: 7,
            clipBehavior: Clip.hardEdge,
            child: Wrap(
              children: [
                Image.network(
                  '${productProvider.productsCatalogue[i].image_src[0]}',
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  cacheHeight: 150,
                  cacheWidth: 150,
                ),
                ListTile(
                  title: Text(
                    '${productProvider.productsCatalogue[i].title}',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Option: ${productProvider.productsCatalogue[i].option}',
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '\$${productProvider.productsCatalogue[i].variant_max_price}',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 1.85,
                                ),
                              ),
                              Text(
                                '\$${productProvider.productsCatalogue[i].variant_price}',
                              ),
                            ],
                          ),
                          AddButton()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TobaccoListView extends StatelessWidget {
  const TobaccoListView({
    Key key,
    @required this.productProvider,
  }) : super(key: key);

  final ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
        itemCount: productProvider.tobaccoProductsCatalogue.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Container(
            width: 160,
            child: Card(
              elevation: 7,
              clipBehavior: Clip.hardEdge,
              child: Wrap(
                children: [
                  Image.network(
                    '${productProvider.tobaccoProductsCatalogue[i].image_src[0]}',
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center,
                    cacheHeight: 150,
                    cacheWidth: 150,
                  ),
                  ListTile(
                    title: Text(
                      '${productProvider.tobaccoProductsCatalogue[i].title}',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Option: ${productProvider.tobaccoProductsCatalogue[i].option}',
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '\$${productProvider.tobaccoProductsCatalogue[i].variant_max_price}',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.red,
                                    decorationThickness: 1.85,
                                  ),
                                ),
                                Text(
                                  '\$${productProvider.tobaccoProductsCatalogue[i].variant_price}',
                                ),
                              ],
                            ),
                            AddButton()
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MedicineListView extends StatelessWidget {
  const MedicineListView({
    Key key,
    @required this.productProvider,
  }) : super(key: key);

  final ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
      itemCount: productProvider.medicineProductsCatalogue.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Container(
          width: 160,
          child: Card(
            elevation: 7,
            clipBehavior: Clip.hardEdge,
            child: Wrap(
              children: [
                Image.network(
                  '${productProvider.medicineProductsCatalogue[i].image_src[0]}',
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  cacheHeight: 150,
                  cacheWidth: 150,
                ),
                ListTile(
                  title: Text(
                    '${productProvider.medicineProductsCatalogue[i].title}',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Option: ${productProvider.medicineProductsCatalogue[i].option}',
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '\$${productProvider.medicineProductsCatalogue[i].variant_max_price}',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 1.85,
                                ),
                              ),
                              Text(
                                '\$${productProvider.medicineProductsCatalogue[i].variant_price}',
                              ),
                            ],
                          ),
                          AddButton()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HygieneListView extends StatelessWidget {
  const HygieneListView({
    Key key,
    @required this.productProvider,
  }) : super(key: key);

  final ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
      itemCount: productProvider.hygieneProductsCatalogue.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Container(
          width: 160,
          child: Card(
            elevation: 7,
            clipBehavior: Clip.hardEdge,
            child: Wrap(
              children: [
                Image.network(
                  '${productProvider.hygieneProductsCatalogue[i].image_src[0]}',
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  cacheHeight: 150,
                  cacheWidth: 150,
                ),
                ListTile(
                  title: Text(
                    '${productProvider.hygieneProductsCatalogue[i].title}',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Option: ${productProvider.hygieneProductsCatalogue[i].option}',
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '\$${productProvider.hygieneProductsCatalogue[i].variant_max_price}',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 1.85,
                                ),
                              ),
                              Text(
                                '\$${productProvider.hygieneProductsCatalogue[i].variant_price}',
                              ),
                            ],
                          ),
                          AddButton()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CandyListView extends StatelessWidget {
  const CandyListView({
    Key key,
    @required this.productProvider,
  }) : super(key: key);

  final ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
      itemCount: productProvider.candyProductsCatalogue.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Container(
          width: 160,
          child: Card(
            elevation: 7,
            clipBehavior: Clip.hardEdge,
            child: Wrap(
              children: [
                Image.network(
                  '${productProvider.candyProductsCatalogue[i].image_src[0]}',
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  cacheHeight: 150,
                  cacheWidth: 150,
                ),
                ListTile(
                  title: Text(
                    '${productProvider.candyProductsCatalogue[i].title}',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Option: ${productProvider.candyProductsCatalogue[i].option}',
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '\$${productProvider.candyProductsCatalogue[i].variant_max_price}',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 1.85,
                                ),
                              ),
                              Text(
                                '\$${productProvider.candyProductsCatalogue[i].variant_price}',
                              ),
                            ],
                          ),
                          AddButton()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ClothesListView extends StatelessWidget {
  const ClothesListView({
    Key key,
    @required this.productProvider,
  }) : super(key: key);

  final ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
      itemCount: productProvider.clothesProductsCatalogue.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Container(
          width: 160,
          child: Card(
            elevation: 7,
            clipBehavior: Clip.hardEdge,
            child: Wrap(
              children: [
                Image.network(
                  '${productProvider.clothesProductsCatalogue[i].image_src[0]}',
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  cacheHeight: 150,
                  cacheWidth: 150,
                ),
                ListTile(
                  title: Text(
                    '${productProvider.clothesProductsCatalogue[i].title}',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Option: ${productProvider.clothesProductsCatalogue[i].option}',
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '\$${productProvider.clothesProductsCatalogue[i].variant_max_price}',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 1.85,
                                ),
                              ),
                              Text(
                                '\$${productProvider.clothesProductsCatalogue[i].variant_price}',
                              ),
                            ],
                          ),
                          AddButton()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class GeneralListView extends StatelessWidget {
  const GeneralListView({
    Key key,
    @required this.productProvider,
  }) : super(key: key);

  final ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
      itemCount: productProvider.generalProductsCatalogue.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Container(
          width: 160,
          child: Card(
            elevation: 7,
            clipBehavior: Clip.hardEdge,
            child: Wrap(
              children: [
                Image.network(
                  '${productProvider.generalProductsCatalogue[i].image_src[0]}',
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  cacheHeight: 150,
                  cacheWidth: 150,
                ),
                ListTile(
                  title: Text(
                    '${productProvider.generalProductsCatalogue[i].title}',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Option: ${productProvider.generalProductsCatalogue[i].option}',
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '\$${productProvider.generalProductsCatalogue[i].variant_max_price}',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 1.85,
                                ),
                              ),
                              Text(
                                '\$${productProvider.generalProductsCatalogue[i].variant_price}',
                              ),
                            ],
                          ),
                          AddButton()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MexicanCandyListView extends StatelessWidget {
  const MexicanCandyListView({
    Key key,
    @required this.productProvider,
  }) : super(key: key);

  final ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
      itemCount: productProvider.mexicanCandyProductsCatalogue.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Container(
          width: 160,
          child: Card(
            elevation: 7,
            clipBehavior: Clip.hardEdge,
            child: Wrap(
              children: [
                Image.network(
                  '${productProvider.mexicanCandyProductsCatalogue[i].image_src[0]}',
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  cacheHeight: 150,
                  cacheWidth: 150,
                ),
                ListTile(
                  title: Text(
                    '${productProvider.mexicanCandyProductsCatalogue[i].title}',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Option: ${productProvider.mexicanCandyProductsCatalogue[i].option}',
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '\$${productProvider.mexicanCandyProductsCatalogue[i].variant_max_price}',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 1.85,
                                ),
                              ),
                              Text(
                                '\$${productProvider.mexicanCandyProductsCatalogue[i].variant_price}',
                              ),
                            ],
                          ),
                          AddButton()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ToysListView extends StatelessWidget {
  const ToysListView({
    Key key,
    @required this.productProvider,
  }) : super(key: key);

  final ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
      itemCount: productProvider.toysProductsCatalogue.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Container(
          width: 160,
          child: Card(
            elevation: 7,
            clipBehavior: Clip.hardEdge,
            child: Wrap(
              children: [
                Image.network(
                  '${productProvider.toysProductsCatalogue[i].image_src[0]}',
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  cacheHeight: 150,
                  cacheWidth: 150,
                ),
                ListTile(
                  title: Text(
                    '${productProvider.toysProductsCatalogue[i].title}',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Option: ${productProvider.toysProductsCatalogue[i].option}',
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '\$${productProvider.toysProductsCatalogue[i].variant_max_price}',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 1.85,
                                ),
                              ),
                              Text(
                                '\$${productProvider.toysProductsCatalogue[i].variant_price}',
                              ),
                            ],
                          ),
                          AddButton()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CarAcessListView extends StatelessWidget {
  const CarAcessListView({
    Key key,
    @required this.productProvider,
  }) : super(key: key);

  final ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
      itemCount: productProvider.carAcessProductsCatalogue.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Container(
          width: 160,
          child: Card(
            elevation: 7,
            clipBehavior: Clip.hardEdge,
            child: Wrap(
              children: [
                Image.network(
                  '${productProvider.carAcessProductsCatalogue[i].image_src[0]}',
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  cacheHeight: 150,
                  cacheWidth: 150,
                ),
                ListTile(
                  title: Text(
                    '${productProvider.carAcessProductsCatalogue[i].title}',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Option: ${productProvider.carAcessProductsCatalogue[i].option}',
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '\$${productProvider.carAcessProductsCatalogue[i].variant_max_price}',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 1.85,
                                ),
                              ),
                              Text(
                                '\$${productProvider.carAcessProductsCatalogue[i].variant_price}',
                              ),
                            ],
                          ),
                          AddButton()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ToileteriesListView extends StatelessWidget {
  const ToileteriesListView({
    Key key,
    @required this.productProvider,
  }) : super(key: key);

  final ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
      itemCount: productProvider.toiliteriesProductsCatalogue.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Container(
          width: 160,
          child: Card(
            elevation: 7,
            clipBehavior: Clip.hardEdge,
            child: Wrap(
              children: [
                Image.network(
                  '${productProvider.toiliteriesProductsCatalogue[i].image_src[0]}',
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  cacheHeight: 150,
                  cacheWidth: 150,
                ),
                ListTile(
                  title: Text(
                    '${productProvider.toiliteriesProductsCatalogue[i].title}',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Option: ${productProvider.toiliteriesProductsCatalogue[i].option}',
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '\$${productProvider.toiliteriesProductsCatalogue[i].variant_max_price}',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 1.85,
                                ),
                              ),
                              Text(
                                '\$${productProvider.toiliteriesProductsCatalogue[i].variant_price}',
                              ),
                            ],
                          ),
                          AddButton()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
