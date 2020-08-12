import 'package:barcode_scanner_v3/models/info_model.dart';
import 'package:barcode_scanner_v3/services/article_service.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  final String barCode;

  Information(this.barCode);

  void barcode(barCode) {
    print(barCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Item Information')),
        body: FutureBuilder<Article>(
          future: lookUp(barCode),
          builder: (BuildContext context, AsyncSnapshot<Article> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error');
              }
              return Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  width: double.infinity,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
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
                            Text(
                                'Description:  ${snapshot.data.items[0].description}',
                                style: contentsStyling()),
                            SizedBox(height: 15.0),
                            Text(
                              'Category:  ${snapshot.data.items[0].category}',
                              textAlign: TextAlign.end,
                              style: contentsStyling(),
                            ),
                            RaisedButton(
                              onPressed: () {},
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.shopping_cart),
                                  Text(
                                    'Add To Cart',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ])));
            } else {
              CircularProgressIndicator();
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  TextStyle contentsStyling() {
    return TextStyle(fontSize: 13.5, color: Colors.grey[600]);
  }
}
// d: Column(children: <Widget>[
//           Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     title,
//                     style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Raleway'),
//                   ),
//                   SizedBox(height: 10.0),
//                   Row(
//                     children: <Widget>[
//                       Text('Brand:',
//                           style:
//                               TextStyle(color: Colors.black.withOpacity(0.6))),
//                       SizedBox(width: 5.0),
//                       Text(brand,
//                           style:
//                               TextStyle(color: Colors.black.withOpacity(0.6))),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 30.0,
//                   ),
//                   Text(
//                     category,
//                     style: TextStyle(
//                       color: Colors.black.withOpacity(0.6),
//                     ),
//                     textAlign: TextAlign.end,
//                   ),
//                   RaisedButton(
//                     onPressed: () {
//                       Cart(title, brand);
//                     },
//                     color: Colors.red,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0)),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(Icons.shopping_cart),
//                         Text('Add To Cart',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16.0,
//                                 fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ]),
