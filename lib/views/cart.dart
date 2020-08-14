import 'package:barcode_scanner_v3/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart View')),
      body: ListView.builder(
          itemCount: Provider.of<Cart>(context).cartItems.length,
          itemBuilder: (context, builder) {
            return Card(
                child: ListTile(
                    leading: Text(
              'Article Title',
              // ccart.cartItems[]
            )));
          }),
    );
  }
}
