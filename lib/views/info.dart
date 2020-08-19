import 'package:barcode_scanner_v3/Provider/cart_provider.dart';
import 'package:barcode_scanner_v3/models/info_model.dart';
import 'package:barcode_scanner_v3/services/article_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Information extends StatelessWidget {
  final String barCode;

  Information(this.barCode);

  void barcode(barCode) {
    print(barCode);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: FutureBuilder<Article>(
        future: lookUp(barCode),
        builder: (BuildContext context, AsyncSnapshot<Article> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error');
            }
            return Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
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
                      Text('Brand:  ${snapshot.data.items[0].brand}',
                          style: contentsStyling()),
                      Text('Color:  ${snapshot.data.items[0].color}',
                          style: contentsStyling()),
                      Text('UPC:  ${snapshot.data.items[0].upc}',
                          style: contentsStyling()),
                      SizedBox(
                        height: 15.0,
                      ),
                      // Text(
                      //     'Description:  ${snapshot.data.items[0].description}',
                      //     style: contentsStyling()),
                      // SizedBox(height: 15.0),
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
                            onPressed: () {
                              Navigator.pushNamed(context, '/cart');
                              Provider.of<CartProvider>(context)
                                  .add(snapshot.data);
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
                    ]));
          } else {
            CircularProgressIndicator();
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  TextStyle contentsStyling() {
    return TextStyle(fontSize: 13.5, color: Colors.black.withOpacity(0.6));
  }
}
