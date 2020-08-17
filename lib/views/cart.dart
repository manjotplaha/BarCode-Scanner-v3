import 'package:barcode_scanner_v3/Provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var ccart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart View')),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: ListView.builder(
            itemCount: Provider.of<CartProvider>(context).cartItems.length,
            itemBuilder: (context, builder) {
              return Card(
                  child: ListTile(
                      leading:
                          Text('${Provider.of<CartProvider>(context).cartItems}'
                              // 'Article Title',

                              )));
            }),
      ),
    );
  }
}
