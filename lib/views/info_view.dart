import 'package:barcode_scanner_v3/Provider/cart_provider.dart';
import 'package:barcode_scanner_v3/models/info_model.dart';
import 'package:barcode_scanner_v3/services/article_service.dart';
import 'package:barcode_scanner_v3/shared/Animator&Decorations.dart';
import 'package:barcode_scanner_v3/shared/widgets/ShimmerLoader.dart';
import 'package:barcode_scanner_v3/views/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Information extends StatelessWidget {
  final Methods methodName = Methods();

  final String barCode;

  Information(this.barCode);

  void barcode(barCode) {
    print(barCode);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 350,
      child: FutureBuilder<Article>(
        future: lookUp(barCode),
        builder: (BuildContext context, AsyncSnapshot<Article> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error');
            }
            return buildInfoView(snapshot, context);
          } else {}
          return ShimmerLoader();
        },
      ),
    );
  }

  Padding buildInfoView(AsyncSnapshot<Article> snapshot, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: ListView(children: [
        Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${snapshot.data.items[0].title}',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand'),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${snapshot.data.items[0].images[0]}')))),
                  // NetworkImage('snapshot.data.items[0].images'),
                  Text('Brand:  ${snapshot.data.items[0].brand}',
                      style: contentsStyling()),
                  Text('Color:  ${snapshot.data.items[0].color}',
                      style: contentsStyling()),
                  Text('UPC:  ${snapshot.data.items[0].upc}',
                      style: contentsStyling()),
                  SizedBox(height: 15.0),
                  Text(
                      'Highest Price Recorded:  \$${snapshot.data.items[0].highest_recorded_price}',
                      style: contentsStyling()),
                  Text(
                      'Lowest Price Recorded:  \$${snapshot.data.items[0].lowest_recorded_price}',
                      style: contentsStyling()),
                  SizedBox(height: 15.0),
                  Text(
                    'Category:  ${snapshot.data.items[0].category}',
                    textAlign: TextAlign.end,
                    style: contentsStyling(),
                  ),
                  ButtonBar(children: [
                    ChangeNotifierProvider(
                      create: (BuildContext context) {
                        CartProvider();
                      },
                      child: RaisedButton(
                        onPressed: () async {
                          // Navigator.pushNamed(context, '/cart');
                          try {
                            Navigator.of(context).push(
                                methodName.buildAnimatedRoute(CartView()));
                            Provider.of<CartProvider>(context, listen: false)
                                .add(snapshot.data);
                          } catch (error) {
                            await showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text('An Error Occured'),
                                content: Text('Somethhing Went Wrong !'),
                                actions: [
                                  FlatButton(
                                      onPressed: Navigator.of(ctx).pop,
                                      child: null)
                                ],
                              ),
                            );
                          }
                        },
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.shopping_cart),
                            Text(
                              'Add To Cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])
                ])),
      ]),
    );
  }

  TextStyle contentsStyling() {
    return TextStyle(fontSize: 13.5, color: Colors.black87);
  }
}
