import 'package:barcode_scanner_v3/Provider/cart_provider.dart';
import 'package:barcode_scanner_v3/shared/bars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartItem = Provider.of<CartProvider>(context, listen: false).cartItems;
    return Scaffold(
      appBar: buildAppBar(context, 'CartView'),
      body: cartItem.isEmpty
          ? Center(
              child: Text(
              'Add Something to your Cart !',
              style: Theme.of(context).textTheme.headline6,
            ))
          : ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: ListView.builder(
                  itemCount: cartItem.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        title: Text('${cartItem[i].items[0].title}'),
                        subtitle: Text('${cartItem[i].items[0].upc}'),
                        trailing: FittedBox(
                          child: ButtonBar(children: [
                            IconButton(
                                icon: Icon(Icons.remove_circle_outline),
                                onPressed: null),
                            Text(('1')),
                            IconButton(
                                icon: Icon(Icons.add_circle_outline),
                                onPressed: null)
                          ]),
                        ),
                      ),
                    );
                  }),
            ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
