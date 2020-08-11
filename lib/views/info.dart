import 'package:barcode_scanner_v3/views/cart.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  final String title;
  final String brand;
  final String category;

  const Information(this.title, this.brand, this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Information'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway'),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Text('Brand:',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6))),
                      SizedBox(width: 5.0),
                      Text(brand,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6))),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    category,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.end,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Cart(title, brand);
                    },
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.shopping_cart),
                        Text('Add To Cart',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
